//
//  addPostViewController.h
//  Maelstrom
//
//  Created by Peter Gow on 19/05/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "IQTextView.h"
#import <LHSKeyboardAdjusting/LHSKeyboardAdjusting.h>

@interface addPostViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextView *postTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addPostBarButton;
@property (strong, nonatomic) PFObject *fromThread;

@end
