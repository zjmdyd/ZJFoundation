//
//  ZJNSNumberViewController.m
//  ZJFoundation
//
//  Created by YunTu on 15/6/13.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJNSNumberViewController.h"

@interface ZJNSNumberViewController ()

@end

@implementation ZJNSNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber *num1 = [NSNumber numberWithInt:1];
    NSLog(@"num1 = %@, %p", num1, num1);
    
    NSNumber *num2 = [NSNumber numberWithInt:1];
    NSLog(@"num2 = %@, %p", num2, num2);
    
    NSNumber *num3 = [NSNumber numberWithFloat:1];
    NSLog(@"num3 = %@, %p", num3, num3);
    /*
     当num1和num2由同一个基本数据转化而来时, 在内存中只会创建一个对象
     num1 = 1, 0x14e096c0
     num2 = 1, 0x14e096c0
     
     当基本数据的数据类型不同时,会创建一个新的对象
     num3 = 1, 0x16d45360
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
