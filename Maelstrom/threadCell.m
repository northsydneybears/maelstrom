//
//  threadCell.m
//  Bob
//
//  Created by Peter Gow on 5/04/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "threadCell.h"
#import <Parse/Parse.h>

@implementation threadCell

@synthesize threadTitle, numberOfPosts, numberOfFavourites, numberOfViews, lastPostTime, lastPostUser;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
