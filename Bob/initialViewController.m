//
//  initialViewController.m
//  Bob
//
//  Created by Peter Gow on 22/03/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "initialViewController.h"
#import <Parse/PFUser.h>
#import "bobLogInViewController.h"
#import "bobSignUpViewController.h"
#import "bobMainViewController.h"
#import "trendingQuestionsViewController.h"
#import "AppDelegate.h"
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import <QuartzCore/QuartzCore.h>
#import <Parse/PFFile.h>
#import <parse/PFTwitterUtils.h>
#import "categoriesViewController.h"

@interface initialViewController ()

@end

@implementation initialViewController

#pragma mark - view methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
		[super viewDidAppear:animated];

		// Check if user is logged in, and if they're not, configure and present the login/signup
			if (![PFUser currentUser]) {
				// Customize the Log In View Controller
				bobLogInViewController *logInViewController = [[bobLogInViewController alloc] init];
				logInViewController.delegate = self;
				logInViewController.facebookPermissions = @[@"friends_about_me"];
				logInViewController.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsTwitter | PFLogInFieldsFacebook | PFLogInFieldsSignUpButton | PFLogInFieldsDismissButton;
		
				// Customize the Sign Up View Controller
				bobSignUpViewController *signUpViewController = [[bobSignUpViewController alloc] init];
				signUpViewController.delegate = self;
				signUpViewController.fields = PFSignUpFieldsDefault | PFSignUpFieldsAdditional;
				logInViewController.signUpController = signUpViewController;
		
				// Present Log In View Controller
				[self presentViewController:logInViewController animated:YES completion:NULL];
				
		// If they are logged in, welcome the user and present the main Bob screen
			} else if ([PFUser currentUser]) {

				// If user is linked to Twitter, we'll use their Twitter screen name
				if ([PFTwitterUtils isLinkedWithUser:[PFUser currentUser]]) {

					[[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString(@"Welcome %@!", nil), [PFTwitterUtils twitter].screenName] message:NSLocalizedString(@"Get your answers in Bob", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
					
				// If user is linked to Facebook, we'll use their Facebook name and store their Facebook email in Parse
				} else if ([PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
					
					// Create an asychronous Facebook request for user's details
					PFUser *user = [PFUser currentUser];
					FBRequest *request = [FBRequest requestForMe];
					[request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
						
								// When Facebook responds, if there are no errors, we'll update the Welcome UIAlertView with their Facebook name
								if (!error) {
							
								// User data as a dictionary, may be useful later!
								NSDictionary *userData = (NSDictionary *)result;
								NSString *name = userData[@"name"];
								user.username = name;
								NSLog(@"Facebook user:%@", name);
								[user saveEventually];
							
								NSString *displayName = result[@"name"];
									if (displayName) {
									[[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString(@"Welcome %@!", nil), displayName] message:NSLocalizedString(@"Get your answers in the Bob", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
									}
								}
					}];
					
					// Store the user's Facebook email in Parse
					
					NSArray *permissionsArray = @[@"user_about_me", @"email"];
					[PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
						if (!error && user) {
							[FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
								if (!error) {
									[[PFUser currentUser] setObject:[result objectForKey:@"email"]
																					 forKey:@"email"];
									[[PFUser currentUser] saveInBackground];
								}
							}];
						}
					}];

				} else {
					// If user is linked to neither, let's use their username for the Welcome label.
					[[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString(@"Welcome %@!", nil), [[PFUser currentUser] username]] message:NSLocalizedString(@"Get your answers in Bob", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
				}
			}
				
			NSLog(@"Login successful");
				
			// Move to the tab view controller on successful login
			[self performSegueWithIdentifier:@"loginToCategories" sender:self];
		}


#pragma mark - PFLogInViewControllerDelegate

// Sent to the delegate to determine whether the log in request should be submitted to the server.
// If the user doesn't enter information in required fields, alert is shown and no data is sent to
// the Parse API
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
		if (username && password && username.length && password.length) {
			return YES;
		}
	
		[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
		return NO;
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
	[self dismissViewControllerAnimated:YES completion:NULL];
	// Here is where you can load profile pictures etc later on
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
	NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
	NSLog(@"User dismissed bobLogInViewController");
}

#pragma mark - PFSignUpViewControllerDelegate

// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
	BOOL informationComplete = YES;
	for (id key in info) {
		NSString *field = [info objectForKey:key];
		if (!field || field.length == 0) {
			informationComplete = NO;
			break;
		}
	}
	
	if (!informationComplete) {
		[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
	}
	
	return informationComplete;
}

// Sent to the delegate when a PFUser is signed up.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
	[self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
	NSLog(@"Failed to sign up...");
}

// Sent to the delegate when the sign up screen is dismissed.
- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
	NSLog(@"User dismissed the signUpViewController");
}

#pragma mark - Miscellaneous

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

	UITabBarController *tabBarController = [segue destinationViewController];
	categoriesViewController *categoriesVC = tabBarController.viewControllers[0];
	
	UITabBar *tabBar = tabBarController.tabBar;
	UITabBarItem *categories = [tabBar.items objectAtIndex:0];
	UITabBarItem *favourites = [tabBar.items objectAtIndex:1];
	UITabBarItem *activity = [tabBar.items objectAtIndex:2];
	UITabBarItem *profile = [tabBar.items objectAtIndex:3];
	
//	categories.title = @"Categories";
//	favourites.title = @"Favourites";
//	activity.title = @"Activity";
//	profile.title = @"Profile";
	
	[categories initWithTitle:@"Categories" image:[UIImage imageNamed:@"TabBar_Categories_Normal.png"] selectedImage:[UIImage imageNamed:@"TabBar_Categories_Selected.png"]];
	[favourites initWithTitle:@"Favourites" image:[UIImage imageNamed:@"TabBar_Favourites_Normal.png"] selectedImage:[UIImage imageNamed:@"TabBar_Favourites_Selected.png"]];
	[activity initWithTitle:@"Activity" image:[UIImage imageNamed:@"TabBar_Activity_Normal.png"] selectedImage:[UIImage imageNamed:@"TabBar_Activity_Selected.png"]];
	[profile initWithTitle:@"Profile" image:[UIImage imageNamed:@"TabBar_Profile_Normal.png"] selectedImage:[UIImage imageNamed:@"TabBar_Profile_Selected.png"]];
	


	
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
