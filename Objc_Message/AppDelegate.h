//
//  AppDelegate.h
//  Objc_Message
//
//  Created by 一路财富 on 2018/2/6.
//  Copyright © 2018年 YAY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

