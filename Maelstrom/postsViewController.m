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
#import "ProgressHUD.h"
#import "threadCell.h"
#import	"UIDeviceHardware.h"
#import "postCellLeft.h"
#import "postCellRight.h"
#import "addPostViewController.h"

@interface postsViewController ()

@end

@implementation postsViewController

@synthesize fromThread;
@synthesize postsTable;


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
		
		// Remove the Parse default loading view to allow for Progress HUD
		self.loadingViewEnabled = NO;
	
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
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar-bg"] forBarMetrics:UIBarMetricsDefault];
	self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
	
	// Make the navigation bar transparent
	self.navigationController.navigationBar.translucent = NO;
	self.navigationController.view.backgroundColor = [UIColor clearColor];
	
	// Add the background and send it to the back behind the buttons
	NSString *platform = [UIDeviceHardware platform];
	
	if ([platform isEqualToString:@"iPhone5,1"] || [platform isEqualToString:@"iPhone5,2"] || [platform isEqualToString:@"iPhone5,3"] || [platform isEqualToString:@"iPhone5,4"] || [platform isEqualToString:@"iPhone6,1"] || [platform isEqualToString:@"iPhone6,2"] || [platform isEqualToString:@"iPod5,1"]) {
		// iPhone 5 and iPod touch
		UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"threads-posts-bg-iphone5.png"]];
		[self.view addSubview:backgroundView];
		[self.view sendSubviewToBack:backgroundView];
	} else if ([platform isEqualToString:@"iPhone7,2"]) {
		// iPhone 6
		UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"threads-posts-bg-iphone6.png"]];
		[self.view addSubview:backgroundView];
		[self.view sendSubviewToBack:backgroundView];
	} else if ([platform isEqualToString:@"iPhone7,1"] || [platform isEqualToString:@"x86_64"]) {
		// iPhone 6 Plus
		UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"threads-posts-bg-iphone6plus.png"]];
		[self.view addSubview:backgroundView];
		[self.view sendSubviewToBack:backgroundView];
	} else if ([platform isEqualToString:@"iPhone3,1"] || [platform isEqualToString:@"iPhone3,3"] || [platform isEqualToString:@"iPhone4,1"] || [platform isEqualToString:@"iPod4,1"]) {
		// iPhone 4/4S and older iPod Touch
		UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"threads-posts-bg-iphone5.png"]];
		[self.view addSubview:backgroundView];
		[self.view sendSubviewToBack:backgroundView];
	}
	
	// Set the Navigation Bar back button to orange and just an arrow without text
	self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
	[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
	
	// Setup self-sizing cells
	postsTable.estimatedRowHeight = 120.0;
	postsTable.rowHeight = UITableViewAutomaticDimension;
	
	// Creating view for extending background color for pull to refresh so you don't see any white
	CGRect frame = self.tableView.bounds;
	frame.origin.y = -frame.size.height;
	UIView* backgroundView = [[UIView alloc] initWithFrame:frame];
	backgroundView.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:0.9];
	
	// Adding the background view below the refresh control
	[self.tableView insertSubview:backgroundView atIndex:0]; // This has to be after self.refreshControl = refreshControl;
}

// Hide the tab bar in the posts view controller
//-(BOOL)hidesBottomBarWhenPushed {
//	return YES;
//}

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
	
	// Reload PFQueryTable data so that newly added threads appear immediately after unwind Segue from Add Thread view controller
	[self loadObjects];
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

// Query Parse for the table data
- (PFQuery *)queryForTable {
	
	PFQuery *query = [PFQuery queryWithClassName:@"Post"];
	[query whereKey:@"fromThread" equalTo:self.fromThread];
	
	// If Pull To Refresh is enabled, query against the network by default.
	if (self.pullToRefreshEnabled) {
		query.cachePolicy = kPFCachePolicyNetworkOnly;
	}
 
	// If no objects are loaded in memory, we look to the cache first to fill the table
	// and then subsequently do a query against the network.
	if (self.objects.count == 0) {
		query.cachePolicy = kPFCachePolicyCacheThenNetwork;
	}
 
	[query orderByDescending:@"createdAt"];
	
	return query;
	
}

// Override to customize the look of a cell representing an object. The default is to display
// a UITableViewCellStyleDefault style cell with the label being the textKey in the object,
// and the imageView being the imageKey in the object.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
	//static NSString *CellIdentifier = @"postCellLeft";
	
	if (indexPath.row % 2 == 0) {
		postCellLeft *cell = (postCellLeft *)[tableView dequeueReusableCellWithIdentifier:@"postCellLeft"];
		if (cell == nil) {
				cell = [[postCellLeft alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"postCellLeft"];
		}
		
		// Make the cell background transparent
		cell.backgroundColor = [UIColor clearColor];
		cell.backgroundView = [[UIView alloc] init];
		
		// Display the content of the post
		cell.actualPostLabel.text = [object objectForKey:@"actualPost"];
		
		// Show the number of likes for the post
		NSNumber *likes = [object objectForKey:@"numberOfLikes"];
		cell.postsNumberOfLikesLabel.text = [likes stringValue];
		
		// Set the time of the post
		NSDate *lastPostTime = [object objectForKey:@"postedAtTime"];
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateStyle:NSDateFormatterNoStyle];
		[formatter setTimeStyle:NSDateFormatterShortStyle];
		cell.postedAtTimeLabel.text = [formatter stringFromDate:lastPostTime];
		
		// Set the username for the post
		cell.postUsernameLabel.text = [object objectForKey:@"usernameOfPoster"];
		
		return cell;
		
	} else {
		postCellRight *cell = (postCellRight *)[tableView dequeueReusableCellWithIdentifier:@"postCellRight"];
		if (cell == nil) {
			cell = [[postCellRight alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"postCellRight"];
		}
	
		// Configure the cell
	
		// Make the cell background transparent
		cell.backgroundColor = [UIColor clearColor];
		cell.backgroundView = [[UIView alloc] init];
	
		// Display the content of the post
		cell.actualPostLabel.text = [object objectForKey:@"actualPost"];
	
		// Show the number of likes for the post
		NSNumber *likes = [object objectForKey:@"numberOfLikes"];
		cell.postsNumberOfLikesLabel.text = [likes stringValue];
	
		// Set the time of the post
		NSDate *lastPostTime = [object objectForKey:@"postedAtTime"];
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateStyle:NSDateFormatterNoStyle];
		[formatter setTimeStyle:NSDateFormatterShortStyle];
		cell.postedAtTimeLabel.text = [formatter stringFromDate:lastPostTime];
	
		// Set the username for the post
		cell.postUsernameLabel.text = [object objectForKey:@"usernameOfPoster"];
		
		return cell;
	}
}

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

#pragma mark - Segue Actions

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"postsToAddPosts"]) {
		addPostViewController *newPostVC = segue.destinationViewController;
		newPostVC.fromThread = self.fromThread;
	}
}

// Unwind segue
-(IBAction)addPostFinishedAddingPost:(UIStoryboardSegue *)segue {
}

@end
