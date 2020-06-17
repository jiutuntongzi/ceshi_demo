//
//  ManagerRouter.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/17.
//  Copyright © 2020 知行. All rights reserved.
//

#import "ManagerRouter.h"
#import "MapViewController.h"
@implementation ManagerRouter

+ (void)load{
    [MGJRouter registerURLPattern:kRouterFor_Map toHandler:^(NSDictionary *routerParameters) {
        UINavigationController *nav = routerParameters[MGJRouterParameterUserInfo][@"nav"];
        MapViewController *mapVC = [[MapViewController alloc] init];
        mapVC.areaModelArray = routerParameters[MGJRouterParameterUserInfo][@"areaArray"];
        mapVC.hidesBottomBarWhenPushed = YES;
        [nav pushViewController:mapVC animated:YES];
    }];
}


//跳转
+ (void)routerToMapAndParams:(NSDictionary *)params{
    [MGJRouter openURL:kRouterFor_Map withUserInfo:params completion:^(id result) {
        
    }];
}
@end
