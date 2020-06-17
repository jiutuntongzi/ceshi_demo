//
//  MapView.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/15.
//  Copyright © 2020 知行. All rights reserved.
//

#import "MapView.h"
#import "MapViewModel.h"
@interface MapView()

@property(nonatomic, strong) MapViewModel *mapViewModel;

@property(nonatomic, strong) UIButton *areaBtn;
@property(nonatomic, strong) UIButton *priceBtn;
@property(nonatomic, strong) UIButton *moreBtn;


@end

@implementation MapView

- (instancetype)initWithViewModel:(ZXBaseViewModel *)viewModel{
    self = [super initWithViewModel:viewModel];
    if (self) {
        _mapViewModel = (MapViewModel *)viewModel;
    }
    return self;
}


- (void)renderViews{
    [super renderViews];
    [self addSubview:self.headerView];
//    [self addSubview:self.typeBtn];
//    [self addSubview:self.selectHidenView];
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(KScaleWidth(40));
    }];

//    [self.typeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self).offset(-30);
//        make.bottom.equalTo(self).offset(-200);
//        make.width.height.mas_equalTo(75);
//    }];
}

- (UIView *)headerView{
    if (nil == _headerView) {
        _headerView = [[UIView alloc] init];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}

- (UIView *)selectHidenView{
    if (nil == _selectHidenView) {
        _selectHidenView = [[UIView alloc] init];
        _selectHidenView.backgroundColor = [UIColor redColor];
    }
    return _selectHidenView;
}

- (UIButton *)typeBtn{
    if (nil == _typeBtn) {
        _typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_typeBtn setImage:ZXIMAGE_NAMED(@"dingwei") forState:UIControlStateNormal];
        [_typeBtn setTitle:@"定位" forState:UIControlStateNormal];
        [_typeBtn setTitleColor:ZXRGBColor(51, 51, 51) forState:UIControlStateNormal];
        _typeBtn.backgroundColor = [UIColor whiteColor];
        [_typeBtn jk_setImagePosition:LXMImagePositionTop spacing:2];
    }
    return _typeBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
