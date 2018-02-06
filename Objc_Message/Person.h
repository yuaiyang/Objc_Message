//
//  Person.h
//  Objc_Message
//
//  Created by 一路财富 on 2018/2/6.
//  Copyright © 2018年 YAY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

// KVO 使用属性
@property (nonatomic, strong)NSString* name;

//调用方法 用
- (void)eat;
+(void)eat;
@end
