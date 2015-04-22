//
//  addThreadViewController.m
//  Maelstrom
//
//  Created by Peter Gow on 14/04/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "addThreadViewController.h"
#import "threadsViewController.h"
#import "categoriesViewController.h"
#import "addThreadQuestionViewController.h"


@implementation addThreadViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Set the text field's delegate to enable use of the keyboard hide delegate method
	self.threadTitleTextField.delegate = self;
	
	// Initially, the add thread button should be disabled with no text yet entered
	self.addThreadTitleButton.enabled = NO;
	
	// Tap gesture recogniser to hide the keyboard when user taps outside of the keyboard
	UITapGestureRecognizer *tapOutsideKeyboardRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
	[[self view] addGestureRecognizer:tapOutsideKeyboardRecognizer];
}

#pragma mark - Buttons

- (IBAction)cancelAddThreadTapped:(id)sender {
	[self.delegate addThreadViewControllerDidCancel:self];
	NSLog(@"User canceled adding thread");
}

#pragma mark - UITextField Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
	self.addThreadTitleButton.enabled = YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	NSString *newText = self.threadTitleTextField.text;
	self.addThreadTitleButton.enabled = ([newText length] > 0);
}

#pragma mark - Hiding the keyboard

// Keyboard hide delegate method. Hides keyboard when user taps done.
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return NO;
}

// Hide the keyboard when a user taps outside it
-(void)hideKeyboard {
	[[self view] endEditing:YES];
}

// Send the entered thread title to display in the next view controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"addThreadToAddQuestion"]) {
		addThreadQuestionViewController *newThreadVC = segue.destinationViewController;
		newThreadVC.userEnteredThreadTitle = self.threadTitleTextField.text;
		newThreadVC.addThreadToCategory = self.addThreadToCategory;
		}
}

#pragma mark - Unwind Segue
-(IBAction)addThreadUserTappedBackButton:(UIStoryboardSegue *)segue {
}

@end
