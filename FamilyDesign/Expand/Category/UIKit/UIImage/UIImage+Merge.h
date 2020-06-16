//
//  UIImage+Merge.h
//  FamilyDesign
//
//  Created by lyc on 2020/5/19.
//  Copyright © 2020 知行. All rights reserved.
//
//  合并

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Merge)
/**
 *  @brief  合并两个图片
 *
 *  @param firstImage  一个图片
 *  @param secondImage 二个图片
 *
 *  @return 合并后图片
 */
+ (UIImage*)mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;
@end

NS_ASSUME_NONNULL_END
