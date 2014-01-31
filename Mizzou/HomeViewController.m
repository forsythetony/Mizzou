//
//  HomeViewController.m
//  Mizzou
//
//  Created by Anthony Forsythe on 1/30/14.
//  Copyright (c) 2014 ARF. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initialConfiguration];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initialConfiguration
{
    self.title = @"Home";

    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"gray_jean_@2X.jpg"]]];
    [self slidingPanelSetup];
}
-(void)slidingPanelSetup
{
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

@end
