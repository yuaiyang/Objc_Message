//
//  NSURL+YAYUrl.m
//  Objc_Message
//
//  Created by 一路财富 on 2018/2/6.
//  Copyright © 2018年 YAY. All rights reserved.
//  更改系统函数方法用

#import "NSURL+YAYUrl.h"
#import <objc/runtime.h>

@implementation NSURL (YAYUrl)
// 这个方法是在源文件加载的时候就调用，基本是最早的
+(void)load {
    // 获取新旧方法
    Method oldMethod = class_getClassMethod(self, @selector(URLWithString:));
    Method newMethod = class_getClassMethod(self, @selector(YAY_URLWithString:));
    // 交换方法
    method_exchangeImplementations(oldMethod, newMethod);
}

+ (nullable instancetype)YAY_URLWithString:(NSString *)URLString {
    // 创建一个url   在这里不能调用URLWithString 否则会造成死循环 所以这里调用YAY_URLWithString实际就是调用了URLWithString
    NSURL *url = [NSURL YAY_URLWithString:URLString];
    if (url == nil) {
        NSLog(@"网址为空");
    }
    return url;
}
@end
