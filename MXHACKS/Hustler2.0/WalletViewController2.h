//
//  WalletViewController.h
//  Hustler
//
//  Created by Guillermo Vera on 11/04/15.
//  Copyright (c) 2015 WallStreetWolfs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomCell1.h"

@interface WalletViewController2 : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
