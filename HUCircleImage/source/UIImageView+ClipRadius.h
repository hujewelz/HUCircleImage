//
//  UIImageView+ClipRadius.h
//  memeta
//
//  Created by mac on 16/3/14.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIImageView (ClipRadius)

- (void)hu_setCornerRadius:(CGFloat)radius;
- (void)hu_setImageWithUrl:(NSURL *)imageUrl CornerRadius:(CGFloat)radius;
- (void)hu_setImageWithUrl:(NSURL *)imageUrl CornerRadius:(CGFloat)radius completed:(void(^)(UIImage *))completed;

@end
