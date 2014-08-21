//
//  UIImage+SWImage.h
//  manpower
//
//  Created by WangShunzhou on 14-6-27.
//  Copyright (c) 2014 WangShunzhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SWImage)
- (UIImage *)imageByScalingToSize:(CGSize)size;
- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize;
- (UIImage *)rotate:(UIImageOrientation)orient;
- (UIImage *)imageByScalingToMaxSize;
@end
