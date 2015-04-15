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

@property (weak, nonatomic) IBOutlet UIButton *addThreadButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelAddThreadButton;
@property (weak, nonatomic) IBOutlet UITextField *threadTitleTextField;
@property (weak, nonatomic) NSString *addThreadToCategory;

@end
