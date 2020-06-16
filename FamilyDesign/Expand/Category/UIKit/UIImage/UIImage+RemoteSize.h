//
//  UIImage+RemoteSize.h
//  FamilyDesign
//
//  Created by lyc on 2020/5/19.
//  Copyright © 2020 知行. All rights reserved.
//
//  获取远程图片的大小


#import <UIKit/UIKit.h>
typedef void (^UIImageSizeRequestCompleted) (NSURL* imgURL, CGSize size);
NS_ASSUME_NONNULL_BEGIN

@interface UIImage (RemoteSize)
/**
 *  @brief 获取远程图片的大小
 *
 *  @param imgURL     图片url
 *  @param completion 完成回调
 */
+ (void)requestSizeNoHeader:(NSURL*)imgURL completion:(UIImageSizeRequestCompleted)completion;
/**
 *  @brief  从header中获取远程图片的大小 (服务器必须支持)
 *
 *  @param imgURL     图片url
 *  @param completion 完成回调
 */
//+ (void)requestSizeWithHeader:(NSURL*)imgURL completion:(UIImageSizeRequestCompleted)completion;

@end

NS_ASSUME_NONNULL_END
