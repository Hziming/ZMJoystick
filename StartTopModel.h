//
//  StartTopModel.h
//  ZMJoystick
//
//  Created by 黄子鸿 on 2017/5/24.
//  Copyright © 2017年 黄子鸿. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    
    ZMTouchEventsBack = 0,
    ZMTouchEventsPhotograph,
    ZMTouchEventsRecording,
    ZMTouchEventsFolder,
    ZMTouchEventsHomeward,
    ZMTouchEvents3D,
    ZMTouchEventsWifi,
    ZMTouchEventsSwitch,
    
} ZMTouchEventsType;





@interface StartTopModel : NSObject

@property (nonatomic, strong) NSString *imageName;

@property (nonatomic, strong) NSIndexPath *indexPath;

//@property (nonatomic, assign)


+ (NSArray *)getData;


@end
