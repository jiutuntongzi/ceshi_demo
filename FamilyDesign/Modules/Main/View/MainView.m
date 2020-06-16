//
//  MainView.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/15.
//  Copyright © 2020 知行. All rights reserved.
//

#import "MainView.h"
#import "MainViewModel.h"

@interface MainView ()

@property(nonatomic, strong) MainViewModel *mainViewModel;


@end

@implementation MainView

- (instancetype)initWithViewModel:(ZXBaseViewModel *)viewModel{
    self = [super initWithViewModel:viewModel];
    if (self) {
        _mainViewModel = (MainViewModel *)viewModel;
    }
    return self;
}

- (void)renderViews{
    [super renderViews];
    self.frame = CGRectMake(0, StatusBarAndNavigationBarHeight, SCREEN_WIDTH, SCREENH_HEIGHT);
    [self addSubview:self.button];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-200);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
}

#pragma mark - lazy
- (UIButton *)button{
    if (nil == _button) {
        _button = [UIButton ba_buttonWithFrame:CGRectMake(0, 0, 100, 40) title:@"地图" titleColor:ZXRGBColor(30, 30, 30) titleFont:ZXSYSTEMFONT(15) backgroundColor:[UIColor whiteColor]];
    }
    return _button;
}

@end
