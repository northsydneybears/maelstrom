//
//  postsViewController.m
//  Maelstrom
//
//  Created by Peter Gow on 14/04/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "postsViewController.h"
#import "threadsViewController.h"
#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "threadCell.h"

@interface postsViewController ()

@end

@implementation postsViewController

@synthesize fromThread;


- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		
		// The className to query on
		self.parseClassName = @"Post";
		
		// The key of the PFObject to display in the label of the default cell style
		//self.textKey = @"text";
		
		// Uncomment the following line to specify the key of a PFFile on the PFObject to display in the imageView of the default cell style
		// self.imageKey = @"image";
		
		// Whether the built-in pull-to-refresh is enabled
		self.pullToRefreshEnabled = YES;
		
		// Whether the built-in pagination is enabled
		self.paginationEnabled = YES;
		
		// The number of objects to show per page
		self.objectsPerPage = 25;
	}
	return self;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


#pragma mark - UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Set a non-existent background and shadow image to get rid of the line between the navigation bar and the view
	[self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
	self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
	
	// Make the navigation bar transparent
	self.navigationController.navigationBar.translucent = YES;
	self.navigationController.view.backgroundColor = [UIColor clearColor];
	
	// Add the background and send it to the back behind the buttons
	UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
	[self.view addSubview:backgroundView];
	[self.view sendSubviewToBack:backgroundView];
	
	// Set the Navigation Bar back button to white and just an arrow without text
	self.navigationController.navigationBar.tintColor = [UIColor redColor];
	[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
	
	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;
	
	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	//self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload {
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - PFQueryTableViewController

- (void)objectsWillLoad {
	[super objectsWillLoad];
	
	// This method is called before a PFQuery is fired to get more objects
}

- (void)objectsDidLoad:(NSError *)error {
	[super objectsDidLoad:error];
	
	// This method is called every time objects are loaded from Parse via the PFQuery
}

//// Get number of sections in tableview
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//	// Return the number of sections.
//	return 1;
//}
//
//// Get number of rows by counting number of threads
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//	return threadsArray.count;
//}

// Query Parse for the table data
//- (PFQuery *)queryForTable {
	
//	PFQuery *query = [PFQuery queryWithClassName:@"Post"];
//	[query whereKey:@"fromCategory" equalTo:self.categoryType];
	//	[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
	//  if (!error) {
	//		// The find succeeded.
	//		NSLog(@"Successfully retrieved %d threads.", objects.count);
	//		// Do something with the found objects
	//		for (PFObject *object in objects) {
	//			NSLog(@"%@", object.objectId);
	//		}
	//	} else {
	//		// Log details of the failure
	//		NSLog(@"Error: %@ %@", error, [error userInfo]);
	//	}
	//
	//	}];
	
	//	[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
	//		if (!error) {
	//			threadsArray = [[NSArray alloc] initWithArray:objects];
	//		}
	//		[threadsTable reloadData];
	//	}];
	
	// If Pull To Refresh is enabled, query against the network by default.
//	if (self.pullToRefreshEnabled) {
//		query.cachePolicy = kPFCachePolicyNetworkOnly;
//	}
 
	// If no objects are loaded in memory, we look to the cache first to fill the table
	// and then subsequently do a query against the network.
//	if (self.objects.count == 0) {
//		query.cachePolicy = kPFCachePolicyCacheThenNetwork;
//	}
 
//	[query orderByDescending:@"createdAt"];
	
//	return query;
	
// }

// Override to customize the look of a cell representing an object. The default is to display
// a UITableViewCellStyleDefault style cell with the label being the textKey in the object,
// and the imageView being the imageKey in the object.
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
//	static NSString *CellIdentifier = @"threadCell";
//	
//	threadCell *cell = (threadCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//	if (cell == nil) {
//		cell = [[threadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//	}
//	
//	// Configure the cell
//	cell.threadTitle.text = [object objectForKey:@"title"];
//	
//	NSNumber *posts = [object objectForKey:@"numberOfPosts"];
//	cell.numberOfPosts.text = [posts stringValue];
//	
//	NSNumber *views = [object objectForKey:@"numberOfViews"];
//	cell.numberOfViews.text = [views stringValue];
//	
//	NSDate *lastPostTime = [object objectForKey:@"lastPostTime"];
//	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//	[formatter setDateStyle:NSDateFormatterNoStyle];
//	[formatter setTimeStyle:NSDateFormatterShortStyle];
//	cell.lastPostTime.text = [formatter stringFromDate:lastPostTime];
//	
//	return cell;
//}



/*
 // Override if you need to change the ordering of objects in the table.
 - (PFObject *)objectAtIndex:(NSIndexPath *)indexPath {
 return [self.objects objectAtIndex:indexPath.row];
 }
 */

/*
 // Override to customize the look of the cell that allows the user to load the next page of objects.
 // The default implementation is a UITableViewCellStyleDefault cell with simple labels.
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForNextPageAtIndexPath:(NSIndexPath *)indexPath {
 static NSString *CellIdentifier = @"NextPage";
 
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
 if (cell == nil) {
 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
 }
 
 cell.selectionStyle = UITableViewCellSelectionStyleNone;
 cell.textLabel.text = @"Load more...";
 
 return cell;
 }
 */

#pragma mark - UITableViewDataSource

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the object from Parse and reload the table view
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, and save it to Parse
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - UITableViewDelegate
/*
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[super tableView:tableView didSelectRowAtIndexPath:indexPath];
 }
 */

@end
