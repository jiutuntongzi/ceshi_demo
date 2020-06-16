//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.


#import <UIKit/UIKit.h>

@protocol BackButtonItemTitleProtocol <NSObject>

@optional
- (NSString *)navigationItemBackBarButtonTitle; //The length of the text is limited, otherwise it will be set to "Back"

@end

@interface UIViewController (BackButtonItemTitle) <BackButtonItemTitleProtocol>

@end
