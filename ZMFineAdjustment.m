//
//  ZMFineAdjustment.m
//  ZMJoystick
//
//  Created by 黄子鸿 on 2017/5/25.
//  Copyright © 2017年 黄子鸿. All rights reserved.
//

#import "ZMFineAdjustment.h"

static NSUInteger adjustableValue = 128;

@interface ZMFineAdjustment ()
{
    CGFloat line_w;
    CGFloat slider_w;
}

@property (nonatomic, assign) ZMFineAdjustmentDirection direction;


@property (weak, nonatomic) IBOutlet UIImageView *slider;
@property (weak, nonatomic) IBOutlet UIImageView *line;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLayout;


@property (nonatomic, assign) CGFloat minAdjustableValue;  //每一次微调的值



@end

@implementation ZMFineAdjustment

- (void)awakeFromNib
{
    [super awakeFromNib];
}


+ (ZMFineAdjustment *)fineAdjustmentWithFrame:(CGRect)frame
{
    return [ZMFineAdjustment fineAdjustmentWithFrame:frame direction:ZMFineAdjustmentDirectionHorizontal];
}


+ (ZMFineAdjustment *)fineAdjustmentWithFrame:(CGRect)frame direction:(ZMFineAdjustmentDirection)direction
{
    ZMFineAdjustment *fineAdjustment = [[[NSBundle mainBundle] loadNibNamed:@"ZMFineAdjustment" owner:nil options:nil] firstObject];
    
    fineAdjustment.direction = direction;
    
    fineAdjustment.nowAdjustableValue = adjustableValue * 0.5;
    
    switch (direction) {
        case ZMFineAdjustmentDirectionVertical:{
            
            fineAdjustment.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.height, frame.size.width);
            fineAdjustment.center = CGPointMake(frame.size.width * 0.5, frame.size.height * 0.5);

            break;
        }
        case ZMFineAdjustmentDirectionHorizontal:
            
            fineAdjustment.frame = frame;

            break;
        default:
            break;
    }
    
    return fineAdjustment;
}




- (IBAction)minusClick:(UIButton *)sender {
    
    if (self.nowAdjustableValue <= 0) {
        return;
    }
    
    self.leftLayout.constant -= _minAdjustableValue;
    
    self.nowAdjustableValue = (self.leftLayout.constant / (line_w - slider_w)) * adjustableValue;
    
    NSLog(@"--- %ld", self.nowAdjustableValue);
//    NSLog(@"=== %f", self.leftLayout.constant);

}


- (IBAction)addClick:(UIButton *)sender {
    
    if (self.nowAdjustableValue >= adjustableValue) {
        return;
    }
    
    self.leftLayout.constant += _minAdjustableValue;
    
    self.nowAdjustableValue = (self.leftLayout.constant / (line_w - slider_w)) * adjustableValue;
    
    NSLog(@"--- %ld", self.nowAdjustableValue);
//    NSLog(@"=== %f", self.leftLayout.constant);

}


- (void)drawRect:(CGRect)rect {

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        line_w = self.line.bounds.size.width;
        slider_w = self.slider.bounds.size.width;
        
        _minAdjustableValue = (line_w - slider_w) / adjustableValue;
        
        self.leftLayout.constant = _minAdjustableValue * adjustableValue * 0.5;
        
        if (self.direction == ZMFineAdjustmentDirectionVertical) {
            CGAffineTransform trans = CGAffineTransformRotate(self.transform, - M_PI / 2);
            self.transform = CGAffineTransformIdentity;
            self.transform = trans;
        }
        
    });
    
}



@end
