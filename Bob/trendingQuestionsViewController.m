//
//  SecondViewController.m
//  Bob
//
//  Created by Peter Gow on 21/03/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "trendingQuestionsViewController.h"
#import "bobMainViewController.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>
#import "initialViewController.h"
#import "bobLogInViewController.h"
#import "bobSignUpViewController.h"

@interface trendingQuestionsViewController ()

@property (weak, nonatomic) IBOutlet UIButton *logOutButton;

@end

@implementation trendingQuestionsViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)didTapLogOutButton:(id)sender {
	[PFUser logOut];
	
	initialViewController *initialVC = [self.storyboard instantiateViewControllerWithIdentifier:@"initialViewController"];
	[self presentViewController:initialVC animated:YES completion:NULL];
	
}

@end
