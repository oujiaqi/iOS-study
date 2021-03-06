//
//  AppDelegate.m
//  FirstApp
//
//  Created by ouou on 2017/9/14.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import "AppDelegate.h"
#import "OJQLoginViewController.h"
#import "OJQQuestionViewController.h"
#import "OJQUITabTableViewController.h"
#import "OJQDrawViewController.h"

#import "OJQItemStore.h"
#import "OJQImageStore.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    OJQLoginViewController *loginVC = [[OJQLoginViewController alloc] init];
//    self.window.rootViewController = loginVC;
    OJQQuestionViewController *quesVC = [[OJQQuestionViewController alloc] init];
    quesVC.view.backgroundColor = [UIColor whiteColor];
//    self.window.rootViewController = quesVC;

    
    OJQUITabTableViewController *tabVC = [[OJQUITabTableViewController alloc] init];
    tabVC.view.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tabVC];
    
    OJQDrawViewController *dVC = [[OJQDrawViewController alloc] init];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[loginVC, quesVC, navController, dVC];
    
    self.window.rootViewController = tabBarController;
//    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    BOOL success = [[OJQItemStore sharedStore] saveChanges];
    if (success) {
        NSLog(@"Saved all of OJQItems");
    } else {
        NSLog(@"Could not save any of the OJQItems");
    }
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
