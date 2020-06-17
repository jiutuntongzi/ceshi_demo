//
//  AreaBKModel.h
//  FamilyDesign
//
//  Created by lyc on 2020/6/17.
//  Copyright © 2020 知行. All rights reserved.
//

#import "ZXBaseModel.h"
#import "AreaBKPlaceInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface AreaBKModel : ZXBaseModel

@property(nonatomic, copy) NSString *border;
@property(nonatomic, assign) float latitude;
@property(nonatomic, assign) float longitude;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSArray <AreaBKPlaceInfoModel *>*placeInfos;
@property(nonatomic, assign) BOOL status;
@property(nonatomic, assign) long unit_price;

@end

NS_ASSUME_NONNULL_END
