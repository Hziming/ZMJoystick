//
//  DoubleJoysticks.m
//  ZMJoystick
//
//  Created by 黄子鸿 on 2017/5/24.
//  Copyright © 2017年 黄子鸿. All rights reserved.
//

#import "DoubleJoysticks.h"
#import "ZMJoystick.h"
@interface DoubleJoysticks ()

@property (weak, nonatomic) IBOutlet UIView *leftJoystickBackView;

@property (weak, nonatomic) IBOutlet UIView *rightJoystickBackView;

@end


@implementation DoubleJoysticks


+ (DoubleJoysticks *)joystickWithFrame:(CGRect)frame
{
    DoubleJoysticks *joystick = [[[NSBundle mainBundle] loadNibNamed:@"DoubleJoysticks" owner:nil options:nil] firstObject];
    joystick.frame = frame;
    
    return joystick;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    ZMJoystick *joystick = [ZMJoystick joystickWithFrame:self.leftJoystickBackView.bounds];
    
    [joystick setReturnPar:^(NSUInteger vertical, NSUInteger horizontal){
        
    }];
    
    [self.leftJoystickBackView addSubview:joystick];
    
    
    ZMJoystick *joystick2 = [ZMJoystick joystickWithFrame:self.rightJoystickBackView.bounds];
    
    [joystick2 setReturnPar:^(NSUInteger vertical, NSUInteger horizontal){
        
    }];
    
    [self.rightJoystickBackView addSubview:joystick2];
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
