//
//  MapInfoListView.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/16.
//  Copyright © 2020 知行. All rights reserved.
//

#import "MapInfoListView.h"
#import "MapInfoListViewModel.h"

@interface MapInfoListView()

@property(nonatomic, strong) MapInfoListViewModel *mapInfoListViewModel;
@property(nonatomic, strong) ZXBaseTableView *table;

@end

@implementation MapInfoListView

- (instancetype)initWithViewModel:(ZXBaseViewModel *)viewModel{
    self = [super initWithViewModel:viewModel];
    if (self) {
        _mapInfoListViewModel = (MapInfoListViewModel *)viewModel;
    }
    return self;
}

- (void)renderViews{
    [super renderViews];
    [self configUI];
}

- (void)bindViewModel{
    [super bindViewModel];
}

- (void)configUI{
    [self addSubview:self.table];
    [self.mapInfoListViewModel handleWithTable:self.table];
}

- (ZXBaseTableView *)table{
    if (nil == _table) {
        _table = [[ZXBaseTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT) style:UITableViewStylePlain];
    }
    return _table;
}
- (MapInfoListViewModel *)mapInfoListViewModel{
    if (nil == _mapInfoListViewModel) {
        _mapInfoListViewModel = [MapInfoListViewModel new];
    }
    return _mapInfoListViewModel;
}
@end
