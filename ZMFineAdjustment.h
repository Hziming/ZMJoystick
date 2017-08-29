//
//  ZMFineAdjustment.h
//  ZMJoystick
//
//  Created by 黄子鸿 on 2017/5/25.
//  Copyright © 2017年 黄子鸿. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    ZMFineAdjustmentDirectionVertical,
    ZMFineAdjustmentDirectionHorizontal
} ZMFineAdjustmentDirection;


@interface ZMFineAdjustment : UIView

@property (nonatomic, assign) NSUInteger nowAdjustableValue;


+ (ZMFineAdjustment *)fineAdjustmentWithFrame:(CGRect)frame;


+ (ZMFineAdjustment *)fineAdjustmentWithFrame:(CGRect)frame direction:(ZMFineAdjustmentDirection)direction;


@end
