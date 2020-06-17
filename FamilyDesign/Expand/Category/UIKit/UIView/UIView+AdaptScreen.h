//
//  UIView+AdaptScreen.h
//  FamilyDesign
//
//  Created by lyc on 2020/6/16.
//  Copyright © 2020 知行. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BSAdaptScreenWidthType) {
    AdaptScreenWidthTypeNone = 0,
    BSAdaptScreenWidthTypeConstraint = 1<<0, /**< 对约束的constant等比例 */
    BSAdaptScreenWidthTypeFontSize = 1<<1, /**< 对字体等比例 */
    BSAdaptScreenWidthTypeCornerRadius = 1<<2, /**< 对圆角等比例 */
    BSAdaptScreenWidthTypeAll = 1<<3, /**< 对现有支持的属性等比例 */
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AdaptScreen)

/**
 遍历当前view对象的subviews和constraints，对目标进行等比例换算
 
 @param type 想要和基准屏幕等比例换算的属性类型
 @param exceptViews 需要对哪些类进行例外
 */
- (void)adaptScreenWidthWithType:(BSAdaptScreenWidthType)type
                     exceptViews:(NSArray<Class> *)exceptViews;

@end

NS_ASSUME_NONNULL_END
