//
//  bobSignUpViewController.m
//  Bob
//
//  Created by Peter Gow on 22/03/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "maelstromSignUpViewController.h"

@implementation maelstromSignUpViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self.signUpView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
	[self.signUpView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]]];
	
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	
	[self.signUpView.logo setFrame:CGRectMake(66.5f, 130.0f, 187.0f, 45.0f)];
}

@end
