//
//  ZJNSExceptionViewController.m
//  ZJFoundation
//
//  Created by YunTu on 15/8/11.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJNSExceptionViewController.h"

@interface ZJNSExceptionViewController ()

@end

@implementation ZJNSExceptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *ary;
    @try {
        NSLog(@"ary = %@", ary[0]);
        
        NSException *exception = [NSException exceptionWithName: @"数组为空"
                                                         reason: @"数组未初始化"
                                                       userInfo: nil];
        @throw exception;
    }
    @catch (NSException *exception) {
        NSLog(@"exception : %@, %@", exception.name, exception.reason);
    }
    @finally {
        ary = [NSArray arrayWithObjects:@0, @1, nil];
        NSLog(@"ary = %@", ary);
    }
}

- (void)mode2 {
    @try {
        @try {
            [self performSegueWithIdentifier:@"" sender:nil];
        }
        @catch (NSException *exception) {
            @throw exception;
        }
        @finally {
            NSLog(@"内层@finally");
        }
    }
    @catch (NSException *exception) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"功能尚未完成此项" message:@"\n继续努力" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        NSLog(@"exception : %@, %@", exception.name, exception.reason);
    }
    @finally {
        NSLog(@"外层@finally");
    }
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
