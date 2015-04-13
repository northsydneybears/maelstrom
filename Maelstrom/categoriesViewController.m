//
//  categoriesViewController.m
//  Bob
//
//  Created by Peter Gow on 2/04/2015.
//  Copyright (c) 2015 Peter Gow. All rights reserved.
//

#import "categoriesViewController.h"
#import <UIKit/UIKit.h>
#import "threadsViewController.h"

@interface categoriesViewController ()

@property (nonatomic, strong) UITapGestureRecognizer *tapJobs;
@property (nonatomic, strong) UITapGestureRecognizer *tapGraduates;
@property (nonatomic, strong) UITapGestureRecognizer *tapMoney;
@property (nonatomic, strong) UITapGestureRecognizer *tapEducation;
@property (nonatomic, strong) UITapGestureRecognizer *tapSports;
@property (nonatomic, strong) UITapGestureRecognizer *tapTVShows;
@property (nonatomic, strong) UITapGestureRecognizer *tapMusic;
@property (nonatomic, strong) UITapGestureRecognizer *tapMovies;
@property (nonatomic, strong) UITapGestureRecognizer *tapGames;
@property (nonatomic, strong) UITapGestureRecognizer *tapFitness;
@property (nonatomic, strong) UITapGestureRecognizer *tapFood;
@property (nonatomic, strong) UITapGestureRecognizer *tapTravel;
@property (nonatomic, strong) UITapGestureRecognizer *tapDrive;
@property (nonatomic, strong) UITapGestureRecognizer *tapHome;
@property (nonatomic, strong) UITapGestureRecognizer *tapElectronics;
@property (nonatomic, strong) UITapGestureRecognizer *tapHobbies;

@property (weak, nonatomic) IBOutlet UIView *jobs;
@property (weak, nonatomic) IBOutlet UIView *graduates;
@property (weak, nonatomic) IBOutlet UIView *money;
@property (weak, nonatomic) IBOutlet UIView *education;
@property (weak, nonatomic) IBOutlet UIView *sports;
@property (weak, nonatomic) IBOutlet UIView *tvshows;
@property (weak, nonatomic) IBOutlet UIView *music;
@property (weak, nonatomic) IBOutlet UIView *movies;
@property (weak, nonatomic) IBOutlet UIView *games;
@property (weak, nonatomic) IBOutlet UIView *fitness;
@property (weak, nonatomic) IBOutlet UIView *food;
@property (weak, nonatomic) IBOutlet UIView *travel;
@property (weak, nonatomic) IBOutlet UIView *drive;
@property (weak, nonatomic) IBOutlet UIView *home;
@property (weak, nonatomic) IBOutlet UIView *electronics;
@property (weak, nonatomic) IBOutlet UIView *hobbies;

@end

@implementation categoriesViewController

- (void)viewDidLoad {
	//[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
	
	[super viewDidLoad];
	
	// Set a non-existent background and shadow image to get rid of the line between the navigation bar and the view
	[self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
	self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
	
	// Make the navigation bar transparent
	self.navigationController.navigationBar.translucent = YES;
	self.navigationController.view.backgroundColor = [UIColor clearColor];
	
	// Add the custom title to the navigation bar
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	
	// Add the background and send it to the back behind the buttons
	UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
	[self.view addSubview:backgroundView];
	[self.view sendSubviewToBack:backgroundView];
	
	
	self.tapJobs = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapJobsFired:)];
	self.tapGraduates = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGraduatesFired:)];
	self.tapMoney = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMoneyFired:)];
	self.tapEducation = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEducationFired:)];
	self.tapSports = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSportsFired:)];
	self.tapTVShows = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTVShowsFired:)];
	self.tapMusic = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMusicFired:)];
	self.tapMovies = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMoviesFired:)];
	self.tapGames = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGamesFired:)];
	self.tapFitness = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFitnessFired:)];
	self.tapFood = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFoodFired:)];
	self.tapTravel = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTravelFired:)];
	self.tapDrive = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDriveFired:)];
	self.tapHome = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHomeFired:)];
	self.tapElectronics = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapElectronicsFired:)];
	self.tapHobbies = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHobbiesFired:)];
	
	
	[self.jobs addGestureRecognizer:self.tapJobs];
	[self.graduates addGestureRecognizer:self.tapGraduates];
	[self.money addGestureRecognizer:self.tapMoney];
	[self.education addGestureRecognizer:self.tapEducation];
	[self.sports addGestureRecognizer:self.tapSports];
	[self.tvshows addGestureRecognizer:self.tapTVShows];
	[self.music addGestureRecognizer:self.tapMusic];
	[self.movies addGestureRecognizer:self.tapMovies];
	[self.games addGestureRecognizer:self.tapGames];
	[self.fitness addGestureRecognizer:self.tapFitness];
	[self.food addGestureRecognizer:self.tapFood];
	[self.travel addGestureRecognizer:self.tapTravel];
	[self.drive addGestureRecognizer:self.tapDrive];
	[self.home addGestureRecognizer:self.tapHome];
	[self.electronics addGestureRecognizer:self.tapElectronics];
	[self.hobbies addGestureRecognizer:self.tapHobbies];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITapGestureRecognizer actions

- (void)tapJobsFired:(UITapGestureRecognizer *)tapJobs {
	// User tapped Jobs
	threadsViewController *jobsVC = [[threadsViewController alloc] init];
	jobsVC.title = @"Jobs";
	jobsVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Jobs.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Jobs"];
}

- (void)tapGraduatesFired:(UITapGestureRecognizer *)tapGraduates {
	// User tapped Graduates
	threadsViewController *graduatesVC = [[threadsViewController alloc] init];
	graduatesVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Graduates.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Graduates"];
}

- (void)tapMoneyFired:(UITapGestureRecognizer *)tapMoney {
	// User tapped Money
	threadsViewController *moneyVC = [[threadsViewController alloc] init];
	moneyVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Money.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Money"];
}

- (void)tapEducationFired:(UITapGestureRecognizer *)tapEducation {
	// User tapped Education
	threadsViewController *educationVC = [[threadsViewController alloc] init];
	educationVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Education.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Education"];
}

- (void)tapSportsFired:(UITapGestureRecognizer *)tapSports {
	// User tapped Sports
	threadsViewController *sportsVC = [[threadsViewController alloc] init];
	sportsVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Sports.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Sports"];
}

- (void)tapTVShowsFired:(UITapGestureRecognizer *)tapTVShows {
	// User tapped TV Shows
	threadsViewController *tvshowsVC = [[threadsViewController alloc] init];
	tvshowsVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_TVShows.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"TV Shows"];
}

- (void)tapMusicFired:(UITapGestureRecognizer *)tapMusic {
	// User tapped Music
	threadsViewController *musicVC = [[threadsViewController alloc] init];
	musicVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Music.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Music"];
}

- (void)tapMoviesFired:(UITapGestureRecognizer *)tapMovies {
	// User tapped Movies
	threadsViewController *moviesVC = [[threadsViewController alloc] init];
	moviesVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Movies.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Movies"];
}

- (void)tapGamesFired:(UITapGestureRecognizer *)tapGames {
	// User tapped Games
	threadsViewController *gamesVC = [[threadsViewController alloc] init];
	gamesVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Games.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Games"];
}

- (void)tapFitnessFired:(UITapGestureRecognizer *)tapFitness {
	// User tapped Fitness
	threadsViewController *fitnessVC = [[threadsViewController alloc] init];
	fitnessVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Fitness.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Fitness"];
}

- (void)tapFoodFired:(UITapGestureRecognizer *)tapFood {
	// User tapped Food
	threadsViewController *foodVC = [[threadsViewController alloc] init];
	foodVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Food.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Food"];
}

- (void)tapTravelFired:(UITapGestureRecognizer *)tapTravel {
	// User tapped Travel
	threadsViewController *travelVC = [[threadsViewController alloc] init];
	travelVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Travel.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Travel"];
}

- (void)tapDriveFired:(UITapGestureRecognizer *)tapDrive {
	// User tapped Drive
	threadsViewController *driveVC = [[threadsViewController alloc] init];
	driveVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Drive.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Drive"];
}

- (void)tapHomeFired:(UITapGestureRecognizer *)tapHome {
	// User tapped Home
	threadsViewController *homeVC = [[threadsViewController alloc] init];
	homeVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Home.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Home"];
}

- (void)tapElectronicsFired:(UITapGestureRecognizer *)tapElectronics {
	// User tapped Electronics
	threadsViewController *electronicsVC = [[threadsViewController alloc] init];
	electronicsVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Electronics.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Electronics"];
}

- (void)tapHobbiesFired:(UITapGestureRecognizer *)tapHobbies {
	// User tapped Hobbies
	threadsViewController *hobbiesVC = [[threadsViewController alloc] init];
	hobbiesVC.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationBar_Hobbies.png"]];
	[self performSegueWithIdentifier:@"categoryToThreads" sender:@"Hobbies"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	
	if ([sender isEqualToString:@"Jobs"]) {
		threadsViewController *jobsVC = segue.destinationViewController;
		jobsVC.categoryType = @"Jobs";
	} else if ([sender isEqualToString:@"Graduates"]) {
		threadsViewController *graduatesVC = segue.destinationViewController;
		graduatesVC.categoryType = @"Graduates";
	} else if ([sender isEqualToString:@"Money"]) {
		threadsViewController *moneyVC = segue.destinationViewController;
		moneyVC.categoryType = @"Money";
	} else if ([sender isEqualToString:@"Education"]) {
		threadsViewController *educationVC = segue.destinationViewController;
		educationVC.categoryType = @"Education";
	} else if ([sender isEqualToString:@"Sports"]) {
		threadsViewController *sportsVC = segue.destinationViewController;
		sportsVC.categoryType = @"Sports";
	} else if ([sender isEqualToString:@"TV Shows"]) {
		threadsViewController *tvshowsVC = segue.destinationViewController;
		tvshowsVC.categoryType = @"TV Shows";
	} else if ([sender isEqualToString:@"Music"]) {
		threadsViewController *musicVC = segue.destinationViewController;
		musicVC.categoryType = @"Music";
	} else if ([sender isEqualToString:@"Movies"]) {
		threadsViewController *moviesVC = segue.destinationViewController;
		moviesVC.categoryType = @"Movies";
	} else if ([sender isEqualToString:@"Games"]) {
		threadsViewController *gamesVC = segue.destinationViewController;
		gamesVC.categoryType = @"Games";
	} else if ([sender isEqualToString:@"Fitness"]) {
		threadsViewController *fitnessVC = segue.destinationViewController;
		fitnessVC.categoryType = @"Fitness";
	} else if ([sender isEqualToString:@"Food"]) {
		threadsViewController *foodVC = segue.destinationViewController;
		foodVC.categoryType = @"Food";
	} else if ([sender isEqualToString:@"Travel"]) {
		threadsViewController *travelVC = segue.destinationViewController;
		travelVC.categoryType = @"Travel";
	} else if ([sender isEqualToString:@"Drive"]) {
		threadsViewController *driveVC = segue.destinationViewController;
		driveVC.categoryType = @"Drive";
	} else if ([sender isEqualToString:@"Home"]) {
		threadsViewController *homeVC = segue.destinationViewController;
		homeVC.categoryType = @"Home";
	} else if ([sender isEqualToString:@"Electronics"]) {
		threadsViewController *electronicsVC = segue.destinationViewController;
		electronicsVC.categoryType = @"Electronics";
	} else if ([sender isEqualToString:@"Hobbies"]) {
		threadsViewController *hobbiesVC = segue.destinationViewController;
		hobbiesVC.categoryType = @"Hobbies";
	}
}

- (void) performCategoryToThreadsSegue:(id)sender {
	[self performSegueWithIdentifier:@"categoryToThreads" sender:sender];
}


/*
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
