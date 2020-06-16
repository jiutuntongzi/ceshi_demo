//
//  ZXBaseViewModel.m
//  FamilyDesign
//
//  Created by lyc on 2020/5/19.
//  Copyright © 2020 知行. All rights reserved.
//

#import "ZXBaseViewModel.h"
@interface ZXBaseViewModel()

@property (nonatomic, copy, readwrite) NSDictionary * params;

@end

@implementation ZXBaseViewModel
#pragma mark 附带执行
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    ZXBaseViewModel *viewModel = [super allocWithZone:zone];
    @weakify(viewModel);
    [[viewModel rac_signalForSelector:@selector(initWithValueParams:)] subscribeNext:^(id x) {
        @strongify(viewModel);
        [viewModel initialize];
    }];
    return viewModel;
}

- (instancetype)initWithValueParams:(NSDictionary *)params{
    self = [super init];
    if (self) {
        _params = _params;
    }
    return self;
}

- (void)initialize{
    
}
@end
