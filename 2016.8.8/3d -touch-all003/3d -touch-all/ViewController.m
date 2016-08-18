//
//  ViewController.m
//  3d -touch-all
//
//  Created by 王宇腾 on 16/8/7.
//  Copyright © 2016年 王宇腾. All rights reserved.
//

#import "ViewController.h"
#import "TestOneViewController.h"
#import "TestTwoViewController.h"

#define __kScreenWidth [UIScreen mainScreen].bounds.size.width
#define __kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>

#pragma mark - tableview

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy) NSArray *items;

#pragma mark - peek&pop

@property (nonatomic,assign) CGRect sourceRect;//用户手势点
@property (nonatomic,strong) NSIndexPath *indexPath;

@end

/*
 实现peek和pop手势：
 1、遵守协议 UIViewControllerPreviewingDelegate
 2、注册    [self registerForPreviewingWithDelegate:self sourceView:self.view];
 3、实现代理方法
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //处理shortCutItme通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoTestVc:) name:@"gotoTestVc" object:nil];
    
    [self configTableView];
    
    //注册pop peek
    [self registerForPreviewingWithDelegate:self sourceView:self.view];

}



#pragma mark - tableView method

-(void)configTableView{
    self.items = @[@"第一条",@"第二条",@"第三条",@"第四条",@"第五条",@"第六条"];
    self.tableView.rowHeight = 50;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"第%zd个cell被点击/pop了",indexPath.row + 1);

}

#pragma mark - 通知相关

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)gotoTestVc:(NSNotification *)noti{
    
    NSString *type = noti.userInfo[@"type"];
    
    UIViewController *testVc;
    if ([type isEqualToString:@"1"]) {
        
        testVc = [[TestOneViewController alloc] initWithNibName:@"TestOneViewController" bundle:nil];
    }else{
        
        testVc = [[TestTwoViewController alloc] initWithNibName:@"TestTwoViewController" bundle:nil];
    }
    
    [self presentViewController:testVc animated:YES completion:nil];
}

#pragma mark peek && pop 代理方法

//peek

-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    
    UIViewController *childVC = [[UIViewController alloc] init];
    
    //获取用户点击的位置，同时判断是否超出tableview响应范围
    
    if (![self getShouldShowRectAndIndexPathWithLocation:location]) {
        return nil;
    }
    previewingContext.sourceRect = self.sourceRect;
    
    //加个白色背景
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(20, 10, __kScreenWidth-40, __kScreenHeight - 20 -64 *2)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 10;
    bgView.clipsToBounds = YES;
    [childVC.view addSubview:bgView];
    
    //加个label
    
    UILabel *lable = [[UILabel alloc] initWithFrame:bgView.bounds];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = @"有种再按重一点...";
    [bgView addSubview:lable];
    
    return childVC;
    
    
    
}
//pop


-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    
    [self tableView:self.tableView didSelectRowAtIndexPath:self.indexPath];
}



//获取用户点击的位置，同时判断是否超出tableview响应范围
-(BOOL)getShouldShowRectAndIndexPathWithLocation:(CGPoint)location{
    
    NSInteger row = (location.y - 20)/50;
    
    self.sourceRect = CGRectMake(0, row * 50 +20, __kScreenWidth, 50);
    self.indexPath = [NSIndexPath indexPathForItem:row inSection:0];
    
    return row >= self.items.count ?NO :YES;

}












@end
