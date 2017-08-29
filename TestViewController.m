//
//  TestViewController.m
//  ZMJoystick
//
//  Created by 黄子鸿 on 2017/5/25.
//  Copyright © 2017年 黄子鸿. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property (weak, nonatomic) IBOutlet UIView *xcxc;


@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    CGAffineTransform trans = CGAffineTransformRotate(self.xcxc.transform, M_PI / 2);
    self.xcxc.transform = CGAffineTransformIdentity;
    self.xcxc.transform = trans;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
