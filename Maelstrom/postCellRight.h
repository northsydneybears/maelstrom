//
//  postCellRight.h
//  Maelstrom
//
//  Created by Peter Gow on 4/05/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "PFTableViewCell.h"

@interface postCellRight : PFTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userThatPostedProfileImage;
@property (weak, nonatomic) IBOutlet UILabel *actualPostLabel;
@property (weak, nonatomic) IBOutlet UIButton *likePostButton;
@property (weak, nonatomic) IBOutlet UILabel *postsNumberOfLikesLabel;
@property (weak, nonatomic) IBOutlet UILabel *postedAtTimeLabel;

@end
