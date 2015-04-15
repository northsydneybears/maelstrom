//
//  postsViewController.h
//  Maelstrom
//
//  Created by Peter Gow on 14/04/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "PFQueryTableViewController.h"

@interface postsViewController : PFQueryTableViewController <UITableViewDelegate>

@property (weak, nonatomic) NSString *fromThread;

@end
