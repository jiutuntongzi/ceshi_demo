//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JKPasscodeStatus){
    /* The passcode status was unknown */
    JKPasscodeStatusUnknown   = 0,
    /* The passcode is enabled */
    JKPasscodeStatusEnabled   = 1,
    /* The passcode is disabled */
    JKPasscodeStatusDisabled  = 2
};

@interface UIDevice (JKPasscodeStatus)

/**
 *  Determines if the device supports the `passcodeStatus` check. Passcode check is only supported on iOS 8.
 */
@property (readonly) BOOL jk_passcodeStatusSupported;

/**
 *  Checks and returns the devices current passcode status.
 *  If `passcodeStatusSupported` returns NO then `LNPasscodeStatusUnknown` will be returned.
 */
@property (readonly) JKPasscodeStatus jk_passcodeStatus;

@end
