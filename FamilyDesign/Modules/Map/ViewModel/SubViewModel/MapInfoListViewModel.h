//
//  MapInfoListViewModel.h
//  FamilyDesign
//
//  Created by lyc on 2020/6/16.
//  Copyright © 2020 知行. All rights reserved.
//

#import "ZXBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MapInfoListViewModel : ZXBaseViewModel<UITableViewDelegate,UITableViewDataSource>

- (void)handleWithTable:(UITableView *)table;

- (void)getDataWithModelArray:(NSArray *(^)(void))modelArrayBlock completion:(void (^)())completion;

@end

NS_ASSUME_NONNULL_END
