//
//  MapInfoListTableViewCell.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/16.
//  Copyright © 2020 知行. All rights reserved.
//

#import "MapInfoListTableViewCell.h"

@implementation MapInfoListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.titleLable.font = kFont(17);
//    [self adaptScreenWidthWithType:BSAdaptScreenWidthTypeAll exceptViews:nil];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)smk_configure:(UITableViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath {
}

@end
