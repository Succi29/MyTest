//
//  ZMTGuidePage.m
//  TestLbl
//
//  Created by Succi on 2018/1/12.
//  Copyright © 2018年 Succi. All rights reserved.
//

#import "ZMTGuidePage.h"
@interface ZMTGuidePage()
@property(nonatomic,copy)ClickBlock clickBlock;
@end
@implementation ZMTGuidePage

+(void)showGuidePageWithImgFrames:(NSArray<NSValue *>*)frames andImgNames:(NSArray<NSString *>*)names andPageName:(NSString *)pageKey andclickIndex:(NSInteger)index clickBlock:(ClickBlock)block{
    
    if ([self isShwoGuideWithPageKey:pageKey]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        ZMTGuidePage *page = [[ZMTGuidePage alloc]initWithFrame:[UIScreen mainScreen].bounds andImgFrames:frames andImgNames:names andClickIndex:index];
        page.backgroundColor = [UIColor blackColor];
        page.alpha = 0.7;
        page.tag = 115;
        page.userInteractionEnabled = YES;
        page.clickBlock = block;
        [window addSubview:page];
    }
}

//初始化
-(instancetype)initWithFrame:(CGRect)frame andImgFrames:(NSArray<NSValue *>*)frames andImgNames:(NSArray<NSString *>*)names andClickIndex:(NSInteger)index{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        self.alpha = 0.7;
        for (int i = 0 ; i < frames.count; i ++) {
            CGRect frame =[frames[i] CGRectValue];
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:frame];
            if (i<names.count) {
                imgView.image = [UIImage imageNamed:names[i]];
            }
            if (i == index) {
                imgView.userInteractionEnabled = YES;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickOnImg)];
                [imgView addGestureRecognizer:tap];
            }
            [self addSubview:imgView];
        }
    }
    return self;
}

//可点击图片的点击事件
-(void)clickOnImg{
    if (self.clickBlock) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        if ([window viewWithTag:115]) {
            [[window viewWithTag:115] removeFromSuperview];
        }
        self.clickBlock();
    }
}

//保证此页面只展示一次的方法
+(BOOL)isShwoGuideWithPageKey:(NSString *)guideKey{
    //取出当前版本
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    //取出之前保存的版本
    if ([[NSUserDefaults standardUserDefaults] valueForKey:guideKey]) {
        //跟当前版本一致，说明打开过
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:guideKey] isEqualToString:app_Version]) {
            return NO;
        }
        //跟当前版本不一致说明更新了，没打开过
        return YES;
    }
    //取不到证明没有打开过
    [[NSUserDefaults standardUserDefaults] setValue:app_Version forKey:guideKey];
    return YES;
}
@end
