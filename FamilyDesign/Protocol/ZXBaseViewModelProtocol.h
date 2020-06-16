//
//  BaseViewModelProtocol.h
//  FamilyDesign
//
//  Created by lyc on 2020/5/20.
//  Copyright © 2020 知行. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZXBaseViewModelProtocol <NSObject>

@optional
//@property (nonatomic, strong, readonly) id<WLBViewModelServiceImpProtocol> service;
@property (nonatomic, copy, readonly) NSDictionary *params;

- (void)initialize;

- (instancetype)initWithValueParams:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
