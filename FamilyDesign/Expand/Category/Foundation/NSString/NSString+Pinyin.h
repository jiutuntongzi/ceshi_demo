//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSString (Pinyin)

- (NSString*)pinyinWithPhoneticSymbol;
- (NSString*)pinyin;
- (NSArray*)pinyinArray;
- (NSString*)pinyinWithoutBlank;
- (NSArray*)pinyinInitialsArray;
- (NSString*)pinyinInitialsString;

@end
