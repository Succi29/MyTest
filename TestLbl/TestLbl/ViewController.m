//
//  ViewController.m
//  TestLbl
//
//  Created by Succi on 2018/1/12.
//  Copyright © 2018年 Succi. All rights reserved.
//

#import "ViewController.h"
#import "ZMTGuidePage.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    UIView *view = [self creatViewWithTagString:@"我是你爷爷" andCount:100];
//    //自己改位置
//    view.center = self.view.center;
//    [self.view addSubview:view];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSArray *frames = @[[NSValue valueWithCGRect:CGRectMake(10, 20, 50, 50)],[NSValue valueWithCGRect:CGRectMake(80, 80, 80, 80)],[NSValue valueWithCGRect:CGRectMake(200, 200, 80, 80)]];
    NSArray *names = @[@"58",@"87",@"120"];
    [ZMTGuidePage showGuidePageWithImgFrames:frames andImgNames:names andPageName:NSStringFromClass([self class]) andclickIndex:2 clickBlock:^{
        NSLog(@"你点我了！！");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(UIView *)creatViewWithTagString:(NSString *)string andCount:(int)count{
//    NSString *countString = [NSString stringWithFormat:@"X%d",count];
//    CGFloat tagWidth = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}].width;
//    CGFloat countWidth = [countString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}].width;
//
//    UIView *tagView = [[UIView alloc]init];
//    tagView.bounds = CGRectMake(0, 0, tagWidth + countWidth + 30, 44);
//    tagView.backgroundColor = [UIColor clearColor];
//
//    UILabel *taglbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tagWidth + 20,  CGRectGetHeight(tagView.bounds))];
//    taglbl.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    taglbl.layer.cornerRadius = 5.0f;
//    taglbl.layer.masksToBounds = YES;
//    //自己改颜色和字体大小
//    taglbl.backgroundColor = [UIColor orangeColor];
//    taglbl.textColor =[UIColor greenColor];
//    taglbl.font = [UIFont systemFontOfSize:15];
//    taglbl.textAlignment = NSTextAlignmentCenter;
//    taglbl.text = string;
//    [tagView addSubview:taglbl];
//
//    UILabel *countlbl = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(taglbl.frame), 0, countWidth + 10, CGRectGetHeight(tagView.bounds))];
//    countlbl.backgroundColor = [UIColor clearColor];
//    countlbl.textColor =[UIColor greenColor];
//    countlbl.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    //自己改字体大小
//    countlbl.font = [UIFont systemFontOfSize:15];
//    countlbl.textAlignment = NSTextAlignmentCenter;
//    countlbl.text = countString;
//    [tagView addSubview:countlbl];
//    return tagView;
//}
@end
