//
//  AppDelegate.m
//  business
//
//  Created by yuechuang on 2017/1/11.
//  Copyright © 2017年 yuechuang. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "OrdersViewController.h"
#import "GDNavigationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    GDNavigationController *nav1 = [[GDNavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];
    nav1.view.backgroundColor = [UIColor whiteColor];
    nav1.tabBarItem.title = @"首页";
    nav1.tabBarItem.image = [[UIImage imageNamed:@"icon_tab1_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav1.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab1_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    nav1.navigationBar.barTintColor = [self colorWithHexString:@"#4777ba"];
    nav1.navigationBar.barStyle = UIBarStyleBlack;
    
    
    GDNavigationController *nav2 = [[GDNavigationController alloc] initWithRootViewController:[[OrdersViewController alloc] init]];
    nav2.view.backgroundColor = [UIColor whiteColor];
    nav2.tabBarItem.title = @"订单";
    nav2.tabBarItem.image = [[UIImage imageNamed:@"icon_tab2_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav2.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab2_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [nav2.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    nav2.navigationBar.shadowImage = [UIImage new];

    
    UIColor * color =[self colorWithHexString:@"#D33B47"];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : color} forState:UIControlStateSelected];
    tabBarController.viewControllers = @[nav1,nav2];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

}


/**
 *   十六进制颜色
 */

- (UIColor *)colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}



@end
