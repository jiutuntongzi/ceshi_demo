//
//  CustomPaopaoView.h
//  FamilyDesign
//
//  Created by lyc on 2020/6/16.
//  Copyright © 2020 知行. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomPaopaoView : UIView
@property (nonatomic, strong) UIImage *image; //商户图
@property (nonatomic, copy) NSString *title; //商户名
@property (nonatomic, copy) NSString *subtitle; //地址

- (void)hideSubTitle;
@end

NS_ASSUME_NONNULL_END
