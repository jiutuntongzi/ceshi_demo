//
//  MainRootViewController.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/2.
//  Copyright © 2020 知行. All rights reserved.
//

#import "MainRootViewController.h"
#import "MainTabBarViewController.h"
//#import ""
@interface MainRootViewController ()

@end

@implementation MainRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarHidden = YES;
    self.view.backgroundColor = ZXRedColor;
    [self createNewTabBar];
    // Do any additional setup after loading the view.
}

- (CYLTabBarController *)createNewTabBar{
    return [self createNewTabBarWithContext:nil];
}

- (CYLTabBarController *)createNewTabBarWithContext:(NSString *)context{
    MainTabBarViewController *tabBarController = [[MainTabBarViewController alloc] initWithContext:context];
    self.viewControllers = @[tabBarController];
    return tabBarController;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
