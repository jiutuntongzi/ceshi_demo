//
//  MapManager.h
//  FamilyDesign
//
//  Created by lyc on 2020/6/17.
//  Copyright © 2020 知行. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

NS_ASSUME_NONNULL_BEGIN

@interface MapManager : NSObject

- (void)addAnnotationWithView:(BMKMapView *)mapView WithArray:(NSArray *)array;
- (void)addAnnotationWithViewSecond:(BMKMapView *)mapView WithArray:(NSArray *)array;
- (NSDictionary *)configDataWithArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
