//
//  AppDelegate.h
//  ZMJoystick
//
//  Created by 黄子鸿 on 2017/5/23.
//  Copyright © 2017年 黄子鸿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

