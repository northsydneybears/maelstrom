//
//  tabBarController.m
//  Maelstrom
//
//  Created by Peter Gow on 22/04/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "tabBarControllerUniversal.h"

@implementation tabBarControllerUniversal

- (void)viewDidLoad {

	[super viewDidLoad];
	
	self.tabBar.layer.masksToBounds=YES;
	self.tabBar.layer.borderWidth = 0.0;
	
	// Set the tab bar colour attributes
	[[UITabBar appearance] setBarTintColor:[UIColor orangeColor]];
	[[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar-bg"]];
	
	self.tabBar.tintColor = [UIColor orangeColor];
	
	self.tabBar.translucent = NO;
	
}

- (void)viewWillAppear:(BOOL)animated {

	// Set normal and selected images for tab bar icons
	[(UITabBarItem*)[[[self tabBar] items] objectAtIndex:0] setImage:[UIImage imageNamed:@"TabBar_Categories_Normal.png"]];
	[(UITabBarItem*)[[[self tabBar] items] objectAtIndex:0] setSelectedImage:[UIImage imageNamed:@"TabBar_Categories_Selected.png"]];
	
	[(UITabBarItem*)[[[self tabBar] items] objectAtIndex:1] setImage:[UIImage imageNamed:@"TabBar_Favourites_Normal.png"]];
	[(UITabBarItem*)[[[self tabBar] items] objectAtIndex:1] setSelectedImage:[UIImage imageNamed:@"TabBar_Favourites_Selected.png"]];
	
	[(UITabBarItem*)[[[self tabBar] items] objectAtIndex:2] setImage:[UIImage imageNamed:@"TabBar_Activity_Normal.png"]];
	[(UITabBarItem*)[[[self tabBar] items] objectAtIndex:2] setSelectedImage:[UIImage imageNamed:@"TabBar_Activity_Selected.png"]];
	
	[(UITabBarItem*)[[[self tabBar] items] objectAtIndex:3] setImage:[UIImage imageNamed:@"TabBar_Profile_Normal.png"]];
	[(UITabBarItem*)[[[self tabBar] items] objectAtIndex:3] setSelectedImage:[UIImage imageNamed:@"TabBar_Profile_Selected.png"]];
}


@end
