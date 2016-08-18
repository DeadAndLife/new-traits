//
//  ViewController.m
//  stackView003
//
//  Created by 王宇腾 on 16/8/6.
//  Copyright © 2016年 王宇腾. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()

@property (nonatomic,strong) UIStackView *verStackView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *logoImageView;
@property (nonatomic,strong) UIStackView *btnSatckView;

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
        [_verStackView addArrangedSubview:self.btnSatckView];
    }
    
    return _verStackView;
}

-(UILabel *)titleLabel{
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"Do you love me?";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    return _titleLabel;
}

-(UIImageView *)logoImageView{
    
    if (!_logoImageView) {
        
        _logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
        _logoImageView.clipsToBounds = YES;
    }
    
    return _logoImageView;
}

-(UIStackView *)btnSatckView{
    
    if (!_btnSatckView) {
        
        _btnSatckView = [[UIStackView alloc] initWithArrangedSubviews:@[self.addBtn,self.remBtn]];
        _btnSatckView.axis = UILayoutConstraintAxisHorizontal;
        _btnSatckView.alignment = UIStackViewAlignmentCenter;
        _btnSatckView.spacing = 10;
    }
    
    return _btnSatckView;
}

-(UIButton *)addBtn{
    
    if (!_addBtn) {
        
        _addBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_addBtn setTitle:@"add Star" forState:(UIControlStateNormal)];
        [_addBtn setTitleColor:[UIColor greenColor] forState:(UIControlStateNormal)];
        [_addBtn addTarget:self action:@selector(addStartAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    return _addBtn;
}

-(UIButton *)remBtn{
    
    if (!_remBtn) {
        
        _remBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_remBtn setTitle:@"remove Start" forState:(UIControlStateNormal)];
        [_remBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_remBtn addTarget:self action:@selector(removeStarAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    return _remBtn;
}


-(void)addStartAction{
    
    UIImageView *starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    
    starImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.horStackView addArrangedSubview:starImageView];
    
    [UIView animateWithDuration:0.25 animations:^{
       
        [self.horStackView layoutIfNeeded];
    }];
    
}


-(void)removeStarAction{
    UIView *star = self.horStackView.arrangedSubviews.lastObject;
    
    
    [self.horStackView removeArrangedSubview:star];
    
    [star removeFromSuperview];
    
    [UIView animateWithDuration:0.25 animations:^{
       
        [self.horStackView layoutIfNeeded];
    }];
    
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
