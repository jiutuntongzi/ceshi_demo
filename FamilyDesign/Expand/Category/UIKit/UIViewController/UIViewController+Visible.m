//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.


#import "UIViewController+Visible.h"

@implementation UIViewController (Visible)
- (BOOL)isVisible {
    return [self isViewLoaded] && self.view.window;
}
@end
