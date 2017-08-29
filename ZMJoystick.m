//
//  ZMJoystick.m
//  ZMJoystick
//
//  Created by 黄子鸿 on 2017/5/23.
//  Copyright © 2017年 黄子鸿. All rights reserved.
//

#import "ZMJoystick.h"

static NSUInteger joystickVaule = 0xff;

@interface ZMJoystick ()

@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@property (weak, nonatomic) IBOutlet UIImageView *joystickImage;

@property (weak, nonatomic) IBOutlet UIButton *joystickBtn;

@end


@implementation ZMJoystick


+ (ZMJoystick *)joystick
{
    return [ZMJoystick joystickWithFrame:CGRectZero];
}


+ (ZMJoystick *)joystickWithFrame:(CGRect)frame
{
    ZMJoystick *joystick = [[[NSBundle mainBundle] loadNibNamed:@"ZMJoystick" owner:nil options:nil] firstObject];
    joystick.frame = frame;
    return joystick;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.vertical = joystickVaule * 0.5;
    self.horizontal = joystickVaule * 0.5;
}






- (IBAction)joysticTouchDown:(UIButton *)sender {
    
    NSLog(@"TouchDown");

    [sender removeFromSuperview];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"touchesBegan");
    
    UITouch *touchCenter = [touches anyObject];
    
    CGPoint point1 = [touchCenter locationInView:self];
    
    [self point:point1 inCircleRect:self.backImage.frame];

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touchCenter = [touches anyObject];
    
    CGPoint point1 = [touchCenter locationInView:self];

    [self point:point1 inCircleRect:self.backImage.frame];


}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.joystickImage.center = self.backImage.center;
    self.vertical = joystickVaule * 0.5;
    self.horizontal = joystickVaule * 0.5;
}


//圆心到点的距离 > 半径
- (void)point:(CGPoint)point inCircleRect:(CGRect)rect {
    
    CGFloat r = rect.size.width/2.0;   //圆的半径
    CGPoint center = CGPointMake(rect.origin.x + r, rect.origin.y + r); //圆心
    
    double a = fabs(point.x - center.x);    // a            /|
    double b = fabs(point.y - center.y);    // b         c / |b
    double c = hypot(a, b);                 // c          /__|
                                            //              a
    if (c <= r) {   //点击的位置在圆内
        
        self.joystickImage.center = point;
        
    } else {
        //圆参数方程 x = m + r*cosθ, y = n + r*sinθ   (m,n)为圆心
        if (point.x > center.x && point.y < center.y) {         //一项限   以圆心为原点来分象限
                                                    //     m + r * cosθ             n + r * sinθ
            self.joystickImage.center = CGPointMake(center.x + r * (a / c) , center.y - r * (b / c));
            
        } else if (point.x < center.x && point.y < center.y) {  //二项限
            
            self.joystickImage.center = CGPointMake(center.x - r * (a / c) , center.y - r * (b / c));
            
        } else if (point.x < center.x && point.y > center.y) {  //三项限
            
            self.joystickImage.center = CGPointMake(center.x - r * (a / c) , center.y + r * (b / c));
            
        } else if (point.x > center.x && point.y > center.y) {  //四项限
            
            self.joystickImage.center = CGPointMake(center.x + r * (a / c) , center.y + r * (b / c));
            
        }
        
    }
                                                                                //  (边长、直径)
    CGFloat vertical = (self.backImage.center.y - self.joystickImage.center.y + r) / (r * 2);
    
    CGFloat horizontal = (self.joystickImage.center.x - self.backImage.center.x + r) / (r * 2);
    
//    NSLog(@"vertical:%f ---  horizontal:%f", vertical, horizontal);
    
    if (vertical > 0.999)   vertical = 1.0;
    if (vertical < 0.001)   vertical = 0.0;

    if (horizontal > 0.999)   horizontal = 1.0;
    if (horizontal < 0.001)   horizontal = 0.0;
    
//    NSLog(@"vertical:%ld ---  horizontal:%ld", v, h);
    
    if (self.returnPar) {
        
        NSUInteger v = vertical * joystickVaule;
        
        NSUInteger h = horizontal * joystickVaule;

        self.returnPar(v, h);
    }
    
//    return c <= r;
}

// 重力感应
- (void)setVertical:(NSUInteger)vertical
{
    _vertical = vertical;
}


- (void)setHorizontal:(NSUInteger)horizontal
{
    _horizontal = horizontal;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}



@end
