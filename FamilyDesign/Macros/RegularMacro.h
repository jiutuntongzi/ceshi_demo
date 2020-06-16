//
//  RegularMacro.h
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//

#ifndef RegularMacro_h
#define RegularMacro_h


/** 用于正则式 */
#define NUM @"0123456789"
#define ALPHA @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
/** 验证手机号及固话方法 */
#define TelephoneNUM  @"^(0[0-9]{2,3})?([2-9][0-9]{6,7})+(-[0-9]{1,4})?$|(^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\\d{8}$)"
/** 判断社会信用代码证 */
#define SocialCreditNUM  @"^([0-9ABCDEFGHJKLMNPQRTUWXY]{2})([0-9]{6})([0-9ABCDEFGHJKLMNPQRTUWXY]{9})([0-9Y])$"
/** 工商税号 */
#define BusinessCirclesNUM  @"[0-9]\\\\d{13}([0-9]|X)$"
/** 邮政编码 */
#define CodeNUM  @"^[0-8]\\\\d{5}(?!\\\\d)$"
/** 验证身份证号（15位或18位数字) */
#define IDCardNUM  @"\\d{14}[[0-9],0-9xX]"
/** 验证Email地址 */
#define EmailNUM  @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\.\\w+([-.]\\w+)*$"
/** 整数或者小数 */
#define IntAndDecimalNUM  @"^[0-9]+([.]{0,1}[0-9]+){0,1}$"
/** 验证URL */
#define URLNUM  @"^http://([\\w-]+\.)+[\\w-]+(/[\\w-./?%&=]*)?$"
/** 验证QQ */
#define QQNUM  @"[1-9][0-9]\{4,\}"
/** 匹配帐号是否合法 */
#define AccountLegalityNUM  @"^[a-zA-Z][a-zA-Z0-9_]{4,15}$"
/** 只能输入汉字 */
#define ChineseCharactersNUM  @"^[\u4e00-\u9fa5]{0,}$"
/** 匹配空白行的正则表达式 */
#define SpaceNUM  @"^\n\s*\r"

#endif /* RegularMacro_h */
