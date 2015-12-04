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
#import "ZJNSOperationDownLoaderDemoVC.h"

#import "ZJLocalNotificationViewController.h"

#import "ZJNSTimerViewController.h"
#import "ZJNSExceptionViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate> {
    NSArray *_sectionTitles, *_titles, *_vcs;
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
    
    NSArray *s0 = @[@"NSNumber"];
    NSArray *s1 = @[@"NSArray" , @"NSSet", @"NSDictionary", @"NSPredicate"];
    NSArray *s2 = @[@"NSString"];
    NSArray *s3 = @[@"NSDate", @"clockDemo"];
    NSArray *s4 = @[@"NSKeyedArchiver", @"CoreData"];
    NSArray *s5 = @[@"NSThread", @"NSOperation", @"GCD", @"NSLock", @"NSRunloop", @"DownLoaderDemo"];
    NSArray *s6 = @[@"LocalNotification"];
    NSArray *s7 = @[@"FilePath", @"NSTimer", @"NSException"];
    _titles = @[s0, s1, s2, s3, s4, s5, s6, s7];
    
    NSArray *vc0 = @[
                     [ZJNSNumberViewController new]
                     ];
    NSArray *vc1 = @[
                     [ZJNSArrayViewController new],
                     [ZJNSSetViewController new],
                     [ZJNSDictionaryViewController new],
                     [ZJNSPredicateViewController new]
                     ];
    NSArray *vc2 = @[
                     [ZJNSStringViewController new]
                     ];
    NSArray *vc3 = @[
                     [ZJNSDateViewController new],
                     [self.storyboard instantiateViewControllerWithIdentifier:@"clock"]
                     ];
    NSArray *vc4 = @[
                     [ZJNSKeyedArchiverViewController new],
                     [ZJCoreDataViewController new]
                     ];
    NSArray *vc5 = @[
                     [self.storyboard instantiateViewControllerWithIdentifier:@"NSThreadVC"],
                     [ZJNSOperationViewController new],
                     [ZJGCDViewController new],
                     [ZJNSLockViewController new],
                     [ZJNSRunLoopViewController new],
                     [self.storyboard instantiateViewControllerWithIdentifier:@"downloaderDemo"],
                     ];
    NSArray *vc6 = @[
                     [ZJNSLockViewController new]
                     ];
    NSArray *vc7 = @[
                     [self.storyboard instantiateViewControllerWithIdentifier:@"filePathVC"],
                     [ZJNSTimerViewController new],
                     [ZJNSExceptionViewController new],
                     ];
    _vcs = @[vc0, vc1, vc2, vc3, vc4, vc5, vc6, vc7];
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
    
    UIViewController *vc = _vcs[indexPath.section][indexPath.row];
    
    if (vc) {
        vc.title = _titles[indexPath.section][indexPath.row];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
