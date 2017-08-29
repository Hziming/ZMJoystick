//
//  StartTopModel.m
//  ZMJoystick
//
//  Created by 黄子鸿 on 2017/5/24.
//  Copyright © 2017年 黄子鸿. All rights reserved.
//

#import "StartTopModel.h"

@implementation StartTopModel


- (instancetype)initWithImageName:(NSString *)imageName
{
    self = [super init];
    
    if (self) {
        
        _imageName = imageName;
    }
    
    return self;
}




+ (NSArray *)getData
{
    StartTopModel *model1 = [[StartTopModel alloc] initWithImageName:@"返回"];
    StartTopModel *model2 = [[StartTopModel alloc] initWithImageName:@"照相机"];
    StartTopModel *model3 = [[StartTopModel alloc] initWithImageName:@"摄影机"];
    StartTopModel *model4 = [[StartTopModel alloc] initWithImageName:@"文件夹"];
    StartTopModel *model5 = [[StartTopModel alloc] initWithImageName:@"一键返航"];
    StartTopModel *model6 = [[StartTopModel alloc] initWithImageName:@"3D"];
    StartTopModel *model7 = [[StartTopModel alloc] initWithImageName:@"4"];
    StartTopModel *model8 = [[StartTopModel alloc] initWithImageName:@"ON"];

    
    return @[model1, model2, model3, model4, model5, model6, model7, model8];
}

@end
