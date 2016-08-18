//
//  ViewController.m
//  stackView003
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic,strong) UIStackView *verStackView;

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *logoImageView;

@property (nonatomic,strong) UIStackView *btnStackView;
@property (nonatomic,strong) UIButton *addBtn;
@property (nonatomic,strong) UIButton *remBtn;

@property (nonatomic,strong) UIStackView *horStackView;


@end

@implementation ViewController

-(UIStackView *)verStackView{
    
    if (!_verStackView) {
        
        _verStackView = [[UIStackView alloc] init];
        _verStackView.axis = UILayoutConstraintAxisVertical;
        _verStackView.alignment = UIStackViewAlignmentCenter;
        _verStackView.distribution = UIStackViewDistributionEqualSpacing;
        _verStackView.spacing = 30;
        
        [_verStackView addArrangedSubview:self.titleLabel];
        [_verStackView addArrangedSubview:self.logoImageView];
        [_verStackView addArrangedSubview:self.btnStackView];
        
    }
    
    return _verStackView;
}

-(UILabel *)titleLabel{
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"Stack View";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    return _titleLabel;
}

-(UIImageView *)logoImageView{
    
    if (!_logoImageView) {
        
        _logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
        
    }
    return _logoImageView;
}

-(UIStackView *)btnStackView{
    
    if (!_btnStackView) {
        
        _btnStackView = [[UIStackView alloc] initWithArrangedSubviews:@[self.addBtn,self.remBtn]];
        
        _btnStackView.axis = UILayoutConstraintAxisHorizontal;
        _btnStackView.alignment = UIStackViewAlignmentCenter;
        _btnStackView.distribution = UIStackViewDistributionFillEqually;
        _btnStackView.spacing = 10;
    
    }
    return _btnStackView;
}


-(UIButton *)addBtn{
    if (!_addBtn) {
        
        _addBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        [_addBtn setTitle:@"add Star" forState:(UIControlStateNormal)];
        [_addBtn setTitleColor:[UIColor greenColor] forState:(UIControlStateNormal)];
        [_addBtn addTarget:self action:@selector(addStarAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _addBtn;
    
    
}
-(UIButton *)remBtn{
    
    if (!_remBtn) {
        
        _remBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_remBtn setTitle:@"remove Star" forState:(UIControlStateNormal)];
        [_remBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        [_remBtn addTarget:self action:@selector(remStarAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    return _remBtn;
 
}



-(UIStackView *)horStackView{
    if (!_horStackView) {
        
        _horStackView = [[UIStackView alloc] init];
        
        _horStackView.axis = UILayoutConstraintAxisHorizontal;
        _horStackView.alignment = UIStackViewAlignmentCenter;
        _horStackView.distribution = UIStackViewDistributionFillEqually;
        _horStackView.spacing = 10;
    }
    return _horStackView;
    
}

-(void)addStarAction{
    
    UIImageView *starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    starImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    starImageView.clipsToBounds = YES;
    
    [self.horStackView addArrangedSubview:starImageView];
    
    [UIView animateWithDuration:0.5 animations:^{

        [self.horStackView layoutIfNeeded];
    }];
    
    
}
-(void)remStarAction{
    
    UIView *star = self.horStackView.arrangedSubviews.lastObject;
    [self.horStackView removeArrangedSubview:star];
    [star removeFromSuperview];
    
    [UIView animateWithDuration:0.5 animations:^{
       
        [self.horStackView layoutIfNeeded];
    }];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.verStackView];
    
    [_verStackView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view.mas_top).offset(20);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-200);
        
    }];
    
    [self.view addSubview:self.horStackView];
    
    [_horStackView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.verStackView.mas_bottom);
        
    }];
    
}


@end
