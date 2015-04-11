//
//  CodeViewController.m
//  Hustler
//
//  Created by Guillermo Vera on 11/04/15.
//  Copyright (c) 2015 WallStreetWolfs. All rights reserved.
//

#import "CodeViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
@interface CodeViewController ()

@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)code:(id)sender
{
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myReasonString = @"String explaining why app needs authentication";
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myReasonString
                            reply:^(BOOL succes, NSError *error) {
                                if (succes) {
                                    // User authenticated successfully
                                    UIAlertView* al = [[UIAlertView alloc]initWithTitle:@"exito" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                                    [al show];
                                    [self dismissViewControllerAnimated:YES completion:nil];
                                    
                                } else {
                                    // Authenticate failed
                                    UIAlertView* al = [[UIAlertView alloc]initWithTitle:@"nel" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                                    [al show];
                                    

                                }
                            }];
    } else {
        // Could not evaluate policy; check authError
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
