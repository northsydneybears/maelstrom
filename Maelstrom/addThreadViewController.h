//
//  addThreadViewController.h
//  Maelstrom
//
//  Created by Peter Gow on 14/04/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@class addThreadViewController;

@protocol addThreadViewControllerDelegate <NSObject>

- (void)addThreadViewControllerDidCancel:(addThreadViewController *)controller;
- (void)addThreadViewController:(addThreadViewController *)controller didFinishAddingThread:(PFObject *)thread;

@end

@interface addThreadViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) id <addThreadViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *addThreadTitleButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelAddThreadButton;
@property (weak, nonatomic) IBOutlet UITextField *threadTitleTextField;

// This is the property that allows threadsViewController to pass the thread category to this addThreadViewController
@property (strong, nonatomic) NSString *addThreadToCategory;

@end
