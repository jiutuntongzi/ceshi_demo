//
//  JsonFileManager.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/17.
//  Copyright © 2020 知行. All rights reserved.
//

#import "JsonFileManager.h"

@implementation JsonFileManager


+ (NSArray *)loadDataWithJsonFileName:(NSString *)name{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        ZLog(@"解析json文件出错：%@",error);
    }
    return dataArray;
}

@end
