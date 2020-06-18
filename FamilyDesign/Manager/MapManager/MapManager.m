//
//  MapManager.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/17.
//  Copyright © 2020 知行. All rights reserved.
//

#import "MapManager.h"
#import "AreaBKModel.h"

@interface MapManager ()

{
    float _maxLaValue;
    float _minLaValue;
    float _maxLoValue;
    float _minLoValue;
}

@end

@implementation MapManager

#pragma mark - add Annotation

- (void)addAnnotationWithView:(BMKMapView *)mapView WithArray:(NSArray *)array{
    for (AreaBKModel *model in array) {
        BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D center = CLLocationCoordinate2DMake(model.latitude, model.longitude);
        annotation.coordinate = center;
        //设置标注的标题
        annotation.title = model.name;
//        //副标题
        annotation.subtitle = @"";
        [mapView addAnnotation:annotation];
    }
}

- (void)addAnnotationWithViewSecond:(BMKMapView *)mapView WithArray:(NSArray *)array{
    for (AreaBKPlaceInfoModel *model in array) {
        BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D center = CLLocationCoordinate2DMake(model.latitude, model.longitude);
        annotation.coordinate = center;
        //设置标注的标题
        annotation.title = model.name;
//        //副标题
        annotation.subtitle = @"";
        [mapView addAnnotation:annotation];
    }
}

#pragma mark - 添加覆盖区域
- (void)addPolygonViewWithMapView:(BMKMapView *)mapView andBorderStr:(NSString *)str{
    NSArray *res = [self configDataWithBorderStr:str];
    CLLocationCoordinate2D coords[500] = {0};
    for (int i = 0; i < 500; i++) {
        if (i >= res.count) {
            coords[i].latitude = [res[res.count - 1][@"latitude"] floatValue];
            coords[i].longitude = [res[res.count - 1][@"longitude"] floatValue];
        }else{
            coords[i].latitude = [res[i][@"latitude"] floatValue];
            coords[i].longitude = [res[i][@"longitude"] floatValue];
        }
    }
    BMKPolygon *polygon = [BMKPolygon polygonWithCoordinates:coords count:500];
    [mapView addOverlay:polygon];
}

#pragma mark - 处理数据
- (NSArray *)configDataWithBorderStr:(NSString *)border{
    NSMutableArray *resArray = [NSMutableArray new];
    NSMutableArray *numArray = [NSMutableArray new];
    NSArray *strArray = [border componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@";"]];
    [numArray appendObjects:strArray];
    NSMutableArray *subArray1 = [NSMutableArray new];
    NSMutableArray *subArray2 = [NSMutableArray new];
    for (NSString *str in numArray) {
        NSArray *strArray = [str componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
        [subArray1 appendObject:strArray[0]];
        [subArray2 appendObject:strArray[1]];
    }
    [subArray1 enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *coords = @{@"longitude":obj,@"latitude":subArray2[idx]};
//        CLLocationCoordinate2D coords = {0};
//        coords.latitude = [obj floatValue];
//        coords.longitude = [subArray2[idx] floatValue];
        [resArray appendObject:coords];
    }];
    return resArray.copy;
}
- (NSDictionary *)configDataWithArray:(NSArray *)array{
    NSMutableArray *numArray = [NSMutableArray new];
    NSArray *dicArray = [NSArray mj_keyValuesArrayWithObjectArray:array];
    for (NSDictionary *dic in dicArray) {
        NSArray *strArray = [dic[@"border"] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@";"]];
        [numArray appendObjects:strArray];
    }
    NSMutableArray *subArray1 = [NSMutableArray new];
    NSMutableArray *subArray2 = [NSMutableArray new];
    for (NSString *str in numArray) {
        NSArray *strArray = [str componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
        [subArray1 appendObject:strArray[0]];
        [subArray2 appendObject:strArray[1]];
    }
    _maxLaValue =[[subArray1 valueForKeyPath:@"@max.floatValue"] floatValue];
    _minLaValue =[[subArray1 valueForKeyPath:@"@min.floatValue"] floatValue];
    _maxLoValue =[[subArray2 valueForKeyPath:@"@max.floatValue"] floatValue];
    _minLoValue =[[subArray2 valueForKeyPath:@"@min.floatValue"] floatValue];
    return @{@"maxLa":@(_maxLaValue),@"maxLo":@(_maxLoValue),@"minLa":@(_minLaValue),@"minLo":@(_minLoValue)};
}
@end
