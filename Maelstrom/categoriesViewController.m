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
#import	"UIDeviceHardware.h"

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

@property (nonatomic, strong) UILongPressGestureRecognizer *pressJobs;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressGraduates;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressMoney;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressEducation;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressSports;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressTVShows;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressMusic;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressMovies;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressGames;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressFitness;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressFood;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressTravel;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressDrive;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressHome;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressElectronics;
@property (nonatomic, strong) UILongPressGestureRecognizer *pressHobbies;

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
	NSString *platform = [UIDeviceHardware platform];
	NSLog(@"%@", platform);
	
	if ([platform isEqualToString:@"iPhone5,1"] || [platform isEqualToString:@"iPhone5,2"] || [platform isEqualToString:@"iPhone5,3"] || [platform isEqualToString:@"iPhone5,4"] || [platform isEqualToString:@"iPhone6,1"] || [platform isEqualToString:@"iPhone6,2"] || [platform isEqualToString:@"iPod5,1"]) {
		// iPhone 5 and iPod touch
		UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-bg-iphone5.png"]];
		[self.view addSubview:backgroundView];
		[self.view sendSubviewToBack:backgroundView];
	} else if ([platform isEqualToString:@"iPhone7,2"]) {
		// iPhone 6
		UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-bg-iphone6.png"]];
		[self.view addSubview:backgroundView];
		[self.view sendSubviewToBack:backgroundView];
	} else if ([platform isEqualToString:@"iPhone7,1"] || [platform isEqualToString:@"x86_64"]) {
		// iPhone 6 Plus
		UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-bg-iphone6plus.png"]];
		[self.view addSubview:backgroundView];
		[self.view sendSubviewToBack:backgroundView];
	} else if ([platform isEqualToString:@"iPhone3,1"] || [platform isEqualToString:@"iPhone3,3"] || [platform isEqualToString:@"iPhone4,1"] || [platform isEqualToString:@"iPod4,1"]) {
		// iPhone 4/4S and older iPod Touch
		UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-bg-iphone5.png"]];
		[self.view addSubview:backgroundView];
		[self.view sendSubviewToBack:backgroundView];
	}
	
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
	
	self.pressJobs = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressJobsFired:)];
	self.pressGraduates = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressGraduatesFired:)];
	self.pressMoney = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressMoneyFired:)];
	self.pressEducation = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressEducationFired:)];
	self.pressSports = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressSportsFired:)];
	self.pressTVShows = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressTVShowsFired:)];
	self.pressMusic = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressMusicFired:)];
	self.pressMovies = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressMoviesFired:)];
	self.pressGames = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressGamesFired:)];
	self.pressFitness = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressFitnessFired:)];
	self.pressFood = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressFoodFired:)];
	self.pressTravel = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressTravelFired:)];
	self.pressDrive = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressDriveFired:)];
	self.pressHome = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressHomeFired:)];
	self.pressElectronics = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressElectronicsFired:)];
	self.pressHobbies = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressHobbiesFired:)];
	
	[self.jobs addGestureRecognizer:self.pressJobs];
	[self.graduates addGestureRecognizer:self.pressGraduates];
	[self.money addGestureRecognizer:self.pressMoney];
	[self.education addGestureRecognizer:self.pressEducation];
	[self.sports addGestureRecognizer:self.pressSports];
	[self.tvshows addGestureRecognizer:self.pressTVShows];
	[self.music addGestureRecognizer:self.pressMusic];
	[self.movies addGestureRecognizer:self.pressMovies];
	[self.games addGestureRecognizer:self.pressGames];
	[self.fitness addGestureRecognizer:self.pressFitness];
	[self.food addGestureRecognizer:self.pressFood];
	[self.travel addGestureRecognizer:self.pressTravel];
	[self.drive addGestureRecognizer:self.pressDrive];
	[self.home addGestureRecognizer:self.pressHome];
	[self.electronics addGestureRecognizer:self.pressElectronics];
	[self.hobbies addGestureRecognizer:self.pressHobbies];
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

#pragma mark - UILongPressGestureRecognizer

- (void)pressJobsFired:(UILongPressGestureRecognizer *)pressJobs {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-jobs-title.png"]];
	
	if (self.pressJobs.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressGraduatesFired:(UILongPressGestureRecognizer *)pressGraduates {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-graduates-title.png"]];
	
	if (self.pressGraduates.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressMoneyFired:(UILongPressGestureRecognizer *)pressMoney {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-money-title.png"]];
	
	if (self.pressMoney.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressEducationFired:(UILongPressGestureRecognizer *)pressEducation {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-education-title.png"]];
	
	if (self.pressEducation.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressSportsFired:(UILongPressGestureRecognizer *)pressSports {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-sports-title.png"]];
	
	if (self.pressSports.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressTVShowsFired:(UILongPressGestureRecognizer *)pressTVShows {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-tvshows-title.png"]];
	
	if (self.pressTVShows.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressMusicFired:(UILongPressGestureRecognizer *)pressMusic {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-music-title.png"]];
	
	if (self.pressMusic.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressMoviesFired:(UILongPressGestureRecognizer *)pressMovies {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-movies-title.png"]];
	
	if (self.pressMovies.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressGamesFired:(UILongPressGestureRecognizer *)pressGames {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-games-title.png"]];
	
	if (self.pressGames.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressFitnessFired:(UILongPressGestureRecognizer *)pressFitness {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-fitness-title.png"]];
	
	if (self.pressFitness.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressFoodFired:(UILongPressGestureRecognizer *)pressFood {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-food-title.png"]];
	
	if (self.pressFood.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressTravelFired:(UILongPressGestureRecognizer *)pressTravel {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-travel-title.png"]];
	
	if (self.pressTravel.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressDriveFired:(UILongPressGestureRecognizer *)pressDrive {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-drive-title.png"]];
	
	if (self.pressDrive.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressHomeFired:(UILongPressGestureRecognizer *)pressHome {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-home-title.png"]];
	
	if (self.pressHome.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressElectronicsFired:(UILongPressGestureRecognizer *)pressElectronics {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-electronics-title.png"]];
	
	if (self.pressElectronics.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

- (void)pressHobbiesFired:(UILongPressGestureRecognizer *)pressHobbies {
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"categories-hobbies-title.png"]];
	
	if (self.pressHobbies.state == UIGestureRecognizerStateEnded) {
		self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LargeLogoNavigationBar.png"]];
	}
}

#pragma mark - Prepare for Segue, set category type selected by user

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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
