//
//  BaseViewController.h
//  FamilyDesign
//
//  Created by lyc on 2020/5/19.
//  Copyright © 2020 知行. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIImage+Color.h"
#import <Reachability.h>
#import "ZXBaseViewControllerProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@protocol  BBBaseViewControllerDataSource<NSObject>

@optional
-(NSMutableAttributedString*)setTitle;
-(UIButton*)set_leftButton;
-(UIButton*)set_rightButton;
-(UIColor*)set_colorBackground;
-(CGFloat)set_navigationHeight;
-(UIView*)set_bottomView;
-(UIImage*)navBackgroundImage;
-(BOOL)hideNavigationBottomLine;
-(UIImage*)set_leftBarButtonItemWithImage;
-(UIImage*)set_rightBarButtonItemWithImage;
@end


@protocol BBBaseViewControllerDelegate <NSObject>

@optional
-(void)left_button_event:(UIButton*)sender;
-(void)right_button_event:(UIButton*)sender;
-(void)title_click_event:(UIView*)sender;
@end

@interface BaseViewController : UIViewController<BBBaseViewControllerDataSource , BBBaseViewControllerDelegate,ZXBaseViewControllerProtocol>

-(void)changeNavigationBarTranslationY:(CGFloat)translationY;
-(void)set_Title:(NSMutableAttributedString *)title;

@end

NS_ASSUME_NONNULL_END
