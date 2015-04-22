//
//  addThreadQuestionViewController.h
//  Maelstrom
//
//  Created by Peter Gow on 16/04/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "IQTextView.h"
#import "IQKeyboardManager.h"

@interface addThreadQuestionViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *threadTitleLabel;
@property (strong, nonatomic) NSString *userEnteredThreadTitle;
@property (weak, nonatomic) IBOutlet UIButton *addThreadButton;
@property (weak, nonatomic) IBOutlet IQTextView *questionTextView;


// This is the property that allows addThreadController to pass the thread category to this addThreadQuestionViewController
// so that it can be passed to Parse
@property (strong, nonatomic) NSString *addThreadToCategory;

@end
