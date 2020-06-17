//
//  AreaBKModel.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/17.
//  Copyright © 2020 知行. All rights reserved.
//

#import "AreaBKModel.h"

@implementation AreaBKModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    [super setValue:value forUndefinedKey:key];
}

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"placeInfos":@"AreaBKPlaceInfoModel"};
}

@end

