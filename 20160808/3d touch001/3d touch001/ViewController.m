//
//  ViewController.m
//  3d touch001
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:(UIApplicationShortcutIconTypeAdd)];
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:(UIApplicationShortcutIconTypeHome)];
    
    
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"1" localizedTitle:@"么么哒" localizedSubtitle:@"爱你呦" icon:icon1 userInfo:nil];
    
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"2" localizedTitle:@"我是主标题" localizedSubtitle:@"我是副标题" icon:icon2 userInfo:nil];
    
    [UIApplication sharedApplication].shortcutItems = @[item1,item2];
    
}



@end
