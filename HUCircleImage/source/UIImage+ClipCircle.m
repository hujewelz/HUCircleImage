//
//  UIImage+ClipCircle.m
//  HUCircleImage
//
//  Created by mac on 16/3/19.
//  Copyright (c) 2016年 hujewelz. All rights reserved.
//

#import "UIImage+ClipCircle.h"

@implementation UIImage (ClipCircle)

- (UIImage *)circleImageWithsize:(CGSize)size radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    // 1.加载原图
    // UIImage *oldImage = image;
    
    // 2.开启上下文
    CGFloat imageW = size.width;// + 3 * borderWidth;
    CGFloat imageH = size.height ;//+ 3 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [UIScreen mainScreen].scale);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    if (borderWidth > 0) {
        CGFloat borderRadius = radius + borderWidth > MIN(imageW, imageH) ? MIN(imageW, imageH) : radius + borderWidth;
        UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, imageW, imageH) cornerRadius:borderRadius];
        [borderColor setFill];
        CGContextAddPath(ctx, borderPath.CGPath);
        CGContextFillPath(ctx);
    }
    
    CGFloat roundW = imageW - 2*borderWidth;
    CGFloat roundH = imageH - 2*borderWidth;
    CGFloat clipRadius = MIN(radius,  MIN(imageH, imageW));
    UIBezierPath *roundPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(borderWidth, borderWidth, roundW, roundH) cornerRadius:clipRadius];
    
    CGContextAddPath(ctx, roundPath.CGPath);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [self drawInRect:CGRectMake(0, 0, imageW, imageH)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    if (!newImage) {
        NSLog(@"切图失败");
    }
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    
    return newImage;
}


@end
