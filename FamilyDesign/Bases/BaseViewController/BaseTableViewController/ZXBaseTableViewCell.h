//
//  ZXBaseTableViewCell.h
//  ZXBaseView_Example
//
//  Created by lyc on 2018/3/15.
//  Copyright © 2018年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXBaseTableViewCell : UITableViewCell

/**
 * 子类使用的模型对象
 */
@property (nonatomic, strong) id cellModel;

/**
 *  index
 */
@property (nonatomic, strong) NSIndexPath *indexPath;

/**
 *  代理
 */
@property (nonatomic, weak) id delegate;

/**
 *  缩进边界
 */
@property (nonatomic) UIEdgeInsets cellEdgeInsets;

+ (CGFloat)heightForCellData:(id)aData;

+ (CGFloat)heightForCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath;

+ (NSString *)cellReuseIdentifier;

+ (UINib *)nib;

+ (id)initTableViewCellWithTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style;

+ (id)loadNibTableViewCellWithTableView:(UITableView *)tableView;

- (void)renderViews;

- (void)updateWithCellData:(id)aData;

- (CGFloat)getCellHeight;

- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath;

@end
