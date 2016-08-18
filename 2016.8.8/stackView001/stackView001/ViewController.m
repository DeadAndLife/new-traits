//
//  ViewController.m
//  stackView001
//
//  Created by 王宇腾 on 16/8/6.
//  Copyright © 2016年 王宇腾. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *peopleStackView;
- (IBAction)distributionBtn:(UISegmentedControl *)sender;
- (IBAction)alignmentBtn:(UISegmentedControl *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)distributionBtn:(UISegmentedControl *)sender {
    
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        switch (sender.selectedSegmentIndex) {
            case 0:
                _peopleStackView.distribution = UIStackViewDistributionFill;
                break;
            case 1:
                _peopleStackView.distribution = UIStackViewDistributionFillEqually;
                break;
            case 2:
                _peopleStackView.distribution = UIStackViewDistributionFillProportionally;
                break;
            case 3:
                _peopleStackView.distribution = UIStackViewDistributionEqualSpacing;
                break;
            case 4:
                _peopleStackView.distribution = UIStackViewDistributionEqualCentering;
                break;
                
            default:
                break;
        }
   
    } completion:^(BOOL finished) {
        
    }];
    
    
    
}

- (IBAction)alignmentBtn:(UISegmentedControl *)sender {
    
    
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.2 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        
        switch (sender.selectedSegmentIndex) {
            case 0:
                _peopleStackView.alignment = UIStackViewAlignmentFill;
                break;
            case 1:
                _peopleStackView.alignment = UIStackViewAlignmentTop;
                break;

            case 2:
                _peopleStackView.alignment = UIStackViewAlignmentCenter;
                break;

            case 3:
                _peopleStackView.alignment = UIStackViewAlignmentBottom;
                break;

                
            default:
                break;
        }
        
        
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    
    
}
@end
