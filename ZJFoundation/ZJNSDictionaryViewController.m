//
//  ZJNSDictionaryViewController.m
//  ZJFoundation
//
//  Created by YunTu on 15/9/6.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJNSDictionaryViewController.h"

@interface ZJNSDictionaryViewController ()

@end

@implementation ZJNSDictionaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    NSMutableArray *ary = [NSMutableArray arrayWithObjects:@"a", @"b", @"c", nil];
    
    for (NSString *key in ary) {
        dic[key] = [NSString stringWithFormat:@"value_%@", key];    //给键为key的元素赋值为value_key
    }
    
    NSLog(@"dic = %@\ncount = %lu", dic, (unsigned long)dic.count);
    NSLog(@"allvalues = %@", [dic allValues]);
    /*
     dic = {
     a = "value_a";
     b = "value_b";
     c = "value_c";
     }
     count = 3
     */
    
    for (NSString *str in dic) {
        NSLog(@"%@", str);      //遍历字典所有的键
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
