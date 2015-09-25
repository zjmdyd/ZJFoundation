//
//  ViewController.m
//  ZJFoundation
//
//  Created by YunTu on 15/8/18.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ViewController.h"
#import "ZJNSNumberViewController.h"

#import "ZJNSArrayViewController.h"
#import "ZJNSSetViewController.h"
#import "ZJNSDictionaryViewController.h"
#import "ZJNSPredicateViewController.h"

#import "ZJNSStringViewController.h"

#import "ZJNSDateViewController.h"

#import "ZJCoreDataViewController.h"
#import "ZJNSKeyedArchiverViewController.h"

#import "ZJNSOperationViewController.h"
#import "ZJGCDViewController.h"
#import "ZJNSLockViewController.h"
#import "ZJNSRunLoopViewController.h"

#import "ZJLocalNotificationViewController.h"

#import "ZJNSTimerViewController.h"
#import "ZJNSExceptionViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate> {
    NSArray *_sectionTitles, *_titles;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

static NSString *CELLID = @"cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initAry];
}

- (void)initAry {
    _sectionTitles = [NSArray arrayWithObjects:@"数据类型篇", @"数组集合篇", @"字符篇", @"时间篇", @"数据存储篇", @"多线程篇", @"通知篇", @"其他", nil];
    
    NSArray *s1 = @[@"NSNumber"];
    NSArray *s2 = @[@"NSArray" , @"NSSet", @"NSDictionary", @"NSPredicate"];
    NSArray *s3 = @[@"NSString"];
    NSArray *s4 = @[@"NSDate", @"clockDemo"];
    NSArray *s5 = @[@"NSKeyedArchiver", @"CoreData"];
    NSArray *s6 = @[@"NSThread", @"NSOperation", @"GCD", @"NSLock", @"NSRunloop"];
    NSArray *s7 = @[@"LocalNotification"];
    NSArray *s8 = @[@"FilePath", @"NSTimer", @"NSException"];
    _titles = @[s1, s2, s3, s4, s5, s6, s7, s8];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sectionTitles.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _sectionTitles[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_titles[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }

    cell.textLabel.text = _titles[indexPath.section][indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc;
    NSInteger row = indexPath.row;
    if (indexPath.section == 0) {
        if (row == 0) {
            vc = [[ZJNSNumberViewController alloc] init];
        }
    }else if (indexPath.section == 1) {
        if (row == 0) {
            vc = [[ZJNSArrayViewController alloc] init];
        }else if (row == 1) {
            vc = [[ZJNSSetViewController alloc] init];
        }else if (row == 2) {
            vc = [[ZJNSDictionaryViewController alloc] init];
        }else if (row == 3) {
            vc = [[ZJNSPredicateViewController alloc] init];
        }
    }else if (indexPath.section == 2) {
        if (row == 0) {
            vc = [[ZJNSStringViewController alloc] init];
        }
    }else if (indexPath.section == 3) {
        if (row == 0) {
            vc = [[ZJNSDateViewController alloc] init];
        }else if (row == 1) {
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"clock"];
        }
    }else if (indexPath.section == 4) {
        if (row == 0) {
            vc = [[ZJNSKeyedArchiverViewController alloc] init];
        }else if (row == 1) {
            vc = [[ZJCoreDataViewController alloc] init];
        }
    }else if (indexPath.section == 5) {
        if (row == 0) {
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NSThreadVC"];
        }else if (row == 1) {
            vc = [[ZJNSOperationViewController alloc] init];
        }else if (row == 2) {
            vc = [[ZJGCDViewController alloc] init];
        }else if (row == 3) {
            vc = [[ZJNSLockViewController alloc] init];
        }else if (row == 4) {
            vc = [[ZJNSRunLoopViewController alloc] init];
        }
    }else if (indexPath.section == 6) {
        if (row == 0) {
            vc = [[ZJLocalNotificationViewController alloc] init];
        }else if (row == 1) {
            vc = [[ZJNSTimerViewController alloc] init];
        }
    }else if (indexPath.section == 7) {
        if (row == 0) {
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"filePathVC"];
        }else if (row == 1) {
            vc = [[ZJNSTimerViewController alloc] init];
        }else if (row == 2) {
            vc = [[ZJNSExceptionViewController alloc] init];
        }
    }
    
    if (vc) {
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
