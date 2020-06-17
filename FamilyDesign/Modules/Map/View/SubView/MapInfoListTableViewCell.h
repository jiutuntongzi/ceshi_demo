//
//  MapInfoListTableViewCell.h
//  FamilyDesign
//
//  Created by lyc on 2020/6/16.
//  Copyright © 2020 知行. All rights reserved.
//

#import "ZXBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MapInfoListTableViewCell : ZXBaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *subtTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *danjiaLabel;

@end

NS_ASSUME_NONNULL_END
