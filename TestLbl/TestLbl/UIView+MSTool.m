//
//  UIView+MSTool.m
//  MJRefreshExample
//
//  Created by Succi on 2018/7/26.
//  Copyright © 2018年 小码哥. All rights reserved.
//

#import "UIView+MSTool.h"
#import <objc/runtime.h>
static const void *nameKey = &nameKey;
@implementation UIView (MSTool)
@dynamic name,ms_width,ms_height;
-(void)setMs_width:(CGFloat)ms_width {
    CGRect rect = self.frame;
    rect.size.width = ms_width;
    self.frame = rect;
}

-(CGFloat)ms_width {
    return self.frame.size.width;
}

- (NSString *)name {
    return objc_getAssociatedObject(self, nameKey);
}

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, nameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
