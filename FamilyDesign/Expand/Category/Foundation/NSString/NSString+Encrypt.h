//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encrypt)
- (NSString*)encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSString*)decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

- (NSString*)encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSString*)decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;

@end
