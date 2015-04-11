//
//  MyCustomCell1.h
//  Hustler
//
//  Created by Guillermo Vera on 11/04/15.
//  Copyright (c) 2015 WallStreetWolfs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NZCircularImageView.h"
@interface MyCustomCell1 : UITableViewCell
@property (weak, nonatomic) IBOutlet NZCircularImageView *myImage;
@property (weak, nonatomic) IBOutlet UILabel *stockNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *actualStockValue;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;

@end
