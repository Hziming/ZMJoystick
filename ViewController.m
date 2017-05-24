//
//  ViewController.m
//  ZMJoystick
//
//  Created by 黄子鸿 on 2017/5/23.
//  Copyright © 2017年 黄子鸿. All rights reserved.
//

#import "ViewController.h"
#import "ZMJoystick.h"
#import "DoubleJoysticks.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *leftLab;

@property (weak, nonatomic) IBOutlet UILabel *rightLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    __weak ViewController *weakself = self;
//    
//    ZMJoystick *joystick = [ZMJoystick joystickWithFrame:CGRectMake(50, 50, 250, 250)];
//    
//    [joystick setReturnPar:^(NSUInteger vertical, NSUInteger horizontal){
//        
//        weakself.leftLab.text = [NSString stringWithFormat:@"%0.2lX, %0.2lX", (unsigned long)vertical, (unsigned long)horizontal];
//    }];
//    
//    [self.view addSubview:joystick];
//    
//    
//    ZMJoystick *joystick2 = [ZMJoystick joystickWithFrame:CGRectMake(350, 50, 250, 250)];
//
//    [joystick2 setReturnPar:^(NSUInteger vertical, NSUInteger horizontal){
//        
//        weakself.rightLab.text = [NSString stringWithFormat:@"%0.2lX, %0.2lX", (unsigned long)vertical, (unsigned long)horizontal];
//    }];
//    
//    [self.view addSubview:joystick2];
    
    DoubleJoysticks *joystick = [DoubleJoysticks joystickWithFrame:CGRectMake(0, 94, self.view.frame.size.width, self.view.frame.size.height - 94)];

    [self.view addSubview:joystick];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
