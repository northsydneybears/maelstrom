//
//  threadsViewController.h
//  Bob
//
//  Created by Peter Gow on 5/04/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import <ParseUI/ParseUI.h>

@interface threadsViewController : PFQueryTableViewController <UITableViewDelegate> {
	
	NSArray *threadsArray;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addThreadBarButton;
@property (weak, nonatomic) IBOutlet UITableView *threadsTable;
@property (strong, nonatomic) NSString *categoryType;
@property (strong, nonatomic) NSString *threadTitleForPosts;
@end
