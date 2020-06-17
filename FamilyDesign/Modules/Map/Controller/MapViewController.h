//
//  MapViewController.h
//  FamilyDesign
//
//  Created by lyc on 2020/6/15.
//  Copyright © 2020 知行. All rights reserved.
//

#import "ZXBaseViewController.h"
#import "AreaBKModel.h"
#import "AreaBKPlaceInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    ZXMapTypeFirst = 0,             /// 第一层
    ZXMapTypeSecond,              /// 第二层
    ZXMapTypeThird,               /// 第三层
} ZXMapInfoType;

@interface MapViewController : ZXBaseViewController

@property(nonatomic, strong) NSArray <AreaBKModel *> *areaModelArray;

@end

NS_ASSUME_NONNULL_END
