//
//  PanelViewController.m
//  Mizzou
//
//  Created by Anthony Forsythe on 1/30/14.
//  Copyright (c) 2014 ARF. All rights reserved.
//

#import "PanelViewController.h"
#import "SWRevealViewController.h"
#import "Colours.h"

#define SECTIONHEADERHEIGHT 40.0
#define LEFTPADDING 10.0
#define PANELWIDTH 150.0
#define CELLHEIGHT 40.0

#define FONTTOUSE @"ChalkboardSE-Regular"

@interface PanelViewController ()

@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation PanelViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initialConfiguration];
    [self revealViewControllerConfig];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _menuItems = @[@"Home", @"Events", @"Dining", @"MyZou", @"Settings"];
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [self.menuItems objectAtIndex:indexPath.row];
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell = [self configureCell:cell withIdentifier:CellIdentifier];
    
    return cell;
}
-(UITableViewCell*)configureCell:(UITableViewCell*) cell withIdentifier:(NSString*) name
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 + LEFTPADDING, 0.0, 200.0, 50.0)];
    
    [titleLabel setText:name];
    
    UIFont *labelFont = [UIFont fontWithName:FONTTOUSE size:22.0];
    [titleLabel setFont:labelFont];
    
    [cell.contentView addSubview:titleLabel];
    
    [cell setBackgroundColor:[UIColor colorWithWhite:0.4 alpha:0.5]];
    
    //Create line seperator
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(6.0, CELLHEIGHT - 1.0, PANELWIDTH - 40.0, 1.0)];
    
    [line setBackgroundColor:[UIColor whiteColor]];
    
    [cell.contentView addSubview:line];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELLHEIGHT;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destinationViewController = (UINavigationController*)segue.destinationViewController;
    destinationViewController.title = [[_menuItems objectAtIndex:indexPath.row] capitalizedString];
    
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionRightMost animated: NO];
        };
        
    }
}
-(void)revealViewControllerConfig
{
    [self.revealViewController setRearViewController:self];
    [self.revealViewController setRearViewRevealWidth:PANELWIDTH];
    
    [self.revealViewController setRearViewRevealOverdraw:0.0];
    [self.revealViewController setRearViewRevealDisplacement:0.0];
    [self.revealViewController setBounceBackOnOverdraw:NO];
    
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //Intial configurations for layout and font
    
    UIFont *titleFont = [UIFont fontWithName:FONTTOUSE size:25.0];
    
    UIColor *titleColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    UIColor *backgroundColor = [UIColor colorWithWhite:0.0 alpha:1.0];
    
    CGRect headerRect;
    
    headerRect.origin.x = 0.0;
    headerRect.origin.y = 0.0;
    headerRect.size.width = PANELWIDTH;
    headerRect.size.height = SECTIONHEADERHEIGHT;
    
    UIView *headerView = [[UIView alloc] initWithFrame:headerRect];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 5.0, PANELWIDTH, SECTIONHEADERHEIGHT)];
    [titleLabel setFont:titleFont];
    [titleLabel setText:@"Menu"];
    [titleLabel setTextColor:titleColor];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    [headerView addSubview:titleLabel];
    [headerView setBackgroundColor:backgroundColor];
    
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SECTIONHEADERHEIGHT;
}
-(void)initialConfiguration
{

    
    NSArray *colorsArray = [[UIColor strawberryColor] colorSchemeOfType:ColorSchemeAnalagous];
    
    [self.tableView.backgroundView setTintColor:[UIColor charcoalColor]];
    
}


@end
