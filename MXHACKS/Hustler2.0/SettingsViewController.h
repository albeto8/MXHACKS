//
//  SettingsViewController.h
//  Hustler
//
//  Created by Guillermo Vera on 11/04/15.
//  Copyright (c) 2015 WallStreetWolfs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *auth;

@end
