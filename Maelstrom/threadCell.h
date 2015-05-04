//
//  threadCell.h
//  Bob
//
//  Created by Peter Gow on 5/04/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import <ParseUI/ParseUI.h>

@interface threadCell : PFTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *threadTitle;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPosts;
@property (weak, nonatomic) IBOutlet UILabel *numberOfViews;
@property (weak, nonatomic) IBOutlet UILabel *lastPostUser;
@property (weak, nonatomic) IBOutlet UILabel *lastPostTime;
@property (weak, nonatomic) IBOutlet UILabel *numberOfFavourites;

@end
