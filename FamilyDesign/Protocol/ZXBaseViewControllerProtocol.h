//
//  BaseViewControllerProtocol.h
//  FamilyDesign
//
//  Created by lyc on 2020/5/20.
//  Copyright © 2020 知行. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@class ZXBaseViewModel;
@protocol ZXBaseViewControllerProtocol <NSObject>

@optional
@property (nonatomic, strong, readonly) ZXBaseViewModel *viewModel;

- (instancetype)initWithViewModel:(ZXBaseViewModel *)viewModel;

- (void)bindViewModel;

- (void)renderViews;

@end

NS_ASSUME_NONNULL_END
