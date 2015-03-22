//
//  AppDelegate.m
//  Bob
//
//  Created by Peter Gow on 21/03/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>
#import <Twitter/Twitter.h>
#import "initialViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	
	// Enable Parse local datastore so the app can be used seamlessly when user is offline
	[Parse enableLocalDatastore];
 
	// Initialize Parse with Bob's unique keys
	[Parse setApplicationId:@"iEYncbhxZ5GGYHLvQKGEhfFkV1AihTvnS98pSwSo"
								clientKey:@"dpSEmTvPieJGS7J3fT5GLeE6q7HhugobvW12h5Xo"];
 
	// Use Parse analytics to track statistics around application opens.
	[PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
	
	[PFTwitterUtils initializeWithConsumerKey:@"C73yi30lDbS4C8TF1BhCzquZm"
														 consumerSecret:@"lrY11Ujj071MvE1G1bRZzJgekd07IjxwPFvQBwF48cvI3F4lmy"];
	
	self.window.rootViewController = [[initialViewController alloc] init];
	
	return YES;
}

// Facebook integration test
- (BOOL)application:(UIApplication *)application
						openURL:(NSURL *)url
	sourceApplication:(NSString *)sourceApplication
				 annotation:(id)annotation {
	// attempt to extract a token from the url
	return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	
	// Start Facebook analytics to track app events
	[FBAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
