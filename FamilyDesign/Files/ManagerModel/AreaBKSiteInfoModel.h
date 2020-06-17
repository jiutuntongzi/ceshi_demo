//
//  AreaSiteInfoModel.h
//  FamilyDesign
//
//  Created by lyc on 2020/6/17.
//  Copyright © 2020 知行. All rights reserved.
//

#import "ZXBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AreaBKSiteInfoModel : ZXBaseModel

@property(nonatomic, assign) float latitude;
@property(nonatomic, assign) float longitude;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) BOOL status;

@end

NS_ASSUME_NONNULL_END
