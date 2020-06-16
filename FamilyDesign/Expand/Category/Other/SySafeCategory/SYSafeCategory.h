//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
/**
 *  使用可以在AppDelegate的didFinishLaunchingWithOptions中调用下面的方法callSafeCategory;如：[SYSafeCategory callSafeCategory];
 
    就可以避免下面的闪退：
    NSMutableArray* array  =[NSMutableArray array];

    [array addObject:nil];
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    [dic setObject:nil forKey:nil];
    id item1,item2;
    [NSArray arrayWithObjects:item1,item2,nil];

 */
#import <Foundation/Foundation.h>

@interface SYSafeCategory : NSObject
+(void)callSafeCategory;
@end
