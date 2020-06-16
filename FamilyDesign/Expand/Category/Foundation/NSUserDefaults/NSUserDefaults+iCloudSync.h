//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface NSUserDefaults (iCloudSync)

-(void)setValue:(id)value  forKey:(NSString *)key iCloudSync:(BOOL)sync;
-(void)setObject:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync;

-(id)valueForKey:(NSString *)key  iCloudSync:(BOOL)sync;
-(id)objectForKey:(NSString *)key iCloudSync:(BOOL)sync;

-(BOOL)synchronizeAlsoiCloudSync:(BOOL)sync;

@end
