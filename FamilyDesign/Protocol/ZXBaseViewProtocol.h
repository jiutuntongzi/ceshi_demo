//
//  WLBaseViewProtocol.h
//  WLBaseView
//
//  Created by 刘光强 on 2018/5/10.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXBaseViewModel.h"

@protocol ZXBaseViewProtocol <NSObject>

@optional
@property (nonatomic, strong, readonly) ZXBaseViewModel *viewModel;

- (instancetype)initWithViewModel:(ZXBaseViewModel *)viewModel;

- (void)renderViews;
- (void)bindViewModel;
@end
