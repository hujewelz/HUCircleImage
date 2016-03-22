//
//  UIImageView+ClipRadius.m
//  memeta
//
//  Created by mac on 16/3/14.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import "UIImageView+ClipRadius.h"
#import "UIImage+ClipCircle.h"
#import "HUWebImageDownloader.h"
//#import <SDImageCache.h>
//#import <SDWebImageManager.h>
//#import <SDWebImageDownloader.h>

@implementation UIImageView (ClipRadius)

- (void)hu_setCornerRadius:(CGFloat)radius {
    self.image = [self.image circleImageWithsize:self.frame.size radius:radius borderWidth:0 borderColor:nil];
}

- (void)hu_setImageWithUrl:(NSURL *)imageUrl cornerRadius:(CGFloat)radius {
    
    [self hu_setImageWithUrl:imageUrl cornerRadius:radius completed:nil];
}

- (void)hu_setImageWithUrl:(NSURL *)imageUrl cornerRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    [self hu_setImageWithUrl:imageUrl cornerRadius:radius borderWidth:borderWidth borderColor:borderColor completed:nil];
}

- (void)hu_setImageWithUrl:(NSURL *)imageUrl cornerRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor completed:(void (^)(UIImage *))completed {
    
    [HUWebImageDownloader downloadImageWithURL:imageUrl option:HUWebImageOptionNone completed:^(UIImage *image, NSError *error, NSURL *imageUrl) {
        if (!image) {
            if (completed) {
                completed(image);
            }
            return ;
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *circleimage = [image circleImageWithsize:self.frame.size radius:radius borderWidth:borderWidth borderColor:borderColor];
            // [[SDImageCache sharedImageCache] storeImage:circleimage forKey:imageURL.absoluteString toDisk:YES];
            [[HUWebImageDownloader sharedInstance] saveImage:circleimage forKey:imageUrl.absoluteString toDisk:YES];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = circleimage;
                if (completed) {
                    completed(circleimage);
                }
            });
            
            
        });
    }];
    
    

}

- (void)hu_setImageWithUrl:(NSURL *)imageUrl cornerRadius:(CGFloat)radius completed:(void(^)(UIImage *))completed {
    
    [self hu_setImageWithUrl:imageUrl cornerRadius:radius borderWidth:0 borderColor:nil completed:completed];
//    [HUWebImageDownloader downloadImageWithURL:imageUrl option:HUWebImageOptionNone completed:^(UIImage *image, NSError *error, NSURL *imageUrl) {
//        if (!image) {
//            if (completed) {
//                completed(image);
//            }
//            return ;
//        }
//        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            UIImage *circleimage = [image circleImageWithsize:self.frame.size radius:radius borderWidth:0 borderColor:nil];
//           // [[SDImageCache sharedImageCache] storeImage:circleimage forKey:imageURL.absoluteString toDisk:YES];
//            [[HUWebImageDownloader sharedInstance] saveImage:circleimage forKey:imageUrl.absoluteString toDisk:YES];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                self.image = circleimage;
//                if (completed) {
//                    completed(circleimage);
//                }
//            });
//            
//            
//        });
//    }];
//


//    NSString *key = [[SDWebImageManager sharedManager] cacheKeyForURL:imageUrl];
//    UIImage *image = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:key];
//    if (image) {
//        self.image = image;
//       // NSLog(@"------------------image from memory------------");
//        if (completed) {
//            completed(image);
//        }
//    }
//    else {
//        UIImage *diskImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:key];
//        
//        if (diskImage) {
//           // NSLog(@"----------------image from disk-----------");
//            self.image = diskImage;
//            if (completed) {
//                completed(diskImage);
//            }
//        }
//        else {
//            [[SDWebImageManager sharedManager] downloadImageWithURL:imageUrl options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//                
//            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//                if (!image) {
//                    if (completed) {
//                        completed(image);
//                    }
//                    return ;
//                }
//                
//                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                    UIImage *circleimage = [image circleImageWithsize:self.frame.size radius:radius borderWidth:0 borderColor:nil];
//                    [[SDImageCache sharedImageCache] storeImage:circleimage forKey:imageURL.absoluteString toDisk:YES];
//                    
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        self.image = circleimage;
//                        if (completed) {
//                            completed(circleimage);
//                        }
//                    });
//                    
//                    
//                });
//            }];
//        }
//    }
}


@end
