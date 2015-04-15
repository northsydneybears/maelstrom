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


@implementation addThreadViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Set the text field's delegate to enable use of the keyboard hide delegate method
	self.threadTitleTextField.delegate = self;
}

#pragma mark - Buttons

- (IBAction)addThreadTapped:(id)sender {
	
	// Add thread to Parse code here
	PFObject *newThread = [PFObject objectWithClassName:@"Thread"];
	newThread[@"title"] = self.threadTitleTextField.text;
	newThread[@"fromCategory"] = self.addThreadToCategory;
	newThread[@"lastPostUser"] = [PFUser currentUser];
	
	NSNumber *initialPost = @1;
	newThread[@"numberOfPosts"] = initialPost;
	newThread[@"numberOfViews"] = initialPost;
	
	NSDate * now = [NSDate date];
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateFormat:@"HH:mm"];
	newThread[@"lastPostTime"] = now;
	
	[newThread saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
		if (succeeded) {
			NSLog(@"New thread created: %@", self.threadTitleTextField.text);
		} else {
			NSLog(@"No new thread created.");
		}
	}];
	
//		NSLog(@"Contents of text field: %@", self.threadTitleTextField.text);
//		[self performSegueWithIdentifier:@"addThreadToThreadsWithAddedThread" sender:@"Thread Added"];
}

- (IBAction)cancelAddThreadTapped:(id)sender {
	[self.delegate addThreadViewControllerDidCancel:self];

//	NSLog(@"User canceled adding thread");
//	[self performSegueWithIdentifier:@"cancelAddThreadToThreads" sender:@"Cancel Adding Thread"];
}


#pragma mark - UITextField Delegate

// Don't enable the add thread button with no text entered.
- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

	NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
	
	// The enabled property will be equal to the Boolean value of whether there is any text in the field or not
	self.addThreadButton.enabled = ([newText length] > 0);
	
	return YES;
}

// Keyboard hide delegate method. Hides keyboard when user taps done.
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return NO;
}

@end
