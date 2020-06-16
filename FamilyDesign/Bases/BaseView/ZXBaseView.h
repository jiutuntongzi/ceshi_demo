//
//  ZXBaseView.h
//  
//
//  Created by lyc on 2020/5/19.
//

#import <UIKit/UIKit.h>
#import "ZXBaseViewProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZXBaseView : UIView<ZXBaseViewProtocol>

/**
 缩进边界
 */
@property (nonatomic) UIEdgeInsets viewEdgeInsets;

+ (instancetype)loadXib;
@end

NS_ASSUME_NONNULL_END
