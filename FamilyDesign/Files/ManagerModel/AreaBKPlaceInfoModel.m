//
//  AreaBKPlaceInfoModel.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/17.
//  Copyright © 2020 知行. All rights reserved.
//

#import "AreaBKPlaceInfoModel.h"

@implementation AreaBKPlaceInfoModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    [super setValue:value forUndefinedKey:key];
}

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"siteInfos":@"AreaBKSiteInfoModel"};
}
@end
