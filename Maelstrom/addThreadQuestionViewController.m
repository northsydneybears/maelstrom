//
//  addThreadQuestionViewController.m
//  Maelstrom
//
//  Created by Peter Gow on 16/04/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "addThreadQuestionViewController.h"
#import "ProgressHUD.h"
#import "IQKeyboardReturnKeyHandler.h"
#import "IQTextView.h"

@implementation addThreadQuestionViewController {
	IQKeyboardReturnKeyHandler *returnKeyHandler;
}

@synthesize userEnteredThreadTitle;
@synthesize addThreadToCategory;
@synthesize questionTextView;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Set the text field's delegate to enable use of the keyboard hide delegate method. Also set a placeholder text.
	self.questionTextView.delegate = self;
	self.questionTextView.placeholder = @"Type your question...";
	self.questionTextView.textColor = [UIColor blackColor];
	
	// Set the title label
	self.threadTitleLabel.text = userEnteredThreadTitle;
	
	// Tap gesture recogniser to hide the keyboard when user taps outside of the keyboard
	UITapGestureRecognizer *tapOutsideKeyboardRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
	[[self view] addGestureRecognizer:tapOutsideKeyboardRecognizer];
	
	// Instantiate the IQKeyboardManager to allow for keyboard hide/show moving the view
	returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
}

- (IBAction)addThreadTapped:(id)sender {

	// Add thread to Parse
	PFObject *newThread = [PFObject objectWithClassName:@"Thread"];
	newThread[@"title"] = self.userEnteredThreadTitle;
	newThread[@"fromCategory"] = self.addThreadToCategory;
	newThread[@"lastPostUser"] = [PFUser currentUser];
	
	NSNumber *initialPost = @1;
	newThread[@"numberOfPosts"] = initialPost;
	newThread[@"numberOfViews"] = initialPost;
	
	NSDate * now = [NSDate date];
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateFormat:@"HH:mm"];
	newThread[@"lastPostTime"] = now;
	
	// Add first post to Parse with all code between here and //Show progress
	PFObject *firstPost = [PFObject objectWithClassName:@"Post"];
	[firstPost setObject:[self.questionTextView text] forKey:@"actualPost"];
	[firstPost setObject:[PFUser currentUser] forKey:@"userThatPosted"];
	[firstPost setObject:[newThread self] forKey:@"fromThread"];

	// Show progress
	[ProgressHUD show:@"Adding thread..."];
	
	[PFObject saveAllInBackground:@[newThread, firstPost] block:^(BOOL succeeded, NSError *error) {
		if (succeeded) {
			[ProgressHUD showSuccess:@"Added"];
			NSLog(@"New thread created: %@", self.userEnteredThreadTitle);
		} else {
			[ProgressHUD showError:@"Network error."];
			NSLog(@"No new thread created.");
		}
	}];
}

#pragma mark - Hiding the keyboard

// Hide the keyboard when a user taps outside it
-(void)hideKeyboard {
	[[self view] endEditing:YES];
}

// Keyboard hide delegate method. Hides keyboard when user taps done.
- (BOOL)textViewShouldReturn:(UITextView *)textView {
	[textView resignFirstResponder];
	return NO;
}

#pragma mark - UITextView

// Achieve placeholder text like a UITextField
- (void)textViewDidBeginEditing:(IQTextView *)textView
{
	if ([textView.text isEqualToString:@"Type your question..."]) {
		textView.text = @"";
		textView.textColor = [UIColor blackColor];
	}
	[textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(IQTextView *)textView
{
	if ([textView.text isEqualToString:@""]) {
		textView.text = @"Type your question...";
		textView.textColor = [UIColor lightGrayColor];
	}
	[textView resignFirstResponder];
}

// Required for the use of IQKeyboardManager. See documentation on GitHub.
- (void)dealloc	{
	returnKeyHandler = nil;
}


@end
