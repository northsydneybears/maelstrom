//
//  addPostViewController.m
//  Maelstrom
//
//  Created by Peter Gow on 19/05/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "addPostViewController.h"

@interface addPostViewController ()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textViewBottomSpaceToContainer;

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
	keyboardEndFrame = [self.view convertRect:keyboardEndFrame fromView:nil];
	
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
