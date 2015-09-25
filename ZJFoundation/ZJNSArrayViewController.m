//
//  ZJNSArrayViewController.m
//  ZJFoundation
//
//  Created by YunTu on 15/6/5.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJNSArrayViewController.h"

@interface ZJNSArrayViewController ()

@end

@implementation ZJNSArrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self assignAndInit];
    
    [self enumerate];
}

/**
 *  赋值和初始化:未初始化的数组(nil)count属性值也为0
 *
 */
- (void)assignAndInit {
    NSMutableArray *a = [NSMutableArray arrayWithObjects:@"a", nil];
    NSMutableArray *b = a;
    NSLog(@"\n%@, %p\n%@, %p", a, a, b, b);
    
    /* a, b完全一样
     (
     a
     ), 0x14d58780
     (
     a
     ), 0x14d58780
     */
    
    NSMutableArray *c;
    NSLog(@"c = %@, %p, count = %d", c, c, c.count);    // c = (null), 0x0, count = 0
    
    c = [NSMutableArray array];
    NSLog(@"c = %@, %p, count = %d", c, c, c.count);     // c = (), 0x145476b0, count = 0
    
    // 连接字符串API
    NSArray *pathArray = [NSArray arrayWithObjects:@"here", @"be", @"dragons", nil];
    NSLog(@"%@", [pathArray componentsJoinedByString:@" "]);
}

/**
 *  for...in...也是有顺序的
 */
- (void)enumerate {
    NSMutableArray *a = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [a addObject:[NSString stringWithFormat:@"%d", i]];
    }
    for (NSString *s in a) {
        NSLog(@"s = %@", s);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
