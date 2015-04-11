//
//  SettingsViewController.m
//  Hustler
//
//  Created by Guillermo Vera on 11/04/15.
//  Copyright (c) 2015 WallStreetWolfs. All rights reserved.
//

#import "SettingsViewController.h"
#import "CodeViewController.h"
@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cells"];
    switch (indexPath.row) {
        case 1:
            cell.textLabel.text =  @"Hustler mode settings";
            break;
            case 2:
            cell.textLabel.text = @"My Account";
            break;
            
            case 3:
            cell.textLabel.text = @"Security";
            break;
        default:
            break;
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"0" sender:nil];

        
    }else if (indexPath.row == 2){
        [self performSegueWithIdentifier:@"1" sender:nil];

    }else if (indexPath.row == 3){
        CodeViewController* vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"auth"];
        [self presentViewController:vc
                           animated:YES completion:nil];
    }
    
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
