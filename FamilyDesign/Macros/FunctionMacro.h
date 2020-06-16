//
//  FunctionMacro.h
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//

#ifndef FunctionMacro_h
#define FunctionMacro_h

//获取当前语言
#define ZXCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//定义UIImage对象
#define ZXImageWithFile(_pointer) [UIImage imageWithContentsOfFile:([[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@%dx", _pointer, (int)[UIScreen mainScreen].nativeScale] ofType:@"png"])]
#define ZXIMAGE_NAMED(name) [UIImage imageNamed:name]

//G－C－D
#define ZXBACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define ZXMAIN(block) dispatch_async(dispatch_get_main_queue(),block)
//一次性执行
#define ZXDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

//NSUserDefaults 实例化
#define ZXUSER_DEFAULT [NSUserDefaults standardUserDefaults]

//单例化一个类
#define SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}



/** 弹出提示框 UIAlertView */
#define showMessageView(__MESSAGE__) \
UIAlertView *alertView_ = [[UIAlertView alloc] initWithTitle:@"提示" \
message:__MESSAGE__ \
delegate:nil \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil]; \
[alertView_ show];

/** 弹出提示框 UIAlertController */
#define showMessageController(MESSAGE,VC) \
UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:MESSAGE preferredStyle:UIAlertControllerStyleAlert]; \
UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]; \
[alertController addAction:action]; \
[VC presentViewController:alertController animated:YES completion:nil]


//沙盒目录文件
//获取temp
#define kPathTemp NSTemporaryDirectory()

//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//数据验证
#define StrValid(f) (f!=nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])
#define SafeStr(f) (StrValid(f) ? f:@"")
#define HasString(str,key) ([str rangeOfString:key].location!=NSNotFound)

#define ValidStr(f) StrValid(f)
#define ValidDict(f) (f!=nil && [f isKindOfClass:[NSDictionary class]])
#define ValidArray(f) (f!=nil && [f isKindOfClass:[NSArray class]] && [f count]>0)
#define ValidNum(f) (f!=nil && [f isKindOfClass:[NSNumber class]])
#define ValidClass(f,cls) (f!=nil && [f isKindOfClass:[cls class]])
#define ValidData(f) (f!=nil && [f isKindOfClass:[NSData class]])

//拼接字符串
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]


#define WEAK_SELF __weak typeof(self) weakSelf = self
#define STRONG_SELF __strong typeof(weakSelf) self = weakSelf


#endif /* FunctionMacro_h */
