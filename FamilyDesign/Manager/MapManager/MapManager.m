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

#pragma mark - 处理数据
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
