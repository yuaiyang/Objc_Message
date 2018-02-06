//
//  Person.m
//  Objc_Message
//
//  Created by 一路财富 on 2018/2/6.
//  Copyright © 2018年 YAY. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat {
    NSLog(@"类对象_吃饭啦！！！");
}

+(void)eat {
    NSLog(@"类_吃饭啦！！！");
}
@end
