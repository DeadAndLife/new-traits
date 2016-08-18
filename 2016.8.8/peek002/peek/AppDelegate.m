//
//  AppDelegate.m
//  peek
//
//  Created by 王宇腾 on 16/8/7.
//  Copyright © 2016年 王宇腾. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self creat3DTouchShortItems];
    
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


#pragma mark - 3d touch


-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    
    [self clickedWithShortcutItem:shortcutItem];
    
}


-(void)clickedWithShortcutItem:(UIApplicationShortcutItem *)item
{
    if (item.userInfo)
    {
        NSLog(@"%@",item.userInfo[@"url"]);
       
    }
}


-(void)creat3DTouchShortItems{
    
    //创建快捷item的icon UIApplicationShortcutItemIconFile
    
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"icon1"];
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"icon2"];
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"icon3"];
    
    //创建快捷item的userinfo UIApplicationShortcutItemUserInfo
    NSDictionary *info1 = @{@"url":@"url1"};
    NSDictionary *info2 = @{@"url":@"url2"};
    NSDictionary *info3 = @{@"url":@"url3"};
    
    //创建ShortcutItem
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"WYT_3DTocuh_1" localizedTitle:@"王宇腾" localizedSubtitle:@"中文名字" icon:icon1 userInfo:info1];
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"WYT_3DTocuh_2" localizedTitle:@"WangYuTeng" localizedSubtitle:@"拼音名字" icon:icon2 userInfo:info2];
    UIMutableApplicationShortcutItem *item3 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"WYT_3DTocuh_3" localizedTitle:@"WYT" localizedSubtitle:@"Eg Name" icon:icon3 userInfo:info3];
    
    NSArray *items = @[item1, item2, item3];
    [UIApplication sharedApplication].shortcutItems = items;
    
}

@end
