//
//  DoubleJoysticks.m
//  ZMJoystick
//
//  Created by 黄子鸿 on 2017/5/24.
//  Copyright © 2017年 黄子鸿. All rights reserved.
//

#import "DoubleJoysticks.h"
#import "ZMJoystick.h"
#import "ZMFineAdjustment.h"
@interface DoubleJoysticks ()

@property (weak, nonatomic) IBOutlet UIView *leftJoystickBackView;

@property (weak, nonatomic) IBOutlet UIView *rightJoystickBackView;

@property (weak, nonatomic) IBOutlet UIView *leftFineAdjustmentView;

@property (weak, nonatomic) IBOutlet UIView *rightFineAdjustmentView;

@property (weak, nonatomic) IBOutlet UIView *sidesFineAdjustmentView;
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
  
}





// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    NSLog(@"%@", NSStringFromCGRect(rect));
    
    NSLog(@"11111111---- %@", NSStringFromCGRect(self.leftJoystickBackView.bounds));

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"2222222222---- %@", NSStringFromCGRect(self.leftJoystickBackView.bounds));
    });
    
    
    ZMJoystick *joystick = [ZMJoystick joystickWithFrame:self.leftJoystickBackView.bounds];
    
    [joystick setReturnPar:^(NSUInteger vertical, NSUInteger horizontal){
        
    }];
    
    [self.leftJoystickBackView addSubview:joystick];
    
    
    ZMJoystick *joystick2 = [ZMJoystick joystickWithFrame:self.rightJoystickBackView.bounds];
    
    [joystick2 setReturnPar:^(NSUInteger vertical, NSUInteger horizontal){
        
    }];
    
    [self.rightJoystickBackView addSubview:joystick2];
    
    
    ZMFineAdjustment *fineAdjustment1 = [ZMFineAdjustment fineAdjustmentWithFrame:self.leftFineAdjustmentView.bounds];
    
    [self.leftFineAdjustmentView addSubview:fineAdjustment1];
    

    ZMFineAdjustment *fineAdjustment2 = [ZMFineAdjustment fineAdjustmentWithFrame:self.rightFineAdjustmentView.bounds];
    
    [self.rightFineAdjustmentView addSubview:fineAdjustment2];
    

    ZMFineAdjustment *fineAdjustment3 = [ZMFineAdjustment fineAdjustmentWithFrame:self.sidesFineAdjustmentView.bounds direction:ZMFineAdjustmentDirectionVertical];

    [self.sidesFineAdjustmentView addSubview:fineAdjustment3];


    
}


@end
