//
//  AppDelegate.m
//  MVVM-no-Binding with DataController
//
//  Created by manajay on 2018/3/5.
//  Copyright © 2018 manajay. All rights reserved.
//

#import "AppDelegate.h"
#import "LJHomeController.h"
#import "LJDimensionConst.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[LJHomeController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
