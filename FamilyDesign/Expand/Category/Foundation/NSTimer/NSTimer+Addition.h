//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSTimer (Addition)
/**
 *  @brief  暂停NSTimer
 */
- (void)pauseTimer;
/**
 *  @brief  开始NSTimer
 */
- (void)resumeTimer;
/**
 *  @brief  延迟开始NSTimer
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end
