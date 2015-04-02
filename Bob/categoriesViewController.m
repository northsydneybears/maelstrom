//
//  categoriesViewController.m
//  Bob
//
//  Created by Peter Gow on 2/04/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "categoriesViewController.h"

@interface categoriesViewController ()

@end

@implementation categoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithCoder:(NSCoder *)aCoder
{
	self = [super initWithCoder:aCoder];
	if (self) {
		// The className to query on
		self.parseClassName = @"Category";
		
		// The key of the PFObject to display in the label of the default cell style
		self.textKey = @"title";
		
		// Whether the built-in pull-to-refresh is enabled
		self.pullToRefreshEnabled = YES;
		
		// Whether the built-in pagination is enabled
		self.paginationEnabled = NO;
		//self.objectsPerPage = 8;
	}
	return self;
}

- (PFQuery *)queryForTable {
	PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
 
	[query orderByAscending:@"listOrder"];
 
	return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {

	static NSString *cellIdentifier = @"categoryCell";
 
	PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (!cell) {
		cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
																	reuseIdentifier:cellIdentifier];
	}
 
	cell.textLabel.text = object[@"title"];
	cell.textLabel.textColor = [UIColor whiteColor];
	cell.textLabel.font = [UIFont fontWithName:@"Avenir" size:18];
	
	// Configure the cell to show further explanation of the category
	//cell.detailTextLabel.text = [NSString stringWithFormat:"%@",
	//														 object[@"detailText"]];
 
	return cell;
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
