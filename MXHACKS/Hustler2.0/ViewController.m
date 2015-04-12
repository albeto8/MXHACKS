//
//  ViewController.m
//  Hustler
//
//  Created by Guillermo Vera on 11/04/15.
//  Copyright (c) 2015 WallStreetWolfs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(id)sender
{
    NSString *post =[NSString stringWithFormat:@"username=%@&password=%@",_userName.text, _password.text];
    
    NSString *hostStr = @"http://10.49.73.159:8888/hustler/public/login";
    hostStr = [hostStr stringByAppendingString:post];
    NSData *dataURL =  [NSData dataWithContentsOfURL: [ NSURL URLWithString: hostStr ]];
    NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
   // if([serverOutput isEqualToString:@"Yes"]){
        UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"success" message:@"You are authorized"
                                                              delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [alertsuccess show];
        
  //  } else {
    //    UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Fail" message:@"Invalid Access"
                                                       //       delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
     //   [alertsuccess show];
        
//    }
    
    //loginIndicator.hidden = FALSE;
    //[loginIndicator startAnimating];
    //loginButton.enabled = FALSE;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
