//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//返回按钮事件
#import <UIKit/UIKit.h>
typedef void (^BackButtonHandler)(UIViewController *vc);
@interface UIViewController (BackButtonTouched)
-(void)backButtonTouched:(BackButtonHandler)backButtonHandler;
@end
