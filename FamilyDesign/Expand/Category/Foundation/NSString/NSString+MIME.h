//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MIME)
/**
 *  @brief  根据文件url 返回对应的MIMEType
 *
 *  @return MIMEType
 */
- (NSString *)MIMEType;
/**
 *  @brief  根据文件url后缀 返回对应的MIMEType
 *
 *  @return MIMEType
 */
+ (NSString *)MIMETypeForExtension:(NSString *)extension;
/**
 *  @brief  常见MIME集合
 *
 *  @return 常见MIME集合
 */
+ (NSDictionary *)MIMEDict;
@end
