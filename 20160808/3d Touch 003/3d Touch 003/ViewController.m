//
//  ViewController.m
//  3d Touch 003
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "ViewController.h"
#import "oneViewController.h"
#import "twoViewController.h"

#define __kScreenWidth [UIScreen mainScreen].bounds.size.width
#define __kScreenHeight [UIScreen mainScreen].bounds.size.height


//1导入协议,实现pop,peek
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>

#pragma mark -tableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy) NSArray *items;


#pragma  mark -pop&peek

@property (nonatomic,assign) CGRect sourceRect;//用户手势点
@property (nonatomic,strong) NSIndexPath *indexPath;


@end

/*
 实现pop,peek手势
 1 遵循协议UIViewControllerPreviewingDelegate
 2 注册手势 [self registerFor...........];
 3 实现代理方法

 */



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //处理shortCutItems
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoTestVc:) name:@"gotoTestVc" object:nil];
    
    [self configTableView];
    

}

#pragma mark -tableView method

-(void)configTableView{
    
    self.items = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    self.tableView.rowHeight = 50;
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
    cell.textLabel.text = self.items[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点击了%zd行",indexPath.row+1);
}


#pragma mark -通知相关

-(void)gotoTestVc:(NSNotification *)noti{

    NSString *str = noti.userInfo[@"type"];
 
    UIViewController *testVc;
    
    if ([str isEqualToString:@"1"]) {
        
        testVc = [[oneViewController alloc] initWithNibName:@"oneViewController" bundle:nil];
        
    }else{
        
        testVc = [[twoViewController alloc] initWithNibName:@"twoViewController" bundle:nil];
    }
    
    [self presentViewController:testVc animated:YES completion:nil];

}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -pop && peek

//peek

-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    
    UIViewController *childVc = [[UIViewController alloc] init];
    
    //判断有没有超出范围
    
    if (![self getShouldRectAndIndexWothLocation:location]) {
        
        return nil;
    }
    
    previewingContext.sourceRect = self.sourceRect;
    
    //加一个白色的背景
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(20, 10, __kScreenWidth-40,__kScreenHeight-150)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 20;
    bgView.clipsToBounds = YES;
    [childVc.view addSubview:bgView];
    
    //在添加一个label
    UILabel *label = [[UILabel alloc] initWithFrame:bgView.bounds];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.text = @"再按的重一点";
    [bgView addSubview:label];
 
    return childVc;
    
    
}

//pop
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    
    
    [self tableView:self.tableView didSelectRowAtIndexPath:self.indexPath];
}

//用这个方法来判断有没有超出范围,并且获取具体的位置
-(BOOL)getShouldRectAndIndexWothLocation:(CGPoint)location{
    
    NSInteger row = (location.y - 20)/50;
    
    self.sourceRect = CGRectMake(0, row *50 +20, __kScreenWidth, 50);
    self.indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    

    return row >= self.items.count ?NO:YES;
    
}


@end
