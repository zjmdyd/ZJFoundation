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
    NSLog(@"%zd",  [NSString defaultCStringEncoding]); // 30 -- NSMacOSRomanStringEncoding
    
    NSDictionary *attr = @{
                           NSFontAttributeName:[UIFont systemFontOfSize:30],
                           NSForegroundColorAttributeName:[UIColor greenColor]
                           };
    //NSDictionary *dic = [NSDictionary dictionaryWithObject:<#(id)#> forKey:<#(id<NSCopying>)#>];   //前键后值
    NSLog(@"%@", attr);
    NSAttributedString *str = [[NSAttributedString alloc]initWithString:@"helloworldchina" attributes:attr];
    //self.label.attributedText = str;
    
    NSMutableAttributedString *str2 = [str mutableCopy];
    [str2 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 4)];    //NSMakeRange(loc, len)
    [str2 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:60] range:NSMakeRange(5, 7)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    label.center = self.view.center;
    [self.view addSubview:label];
    label.attributedText = str2;
/*
    //画字符串
    - (void)drawRect:(CGRect)rect
    {
        NSString *str1 = @"helloafnssdfghjbnkxdcvgbhnj";
        //在view上画字符串
        [[UIColor redColor]setFill];
        
        [str1 drawAtPoint:CGPointMake(10, 30) withFont:[UIFont systemFontOfSize:30]];   //从起始坐标开始画，不换行，长字符串会超出页面范围
        
        //指定字符串所占页面的大小, 此方法存在的问题：不能根据字符串自身的大小调整字符串页面所占空间的大小，必须为字符串分配足够的页面空间，否则字符串若果超过为其分配的页面大小，则不能完整显示字符串，所以用下面一种方法先计算字符串所占的大小
        NSString *str2 = @"kobeafnskfnkldsajkmasf,ndm,zxnfjdsfskaldaksjldddddddddddkfjdsafmkewjnfjecnndcnd";
        [str2 drawInRect:CGRectMake(10, 100, 90, 40) withFont:[UIFont systemFontOfSize:30]];
        //计算字符串所占页面的大小
        NSString *str3 = @"helloafnskfnkldsajkmasf,ndm,zxnfjdsfskaldaksjldddddddddddkfjdsafmkewjnfjecnndcn";
        CGSize size = [str3 sizeWithFont:[UIFont systemFontOfSize:20] constrainedToSize:CGSizeMake(180, 100)];
        NSLog(@"width = %0.f, height = %0.f", size.width, size.height);//width = 171, height = 72
        //按字符串所占页面的大小画出字符串，与上一个方法相比，此方法能节省页面空间：它可根据自身的大小调整字符串在页面中所占空间的大小，此方法可以首先给出足够大的大小，大了也可以通过计算最后也只拥有适合的页面大小，但如果要显示长字符串，给出的页面大小也必须足够大，
        [str3 drawInRect:CGRectMake(40, 200, size.width, size.height) withFont:[UIFont systemFontOfSize:20]];
    }
    
    //计算字符串的大小
    
    CGRect frame = [self.status.text boundingRectWithSize:CGSizeMake(kDeviceWidth-10, 320) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
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
