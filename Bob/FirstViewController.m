//
//  FirstViewController.m
//  Bob
//
//  Created by Peter Gow on 21/03/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "FirstViewController.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// Parse test
	PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
	testObject[@"foo"] = @"bar";
	[testObject saveInBackground];
	
	// Facebook test
	FBLoginView *loginView = [[FBLoginView alloc] init];
	loginView.center = self.view.center;
	[self.view addSubview:loginView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
