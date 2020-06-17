//
//  MainViewController.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/2.
//  Copyright © 2020 知行. All rights reserved.
//

#import "MainViewController.h"
#import "MapViewController.h"
#import "MainView.h"
#import "MainViewModel.h"
#import "JsonFileManager.h"
#import "AreaBKModel.h"
@interface MainViewController ()

@property(nonatomic, strong) MainView *mainView;
@property(nonatomic, strong) MainViewModel *mainViewModel;

@property(nonatomic, strong) NSArray *areaArray;

@end

@implementation MainViewController

- (instancetype)initWithViewModel:(MainViewModel *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        _mainViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)renderViews{
    [super renderViews];
    [self congigInit];
    [self.view addSubview:self.mainView];
}

- (void)congigInit{
    self.leftBarBtnHidden = YES;
    self.areaArray = [self getJsonData];
    AreaBKModel *moelq =self.areaArray[0];
    ZLog(@"%@",moelq);
}

- (void)bindViewModel{
    [super bindViewModel];
}

- (NSArray *)getJsonData{
    NSArray *jsonArray = [JsonFileManager loadDataWithJsonFileName:@"areaInfo"];
    return [AreaBKModel mj_objectArrayWithKeyValuesArray:jsonArray];
}

#pragma mark - lazy
- (MainView *)mainView{
    if (nil == _mainView) {
        _mainView = [[MainView alloc] initWithViewModel:self.mainViewModel];
        @weakify(self);
        _mainView.button.ba_buttonActionBlock = ^(UIButton * _Nonnull button) {
            @strongify(self);
            MapViewController *mapVC = [[MapViewController alloc] init];
            mapVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:mapVC animated:YES];
        };
    }
    return _mainView;
}

- (NSArray *)areaArray{
    if (nil == _areaArray) {
        _areaArray = [NSArray new];
    }
    return _areaArray;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
