//
//  ViewController.m
//  Objc_Message
//
//  Created by 一路财富 on 2018/2/6.
//  Copyright © 2018年 YAY. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>



@interface ViewController ()
// 探索iOS KVO 属性使用
@property (nonatomic, strong)Person* person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // oc_callSelector调用方法。初步了解方法调用
    [self oc_callSelector];
    
    //exChangeSystemSelector 更改系统函数方法
    [self exChangeSystemSelector];
    
    // 探索iOS KVO
    [self exploreiOSKVO];
}

#pragma Mark -- 探索iOS KVO
- (void)exploreiOSKVO {
    Person *p = [[Person alloc] init];
    [p addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:nil];
    _person = p;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@",_person.name);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i = 0;
    i++;
    _person.name = [NSString stringWithFormat:@"我的名字是%d",i];
}

#pragma Mark -- 更改系统函数方法
- (void)exChangeSystemSelector {
    NSURL *url = [NSURL URLWithString:@"www.baidu.com汉字"];
    NSLog(@"%@",url);
}

#pragma Mark -- 调用方法。初步了解方法调用
- (void)oc_callSelector {
    [Person eat];
    Person *p = [[Person alloc] init];
    // 调用方法1
    [p eat];
    // 调用方法2 @selector是一个方法编号 对应一个 imp 一一对应
    [p performSelector:@selector(eat)];
    // 调用方法2
    //    如果调用message方法没有参数提示，那么需要设置一下 项目->build settings ->搜索msg（enable strict checking of objc_msgSend Calls） ->将其设置为NO 这样就有提示啦
    //    objc_msgSend()
    
    objc_msgSend([[Person alloc] init], @selector(eat));
    objc_msgSend(p, @selector(eat));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
