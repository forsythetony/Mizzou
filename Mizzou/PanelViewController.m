//
//  PanelViewController.m
//  Mizzou
//
//  Created by Anthony Forsythe on 1/30/14.
//  Copyright (c) 2014 ARF. All rights reserved.
//

#import "PanelViewController.h"
#import "SWRevealViewController.h"

#define SECTIONHEADERHEIGHT 40.0
#define LEFTPADDING 10.0

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
    [self revealViewControllerConfig];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _menuItems = @[@"Home", @"Events", @"Dining", @"MyZou", @"Settings"];
    
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
    
    
    [cell.contentView addSubview:titleLabel];
    
    [cell setBackgroundColor:[UIColor grayColor]];
    
    return cell;
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
    [self.revealViewController setRearViewRevealWidth:100.0];
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //Intial configurations for layout and font
    
    UIFont *titleFont = [UIFont fontWithName:@"Papyrus" size:14.0];
    
    UIColor *titleColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    UIColor *backgroundColor = [UIColor colorWithWhite:0.0 alpha:1.0];
    
    CGRect headerRect;
    
    headerRect.origin.x = 0.0 + LEFTPADDING;
    headerRect.origin.y = 0.0;
    headerRect.size.width = self.view.bounds.size.width;
    headerRect.size.height = SECTIONHEADERHEIGHT;
    
    UIView *headerView = [[UIView alloc] initWithFrame:headerRect];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 + LEFTPADDING, 0.0, 200.0, SECTIONHEADERHEIGHT)];
    [titleLabel setFont:titleFont];
    [titleLabel setText:@"Menu"];
    [titleLabel setTextColor:titleColor];
    
    [headerView addSubview:titleLabel];
    [headerView setBackgroundColor:backgroundColor];
    
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SECTIONHEADERHEIGHT;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
