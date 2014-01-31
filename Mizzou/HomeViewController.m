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

    [self.view setBackgroundColor:[UIColor colorWithRed:222.0/255.0 green:179.0/255.0 blue:5.0/255.0 alpha:1.0]];
    [self slidingPanelSetup];
}
-(void)slidingPanelSetup
{
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

@end
