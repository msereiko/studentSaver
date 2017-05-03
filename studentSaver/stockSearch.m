//
//  stockSearch.m
//  studentSaver
//
//  Created by Michael Sereiko on 5/2/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "stockSearch.h"
#import "StockDetailVC.h"

@interface stockSearch ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *stockTableView;

@property (strong, nonatomic) NSArray *tickers;
@property (strong, nonatomic) NSArray *filtered;

@end

@implementation stockSearch

BOOL searchIsActive = NO;
NSString *tickerToPass;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    self.stockTableView.delegate = self;
    self.stockTableView.dataSource = self;
    
    self.tickers = @[@"AAPL", @"AEO", @"ACN", @"AET", @"ADBE", @"AMZN", @"ALK", @"T", @"BAC",
                     @"TXN", @"TGT", @"SPLS", @"SBUX", @"STT", @"STI"];
    
    self.searchBar.placeholder = @"ticker";
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    searchIsActive = YES;
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    searchIsActive = NO;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;{
    
    searchIsActive = YES;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", self.searchBar.text];
    self.filtered = [self.tickers filteredArrayUsingPredicate: pred];
    
    self.stockTableView.reloadData;
}

- (NSInteger)tableView:(UITableView *) stockTableView numberOfRowsInSection:(NSInteger)section{
    if(searchIsActive){
        return self.filtered.count;
    }
    else{
        return 0;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

/**selecting a share and performing the showShare segue**/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *currentCell = [tableView cellForRowAtIndexPath:indexPath];
    tickerToPass = currentCell.textLabel.text;
    [self performSegueWithIdentifier:@"showShare" sender:self];
}

/**pass cell's ticker to Company.init**/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showShare"])
    {
        StockDetailVC *detailVC = segue.destinationViewController; 
        detailVC.currentTicker = tickerToPass;
    }
}

/**populate cells with tickers as user searches**/
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(searchIsActive){
        cell.textLabel.text = [self.filtered objectAtIndex:indexPath.row];
        }
    else{
        cell.textLabel.text = @" ";
    }
    return cell;
}

@end
