//
//  ViewController.m
//  3d-touch-home
//
//  Created by 王宇腾 on 16/8/7.
//  Copyright © 2016年 王宇腾. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建icon标签的类
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:(UIApplicationShortcutIconTypeAdd)];
    
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:(UIApplicationShortcutIconTypeAudio)];
    
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:@"two" localizedTitle:@"么么哒" localizedSubtitle:@"爱你呦" icon:icon userInfo:nil];
    
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"one" localizedTitle:@"这是主标题" localizedSubtitle:@"这是副标题" icon:icon1 userInfo:nil];
    
    
    
//    //创建一个标签，并配置相关属性
//    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:@"two" localizedTitle:@"么么哒" localizedSubtitle:@"爱你呦" icon:icon userInfo:nil];
//    
//    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"one" localizedTitle:@"这是主标题" localizedSubtitle:@"这是副标题" icon:icon userInfo:nil];
//    
//    //将标签添加进APPlication的shortcutItem中
   [UIApplication sharedApplication].shortcutItems = @[item,item2];
    
    
}




@end
