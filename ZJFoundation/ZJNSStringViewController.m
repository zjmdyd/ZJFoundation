//
//  ZJNSStringViewController.m
//  ZJFoundation
//
//  Created by YunTu on 15/6/30.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJNSStringViewController.h"

@interface ZJNSStringViewController ()

@end

@implementation ZJNSStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *a = @"汉字";
    
    NSLog(@"a = %@", a);    // a = 汉字
    NSLog(@"%d",  [NSString defaultCStringEncoding]); // 30 -- NSMacOSRomanStringEncoding 
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
