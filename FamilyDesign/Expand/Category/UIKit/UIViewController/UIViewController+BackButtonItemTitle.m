//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.


#import "UIViewController+BackButtonItemTitle.h"

@implementation UIViewController (BackButtonItemTitle)

@end

@implementation UINavigationController (NavigationItemBackBtnTile)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item {
    
    UIViewController * viewController = self.viewControllers.count > 1 ? \
                    [self.viewControllers objectAtIndex:self.viewControllers.count - 2] : nil;
    
    if (!viewController) {
        return YES;
    }
    
    NSString *backButtonTitle = nil;
    if ([viewController respondsToSelector:@selector(navigationItemBackBarButtonTitle)]) {
        backButtonTitle = [viewController navigationItemBackBarButtonTitle];
    }
    
    if (!backButtonTitle) {
        backButtonTitle = viewController.title;
    }
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:backButtonTitle
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil action:nil];
    viewController.navigationItem.backBarButtonItem = backButtonItem;
    
    return YES;
}

@end
