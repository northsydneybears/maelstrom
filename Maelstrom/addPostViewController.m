//
//  addPostViewController.m
//  Maelstrom
//
//  Created by Peter Gow on 19/05/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "addPostViewController.h"
#import "ProgressHUD.h"

@interface addPostViewController ()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textViewBottomSpaceToContainer;
@property (strong, nonatomic) IBOutlet UIView *greyBackground;

@end

@implementation addPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTextViewPositionForKeyboard:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
	
	// Show the cursor and keyboard immediately, with animated keyboard appearance
	[self.postTextView becomeFirstResponder];
}

-(void)updateTextViewPositionForKeyboard:(NSNotification*)note
{
	NSTimeInterval duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
	UIViewAnimationCurve curve = [note.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
	
	CGRect keyboardEndFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
	keyboardEndFrame = [self.greyBackground convertRect:keyboardEndFrame fromView:nil];
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:duration];
	[UIView setAnimationCurve:curve];
	
	self.textViewBottomSpaceToContainer.constant = CGRectGetMaxY(self.view.bounds) - keyboardEndFrame.origin.y;
	
	[self.view layoutIfNeeded];
	
	[UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addPostButtonTapped:(id)sender {

	// Create a new post object
	PFObject *newPost = [PFObject objectWithClassName:@"Post"];
	
	// Extract a plain string of the username to use as label above post
	NSString *usernameOfPoster = [PFUser currentUser].username;
	
	// Get the timestamp
	NSDate *now = [NSDate date];
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateFormat:@"HH:mm"];
	newPost[@"postedAtTime"] = now;
	
	// Link values to Parse data columns
	[newPost setObject:usernameOfPoster forKey:@"usernameOfPoster"];
	[newPost setObject:[PFUser currentUser] forKey:@"userThatPosted"];
	[newPost setObject:[self.postTextView text] forKey:@"actualPost"];
	[newPost setObject:now forKey:@"postedAtTime"];
	[newPost setObject:[self.fromThread self] forKey:@"fromThread"];
	
	// Show progress
	[ProgressHUD show:@"Adding post..."];
	
	// Unwind to the posts view controller ready to display the new post
	[self performSegueWithIdentifier:@"addPostFinishedUnwindSegue" sender:self];
	
	// Save the new post to Parse
	[PFObject saveAllInBackground:@[newPost] block:^(BOOL succeeded, NSError *error) {
		if (succeeded) {
			[ProgressHUD showSuccess:@"Post Added"];
			NSLog(@"New post added by: %@", [PFUser currentUser].username);
		} else {
			[ProgressHUD showError:@"Network error."];
			NSLog(@"Error: No new post added.");
		}
	}];
}

-(void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
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
