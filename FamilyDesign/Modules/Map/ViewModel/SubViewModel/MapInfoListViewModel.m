//
//  MapInfoListViewModel.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/16.
//  Copyright © 2020 知行. All rights reserved.
//

#import "MapInfoListViewModel.h"

static NSString * const kMyCellIndentifier = @"MapInfoListTableViewCell";

@interface MapInfoListViewModel ()

@property(nonatomic, strong) NSArray *dataArrayList;

@end

@implementation MapInfoListViewModel

- (NSArray *)dataArrayList {
    if (_dataArrayList == nil) {
        _dataArrayList = [NSMutableArray array];
    }
    return _dataArrayList;
}

- (void)handleWithTable:(UITableView *)table {
    table.delegate = self;
    table.dataSource = self;
    [UITableViewCell smk_registerTable:table nibIdentifier:kMyCellIndentifier];
}

- (void)getDataWithModelArray:(NSArray *(^)(void))modelArrayBlock completion:(void (^)(void))completion {
    if (modelArrayBlock) {
        self.dataArrayList = modelArrayBlock();
        if (completion) {
            completion();
        }
    }
 
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.dataArrayList[indexPath.row];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    id item = [self itemAtIndexPath:indexPath] ;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMyCellIndentifier forIndexPath:indexPath] ;
//    [cell smk_configure:cell model:item indexPath:indexPath];
    
    return cell ;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
    
    id item = [self itemAtIndexPath:indexPath] ;
    
    return [tableView fd_heightForCellWithIdentifier:kMyCellIndentifier cacheByIndexPath:indexPath configuration:^(UITableViewCell *cell) {
        [cell smk_configure:cell model:item indexPath:indexPath];
    }];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
