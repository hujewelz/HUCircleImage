//
//  UIImageView+ClipRadius.h
//  memeta
//
//  Created by mac on 16/3/14.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIImageView (ClipRadius)
/**设置圆角图片*/
- (void)hu_setCornerRadius:(CGFloat)radius;

/**
 * 设置网络图片圆角
 * @param iamgeUrl 图片url
 * @param radius 圆角
 */
- (void)hu_setImageWithUrl:(NSURL *)imageUrl cornerRadius:(CGFloat)radius;

/**设置网络图片圆角带回调*/
- (void)hu_setImageWithUrl:(NSURL *)imageUrl cornerRadius:(CGFloat)radius completed:(void(^)(UIImage *))completed;
- (void)hu_setImageWithUrl:(NSURL *)imageUrl cornerRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
- (void)hu_setImageWithUrl:(NSURL *)imageUrl cornerRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor completed:(void(^)(UIImage *))completed;


@end
