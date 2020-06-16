//
//  MainTabBarViewController.m
//  FamilyDesign
//
//  Created by lyc on 2020/6/2.
//  Copyright © 2020 知行. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "SettingViewController.h"
#import "LoginViewController.h"
#import "MineViewController.h"
#import "MainViewController.h"


@interface MainTabBarViewController ()

@property(nonatomic, strong) NSArray *tabBarItemsAttributesForController;
@property(nonatomic, strong) NSArray *vControllers;

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithContext:(NSString *)context{
    UIEdgeInsets imageInsets = UIEdgeInsetsZero;
    UIOffset titlePositionAdjustment = UIOffsetMake(0, 3.5);
    CYLTabBarController *cylTabBarV = [CYLTabBarController tabBarControllerWithViewControllers:self.vControllers tabBarItemsAttributes:self.tabBarItemsAttributesForController imageInsets:imageInsets titlePositionAdjustment:titlePositionAdjustment context:context];
    [self customizeTabBarAppearance];
    self.delegate = self;
    self.navigationController.navigationBar.hidden = YES;
    return (MainTabBarViewController *)cylTabBarV;
}

//VC  array
- (NSArray *)vControllers{
    MainViewController *mainVC = [[MainViewController alloc] init];
    UINavigationController *mainNV = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [mainVC cyl_setHideNavigationBarSeparator:YES];
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *loginNV = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [loginVC cyl_setHideNavigationBarSeparator:YES];
    MineViewController*mineVC = [[MineViewController alloc] init];
    UINavigationController *mineNV = [[UINavigationController alloc] initWithRootViewController:mineVC];
    [mineVC cyl_setHideNavigationBarSeparator:YES];
    SettingViewController *setVC = [[SettingViewController alloc] init];
    UINavigationController *setNV = [[UINavigationController alloc] initWithRootViewController:setVC];
    [setVC cyl_setHideNavigationBarSeparator:YES];
    return @[mainNV,loginNV,mineNV,setNV];
}
//Item  array
- (NSArray *)tabBarItemsAttributesForController{
    NSDictionary *firstVC = @{
//                              CYLTabBarItemTitle:@"首页",
                              CYLTabBarItemImage:@"liwu",
                              CYLTabBarItemSelectedImage:@"liwu",
    };
    NSDictionary *secondVC = @{
//                              CYLTabBarItemTitle:@"商城",
                              CYLTabBarItemImage:@"lingdang",
                              CYLTabBarItemSelectedImage:@"lingdang",
    };
    NSDictionary *thirdVC = @{
//                              CYLTabBarItemTitle:@"广场",
                              CYLTabBarItemImage:@"shizhong",
                              CYLTabBarItemSelectedImage:@"shizhong",
    };
    NSDictionary *fourthVC = @{
//                              CYLTabBarItemTitle:@"我的",
                              CYLTabBarItemImage:@"chouti",
                              CYLTabBarItemSelectedImage:@"chouti",
    };
    return @[firstVC,secondVC,thirdVC,fourthVC];
}
/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance {
    // Customize UITabBar height
    // 自定义 TabBar 高度
    // tabBarController.tabBarHeight = CYL_IS_IPHONE_X ? 65 : 40;
    
    [self rootWindow].backgroundColor = [UIColor cyl_systemBackgroundColor];
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor cyl_systemGrayColor];
    //normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor cyl_labelColor];
    //selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];

    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
//     [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set background color
    // 设置 TabBar 背景
    // 半透明
//    [UITabBar appearance].translucent = YES;
    // [UITabBar appearance].barTintColor = [UIColor cyl_systemBackgroundColor];
    // [[UITabBar appearance] setBackgroundColor:[UIColor cyl_systemBackgroundColor]];
    
    
    //     [[UITabBar appearance] setBackgroundImage:[[self class] imageWithColor:[UIColor whiteColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width, tabBarController.tabBarHeight ?: (CYL_IS_IPHONE_X ? 65 : 40))]];
    //    [[UITabBar appearance] setUnselectedItemTintColor:[UIColor systemGrayColor]];
    
    //Three way to deal with shadow 三种阴影处理方式：
    // NO.3, without shadow : use -[[CYLTabBarController hideTabBarShadowImageView] in CYLMainRootViewController.m
    
    // NO.2，using layer to add shadow.
    //    CYLTabBarController *tabBarController = [self cyl_tabBarController];
    //    tabBarController.tabBar.layer.shadowColor = [UIColor blackColor].CGColor;
    //    tabBarController.tabBar.layer.shadowRadius = 15.0;
    //    tabBarController.tabBar.layer.shadowOpacity = 1;
    //    tabBarController.tabBar.layer.shadowOffset = CGSizeMake(0, 3);
    //    tabBarController.tabBar.layer.masksToBounds = NO;
    //    tabBarController.tabBar.clipsToBounds = NO;
    
    // NO.1，using Image note:recommended.推荐方式
    // set the bar shadow image
    // without shadow : use -[[CYLTabBarController hideTabBarShadowImageView] in CYLMainRootViewController.m
    if (@available(iOS 13.0, *)) {
        UITabBarItemAppearance *inlineLayoutAppearance = [[UITabBarItemAppearance  alloc] init];
        // set the text Attributes
        // 设置文字属性
        [inlineLayoutAppearance.normal setTitleTextAttributes:normalAttrs];
        [inlineLayoutAppearance.selected setTitleTextAttributes:selectedAttrs];
    
        UITabBarAppearance *standardAppearance = [[UITabBarAppearance alloc] init];
        standardAppearance.stackedLayoutAppearance = inlineLayoutAppearance;
        standardAppearance.backgroundColor = [UIColor cyl_systemBackgroundColor];
        //shadowColor和shadowImage均可以自定义颜色, shadowColor默认高度为1, shadowImage可以自定义高度.
        standardAppearance.shadowColor = [UIColor cyl_systemGreenColor];
        // standardAppearance.shadowImage = [[self class] imageWithColor:[UIColor cyl_systemGreenColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 1)];
        self.tabBar.standardAppearance = standardAppearance;
    } else {
        // Override point for customization after application launch.
        // set the text Attributes
        // 设置文字属性
        UITabBarItem *tabBar = [UITabBarItem appearance];
        [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
        [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
        
        // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
        [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
        [[UITabBar appearance] setShadowImage:[[self class] imageWithColor:[UIColor systemGreenColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 1)]];
    }
}
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
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
