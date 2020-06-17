//
//  JsonFileManager.h
//  FamilyDesign
//
//  Created by lyc on 2020/6/17.
//  Copyright © 2020 知行. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JsonFileManager : NSObject

+ (NSArray *)loadDataWithJsonFileName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
