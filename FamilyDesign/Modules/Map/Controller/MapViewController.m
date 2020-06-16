//
//  MapViewController.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/15.
//  Copyright © 2020 知行. All rights reserved.
//

#import "MapViewController.h"
#import "MapViewModel.h"
#import "MapView.h"
#import "CustomPaopaoView.h"
#import "MapInfoListView.h"
#import "MapInfoListViewModel.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BMKLocationkit/BMKLocationComponent.h>

@interface MapViewController ()<BMKMapViewDelegate,BMKLocationManagerDelegate>

@property(nonatomic, strong) MapViewModel *mapViewModel;
@property(nonatomic, strong) MapInfoListViewModel *mapInfoListViewModel;
@property(nonatomic, strong) MapView *myMapView;
@property(nonatomic, strong) MapInfoListView *mapInfoListView;
@property (nonatomic, strong) BMKMapView *mapView;

@property (nonatomic, strong) BMKUserLocation *userLocation; //当前位置对象
@property (nonatomic, strong) BMKLocationManager *locationManager; //定位对象

//声明点聚合管理类全局变量

@end

@implementation MapViewController

- (instancetype)initWithViewModel:(ZXBaseViewModel *)viewModel{
    self = [super initWithViewModel:viewModel];
    if (self) {
        _mapViewModel = (MapViewModel *)viewModel;
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
    [self initMapUI];
    [self mapConfig];
}

- (void)congigInit{
    self.leftBarBtnHidden = NO;
    self.title = @"地图";
    [self.view addSubview:self.myMapView];
}

- (void)initMapUI{
    _mapView = [[BMKMapView alloc]initWithFrame:self.myMapView.bounds];
    _mapView.delegate = self;
//    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    //开启定位服务
    [self.locationManager startUpdatingLocation];
    [self.locationManager startUpdatingHeading];
    //显示定位图层
    _mapView.showsUserLocation = YES;
    // self.mapView是BMKMapView对象
//    BMKLocationViewDisplayParam *param = [[BMKLocationViewDisplayParam alloc] init];
    //根据配置参数更新定位图层样式
//    [self.mapView updateLocationViewWithParam:param];
    //用户自定义定位图标，V4.2.1以后支持
//    param.locationViewImgName = @"location";
//    param.locationViewImage = [UIImage imageNamed:@"location.png"];
    [self.myMapView addSubview:_mapView];
    [self.myMapView insertSubview:self.myMapView.typeBtn aboveSubview:_mapView];
    [self.myMapView insertSubview:self.myMapView.headerView aboveSubview:_mapView];
}

- (void)mapConfig{
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    annotation.coordinate = CLLocationCoordinate2DMake(39.915, 116.404);
    //设置标注的标题
    annotation.title = @"北京";
    //副标题
    annotation.subtitle = @"天安门";
    
    BMKPointAnnotation* annotation1 = [[BMKPointAnnotation alloc]init];
    annotation1.coordinate = CLLocationCoordinate2DMake(39.915, 116.504);
    //设置标注的标题
    annotation1.title = @"学习";
    //副标题
    annotation1.subtitle = @"学习门";
    [_mapView addAnnotation:annotation];
    [_mapView addAnnotation:annotation1];
}
- (void)bindViewModel{
    [super bindViewModel];
}

//由于以下代理方法中分别且仅只返回heading或location信息，请开发者务必将该对象定义为全局类型，避免在以下回调用使用局部的BMKUserLocation对象，导致出现定位显示错误位置的情况。
// 定位SDK中，方向变更的回调
- (void)BMKLocationManager:(BMKLocationManager *)manager didUpdateHeading:(CLHeading *)heading {
    if (!heading) {
        return;
        }
    if (!self.userLocation) {
        self.userLocation = [[BMKUserLocation alloc] init];
        }
    self.userLocation.heading = heading;
    [self.mapView updateLocationData:self.userLocation];
}

// 定位SDK中，位置变更的回调
- (void)BMKLocationManager:(BMKLocationManager *)manager didUpdateLocation:(BMKLocation *)location orError:(NSError *)error {
    if (error) {
        NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
        }
    if (!location) {
        return;
        }
    if (!self.userLocation) {
        self.userLocation = [[BMKUserLocation alloc] init];
        }
    self.userLocation.location = location.location;
    [self.mapView updateLocationData:self.userLocation];
}

- (void)mapview:(BMKMapView *)mapView onLongClick:(CLLocationCoordinate2D)coordinate{
    
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]])
    {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[BMKAnnotationView alloc] initWithAnnotation:annotation
                                                              reuseIdentifier:reuseIndetifier];
        }
//        annotationView.image = [UIImage imageNamed:@"dingwei.png"];
        annotationView.canShowCallout = YES;
        CustomPaopaoView *customPopView = [[CustomPaopaoView alloc] init];
        customPopView.frame = CGRectMake(0, 0, 70.f, 70.0f);
        customPopView.layer.cornerRadius = 70./2;
//        customPopView.image = [UIImage imageNamed:@"dingwei.png"];
        customPopView.title = @"北京";
        customPopView.subtitle = @"260套";

        BMKActionPaopaoView *pView = [[BMKActionPaopaoView alloc] initWithCustomView:customPopView];
        pView.backgroundColor = [UIColor clearColor];
        pView.frame = customPopView.frame;
        annotationView.paopaoView = pView;
        annotationView.selected = YES;
        annotationView.canShowCallout = YES;
        annotationView.calloutOffset = CGPointMake(0, 40);
        annotationView.hidePaopaoWhenSingleTapOnMap = NO;
        
        //添加单击手势
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesAction)];
        [customPopView addGestureRecognizer:tapGes];
        customPopView.userInteractionEnabled = YES;
        
        
        return annotationView;
    }
    return nil;
}
- (void)tapGesAction{
    [self.view addSubview:self.mapInfoListView];
    [UIView animateWithDuration:1 animations:^{
        self.mapInfoListView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT);
    }];
}
#pragma mark - lazy
- (MapView *)myMapView{
    if (nil == _myMapView) {
        _myMapView = [[MapView alloc] initWithViewModel:self.mapViewModel];
        _myMapView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT);
    }
    return _myMapView;
}

- (MapInfoListView *)mapInfoListView{
    if (nil == _mapInfoListView) {
        _mapInfoListView = [[MapInfoListView alloc] initWithViewModel:self.mapInfoListViewModel];
        _mapInfoListView.frame = CGRectMake(0, SCREENH_HEIGHT, SCREEN_WIDTH, SCREENH_HEIGHT);
    }
    return _mapInfoListView;
}

- (BMKLocationManager *)locationManager {
    if (!_locationManager) {
        //初始化BMKLocationManager类的实例
        _locationManager = [[BMKLocationManager alloc] init];
        //设置定位管理类实例的代理
        _locationManager.delegate = self;
        //设定定位坐标系类型，默认为 BMKLocationCoordinateTypeGCJ02
        _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
        //设定定位精度，默认为 kCLLocationAccuracyBest
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        //设定定位类型，默认为 CLActivityTypeAutomotiveNavigation
        _locationManager.activityType = CLActivityTypeAutomotiveNavigation;
        //指定定位是否会被系统自动暂停，默认为NO
        _locationManager.pausesLocationUpdatesAutomatically = NO;
        /**
         是否允许后台定位，默认为NO。只在iOS 9.0及之后起作用。
         设置为YES的时候必须保证 Background Modes 中的 Location updates 处于选中状态，否则会抛出异常。
         由于iOS系统限制，需要在定位未开始之前或定位停止之后，修改该属性的值才会有效果。
         */
        _locationManager.allowsBackgroundLocationUpdates = NO;
        /**
         指定单次定位超时时间,默认为10s，最小值是2s。注意单次定位请求前设置。
         注意: 单次定位超时时间从确定了定位权限(非kCLAuthorizationStatusNotDetermined状态)
         后开始计算。
         */
        _locationManager.locationTimeout = 10;
    }
    return _locationManager;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_mapView viewWillAppear];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
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
