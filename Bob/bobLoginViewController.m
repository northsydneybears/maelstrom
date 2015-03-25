//
//  bobLoginViewController.m
//  Bob
//
//  Created by Peter Gow on 22/03/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "bobLogInViewController.h"

@implementation bobLogInViewController

-(void)viewDidLoad {
	[super viewDidLoad];
	
	[self.logInView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg.png"]]];
	[self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bob_logo.png"]]];
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	
	[self.logInView.logo setFrame:CGRectMake(66.5f, 130.0f, 187.0f, 58.5f)];
}

@end
