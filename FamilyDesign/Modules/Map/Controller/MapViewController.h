//
//  MapViewController.h
//  FamilyDesign
//
//  Created by lyc on 2020/6/15.
//  Copyright © 2020 知行. All rights reserved.
//

#import "ZXBaseViewController.h"
#import "AreaBKModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : ZXBaseViewController

@property(nonatomic, strong) NSArray <AreaBKModel *> *areaModelArray;

@end

NS_ASSUME_NONNULL_END
