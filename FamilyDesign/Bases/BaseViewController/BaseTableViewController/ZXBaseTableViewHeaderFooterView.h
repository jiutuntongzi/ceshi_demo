//
//  ZXBaseTableViewHeaderFooterView.h
//  ZXBaseView_Example
//
//  Created by lyc on 2018/3/15.
//  Copyright © 2018年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXBaseTableViewHeaderFooterView : UITableViewHeaderFooterView

/**
 *  代理
 */
@property (nonatomic, weak) id delegate;

/**
 *  缩进边界
 */
@property (nonatomic, assign) UIEdgeInsets viewEdgeInsets;

/**
 *  功能:获取cell的唯一标识符
 */
+ (NSString *)cellReuseIdentifier;

/**
 根据数据源获取高度

 @param aData 数据源
 @return 高度
 */
+ (CGFloat)heightForCellData:(id)aData;

/**
 *  功能:获取cell对应的xib
 */
+ (UINib *)nib;

/**
 更新数据

 @param aData 数据源
 */
- (void)updateWithCellData:(id)aData;

@end
