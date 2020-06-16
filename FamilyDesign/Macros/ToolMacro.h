//
//  ToolMacro.h
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//

#ifndef ToolMacro_h
#define ToolMacro_h

/** 打印 NSlog */
#ifdef DEBUG
#   define ZLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

/**打印信息*/
#define ZLogI(fmt, ...) NSLog((@"%s 💙INFO [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

/**调试信息*/
#define ZLogD(fmt, ...) NSLog((@"%s 💚DEBUG [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

/**错误信息*/
#define ZLogE(fmt, ...) NSLog((@"%s ❤️ERROR [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

/**未知信息*/
#define ZLogU(fmt, ...) NSLog((@"%s 🧡UNKNOW [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define ZLog(...)
#endif

//弱引用/强引用
#define ZXWeakSelf(type)  __weak typeof(type) weak##type = type;
#define ZXStrongSelf(type)  __strong typeof(type) type = weak##type;

//设置View的tag属性
#define ZXVIEWWITHTAG(_OBJECT, _TAG)    [_OBJECT viewWithTag : _TAG]

//获取通知中心
#define ZXNotificationCenter [NSNotificationCenter defaultCenter]
//发送通知
#define ZXPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];

//window
#define kWindow [UIApplication sharedApplication].keyWindow

//获取系统版本
//#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define ZXCurrentSystemVersion [[UIDevice currentDevice] systemVersion]


/**适配 iPhone X TabBar和导航区别

   * Top区别:iPhone X 为例:导航(44 points)+状态栏(44 points)= 88 points

   *        Iphone 6s为例:导航(44 points)+状态栏(20 points)= 64 points

   * Bottom区别:iPhone X 为例: 83 points高度(TabBar) = Danger Area(34 points) + 原来的49 points

   *          Iphone 6s为例:49 points高度(TabBar) = 49 points

   */

//iPhoneX / iPhoneXS

#define  isIphoneX_XS    (SCREEN_WIDTH ==375.f&& SCREENH_HEIGHT ==812.f? YES : NO)

//iPhoneXR / iPhoneXSMax

#define  isIphoneXR_XSMax    (SCREEN_WIDTH ==414.f&& SCREENH_HEIGHT ==896.f? YES : NO)

#define  isFullScreen    (isIphoneX_XS || isIphoneXR_XSMax)

#define  StatusBarHeight    (isFullScreen ?44.f:20.f)

#define  NavigationBarHeight  44.f

#define  TabbarHeight        (isFullScreen ? (49.f+34.f) :49.f)

#define  TabbarSafeBottomHeight        (isFullScreen ?34.f:0.f)

#define  StatusBarAndNavigationBarHeight  (isFullScreen ?88.f:64.f)

//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

/* iOS设备 */
#define kDevice_Is_iPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6PlusBigMode ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen]currentMode].size) : NO)
#define iphoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen]currentMode].size) : NO)

#define PW ([UIScreen mainScreen].bounds.size.width/375)
#define PH ([UIScreen mainScreen].bounds.size.height/667)

//系统版本
#ifndef __IPHONE_13_0
#define __IPHONE_13_0 130000
#endif

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0
#endif

#define IOS_SYSTEM_STRING [[UIDevice currentDevice] systemVersion]
#define IOS11_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)
#define IOS10_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define IOS9_OR_LATER  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IOS8_OR_LATER  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS7_OR_LATER  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#endif /* ToolMacro_h */
