//
//  GetSharesVC.m
//  studentSaver
//
//  Created by Michael Sereiko on 5/3/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "GetSharesVC.h"

@interface GetSharesVC ()

@property (weak, nonatomic) IBOutlet UILabel *tickerLabel;
@property (weak, nonatomic) IBOutlet UITextField *enterSharesField;

@end

@implementation GetSharesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tickerLabel.text = @"AAPL";
    self.tickerLabel.font = [UIFont systemFontOfSize:40];
    self.enterSharesField.keyboardType = UIKeyboardTypeNumberPad;
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
