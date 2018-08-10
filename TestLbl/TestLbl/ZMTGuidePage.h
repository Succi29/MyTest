//
//  ZMTGuidePage.h
//  TestLbl
//
//  Created by Succi on 2018/1/12.
//  Copyright © 2018年 Succi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ClickBlock)(void);
@interface ZMTGuidePage : UIView
{
    NSString *_name;
}
/**
 @param frames 装有图片frame的数组
 @param names  装有图片名称的数组，需要与frames个数一致，否则显示会无法显示这张图片
 @param pageKey 保证这个引导页只展示一次的key，为当前页面的名称
 @param index 需要哪一张图片可点击传对应的index 0..2
 @param block 可点击图片的点击事件
 */
+(void)showGuidePageWithImgFrames:(NSArray<NSValue *>*)frames andImgNames:(NSArray<NSString *>*)names andPageName:(NSString *)pageKey andclickIndex:(NSInteger)index clickBlock:(ClickBlock)block;
@end
