//
//  StockDetailVC.m
//  studentSaver
//
//  Created by Michael Sereiko on 5/2/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "StockDetailVC.h"
#import "Company.h"

@interface StockDetailVC ()

@property (weak, nonatomic) IBOutlet UILabel *shareName;
@property (weak, nonatomic) IBOutlet UILabel *currentPrice;
@property (weak, nonatomic) IBOutlet UILabel *companyName;
@property (weak, nonatomic) IBOutlet UILabel *dayChange;

@property (weak, nonatomic) IBOutlet UIButton *getSharesButton;

@property (strong, nonatomic) Company *company;

@end

@implementation StockDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.company = [self.company initWithTicker:self.currentTicker];
    NSLog(@"%@", self.company.currentPrice);
    
    self.shareName.text = self.currentTicker;
    self.currentPrice.text = @"$133.34";
    self.companyName.text = @"Apple Inc.";
    self.dayChange.text = @"+0.38%";
    self.dayChange.textColor = [UIColor greenColor];
    self.shareName.adjustsFontSizeToFitWidth = NO;
    self.shareName.font = [UIFont systemFontOfSize:40];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
