//
//  AreaBKPlaceInfoModel.h
//  FamilyDesign
//
//  Created by lyc on 2020/6/17.
//  Copyright © 2020 知行. All rights reserved.
//

#import "ZXBaseModel.h"
#import "AreaBKSiteInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface AreaBKPlaceInfoModel : ZXBaseModel

@property(nonatomic, copy) NSString *border;
@property(nonatomic, assign) float latitude;
@property(nonatomic, assign) float longitude;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) BOOL status;
@property(nonatomic, assign) long unit_price;
@property(nonatomic, strong) NSArray <AreaBKSiteInfoModel *>*siteInfos;

@end

NS_ASSUME_NONNULL_END
