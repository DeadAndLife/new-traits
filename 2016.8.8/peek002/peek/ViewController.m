//
//  ViewController.m
//  peek
//
//  Created by 王宇腾 on 16/8/7.
//  Copyright © 2016年 王宇腾. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,assign) BOOL support3DTouch;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.support3DTouch = [self support3DTouch];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}

#pragma mark - Private method

-(BOOL)support3DTouch{
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        
        return YES;
    }
    
    return NO;
}
















@end
