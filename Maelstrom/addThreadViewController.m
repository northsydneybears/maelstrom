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
#import "MBProgressHUD.h"
#import "addThreadQuestionViewController.h"


@implementation addThreadViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Set the text field's delegate to enable use of the keyboard hide delegate method
	self.threadTitleTextField.delegate = self;
	
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

// Don't enable the add thread button with no text entered.
- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

	NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
	
	// The enabled property will be equal to the Boolean value of whether there is any text in the field or not
	self.addThreadTitleButton.enabled = ([newText length] > 0);
	
	return YES;
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
