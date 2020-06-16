//
//  ZXBaseViewController.m
//  ZXBaseView_Example
//
//  Created by lyc on 2018/3/15.
//  Copyright © 2018年 lyc. All rights reserved.
//

#import "ZXBaseViewController.h"

@interface ZXBaseViewController ()

@property (nonatomic, getter=isViewAppeared) BOOL viewAppeared;
@property (nonatomic, strong, readwrite) ZXBaseViewModel *viewModel;
@end

@implementation ZXBaseViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    ZXBaseViewController *viewController = [super allocWithZone:zone];
    @weakify(viewController)
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(viewController)
        [viewController renderViews];
        [viewController bindViewModel];
    }];
    return viewController;
}

- (instancetype)initWithViewModel:(ZXBaseViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)renderViews {}

- (void)bindViewModel {}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = self.toolbarHidden;
    self.navigationController.navigationBarHidden = self.navigationBarHidden;
    if (!self.leftBarBtnHidden) {
        [self setNavigationItemBackItem];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.viewAppeared = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.viewAppeared = NO;
}

#pragma mark - 基类初始化设置
- (void)initialize {
    self.navigationBarHidden = NO;
    self.toolbarHidden = YES;
    self.titleColor = kNavTitleColor;
    self.view.backgroundColor = kBgColor;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:titleColor, NSFontAttributeName: [UIFont systemFontOfSize:18.0f]};
}

- (void)setNavigationBarImage:(UIImage *)navigationBarImage {
    _navigationBarImage = navigationBarImage;
}

- (void)setStatusBarStyle:(StatusBarStyle)statusBarStyle {
    _statusBarStyle = statusBarStyle;
    if (statusBarStyle == StatusBarStyleWhite) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
}

- (void)setNavigationBarHidden:(BOOL)navigationBarHidden {
    _navigationBarHidden = navigationBarHidden;
    if (self.isViewLoaded) {
        [self.navigationController setNavigationBarHidden:_navigationBarHidden];
    }
}

- (void)setToolbarHidden:(BOOL)toolbarHidden {
    _toolbarHidden = toolbarHidden;
    if (self.isViewLoaded) {
        [self.navigationController setToolbarHidden:_toolbarHidden];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
