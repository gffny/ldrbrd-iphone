//
//  lbAuthViewController.m
//  Leaderboard
//
//  Created by John D. Gaffney on 1/8/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "lbAuthViewController.h"
#import "lbCourseDao.h"
#import "lbAuthClient.h"
#import "lbCredentialStore.h"
#import "SVProgressHUD.h"


@interface lbAuthViewController ()

@property (nonatomic, strong) lbCredentialStore *credentialStore;

@end

@implementation lbAuthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //TODO check if there is a stored username (previously logged-in) and set that as the unameField then set the
//    if(defaultUsername) {
//        [self.unameFld.text = getDefaultUsername()];
//        [self.pwordField becomeFirstResponder];
//    } else {
    [self.unameFld becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtn:(id)sender forEvent:(UIEvent *)event {
    //TODO login!
    [SVProgressHUD show];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys: self.unameFld.text, @"j_username", self.pwordField.text, @"j_password", nil];
//    id params = @{
//                  @"j_username": self.unameFld.text,
//                  @"j_password": self.pwordField.text
//                  };
    [[lbAuthClient sharedClient] setAuthorizationHeaderFieldWithUsername:self.unameFld.text password:self.pwordField.text];
    
    [[lbAuthClient sharedClient] POST:@"http://localhost:8080/ldrbrd/j_spring_security_check" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {

            NSString *authToken = [responseObject objectForKey:@"auth_token"];
            [self.credentialStore setAuthToken:authToken];

            [SVProgressHUD dismiss];

            [self dismissViewControllerAnimated:YES completion:nil];
            [self performSegueWithIdentifier:seg_loginToHome sender:self];
        
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (operation.response.statusCode == 500) {
                [SVProgressHUD showErrorWithStatus:@"Something went wrong!"];
            } else {
                NSData *jsonData = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
                NSString *errorMessage = [json objectForKey:@"error"];
                [SVProgressHUD showErrorWithStatus:errorMessage];
            }
        }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
