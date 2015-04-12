//
//  WalletViewController.m
//  Hustler
//
//  Created by Guillermo Vera on 11/04/15.
//  Copyright (c) 2015 WallStreetWolfs. All rights reserved.
//
#import <LocalAuthentication/LocalAuthentication.h>
#import "WalletViewController2.h"

@interface WalletViewController2 ()
@property (strong, nonatomic) IBOutlet UILabel *labelBudget;

@end

@implementation WalletViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate =  self;
    
    NSURL *url = [NSURL URLWithString:@"http://10.49.73.159:8888/hustler/public/wallet/1"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  //  [self performSegueWithIdentifier:@"next" sender:nil];
   }

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"next"]) {
        UIViewController* vc;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCustomCell1* cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.stockNameLabel.text = @"Modelo";
    cell.actualStockValue.text = @"10.2";
    cell.percentLabel.text = @"-15%";
    
    return cell;
    
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
