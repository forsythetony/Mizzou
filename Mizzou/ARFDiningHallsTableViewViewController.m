//
//  ARFDiningHallsTableViewViewController.m
//  Mizzou
//
//  Created by Anthony Forsythe on 2/19/14.
//  Copyright (c) 2014 ARF. All rights reserved.
//

#import "ARFDiningHallsTableViewViewController.h"

@interface ARFDiningHallsTableViewViewController () {
    NSMutableArray *diningHalls;
}

@end

@implementation ARFDiningHallsTableViewViewController

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
    [self slidingPanelSetup];

    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(showTestNotifiction) userInfo:nil repeats:NO];
    
    [self.tableView addParallaxWithImage:[UIImage imageNamed:@"mizzouDining.jpg"] andHeight:140.0];
    
    
    diningHalls = [self dataSetup];
    
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[self createCardView] style:UIBarButtonItemStylePlain target:nil action:nil];
    [rightItem setTintColor:[UIColor dangerColor]];
    [self.navigationItem setRightBarButtonItem:rightItem];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [diningHalls count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    NSDictionary *diningHall = [diningHalls objectAtIndex:indexPath.row];
    
//    cell.textLabel.text = [diningHall objectForKey:@"name"];
    
    cell = [self configureCell:cell withIndex:indexPath.row];
    
    
    
    
    
    return cell;
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
-(void)slidingPanelSetup
{
    
    //Set up panel view things
    _panelViewButton.target = self;
    _panelViewButton.action = @selector(panelPressed:);
    
    //Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    //[self.revealViewController setFrontViewPosition:FrontViewPositionLeft animated:YES];
    
    //  Panel View button
    
    float sizeOfButton = 30.0;
    
    FAKIonIcons *panelButton = [FAKIonIcons naviconIconWithSize:sizeOfButton];
    
    [_panelViewButton setImage:[panelButton imageWithSize:CGSizeMake(sizeOfButton, sizeOfButton)]];
    [_panelViewButton setTintColor:[UIColor whiteColor]];
    
}
-(void)panelPressed:(id) sender
{
    [self.revealViewController revealToggle:sender];
}
-(NSMutableArray*)dataSetup
{
    NSMutableArray *halls = [NSMutableArray new];
    
    //  Create first dining hall
    
    NSArray *traffic = [NSArray arrayWithObjects:
                                                    [NSNumber numberWithFloat:20.0],
                                                    [NSNumber numberWithFloat:40.0],
                                                    [NSNumber numberWithFloat:30.0],
                                                    [NSNumber numberWithFloat:50.0],
                                                    [NSNumber numberWithFloat:60.0],
                                                    [NSNumber numberWithFloat:64.0],
                                                    [NSNumber numberWithFloat:60.0], nil];
    NSArray *trafficFuture = [NSArray arrayWithObjects:
                        [NSNumber numberWithFloat:60.0],
                        [NSNumber numberWithFloat:60.0],
                        [NSNumber numberWithFloat:40.0],
                        [NSNumber numberWithFloat:70.0],
                        [NSNumber numberWithFloat:20.0],
                        [NSNumber numberWithFloat:22.0],
                        [NSNumber numberWithFloat:60.0], nil];
    
    NSArray *trafficBaja = [NSArray arrayWithObjects:
                        [NSNumber numberWithFloat:56.0],
                        [NSNumber numberWithFloat:72.0],
                        [NSNumber numberWithFloat:55.0],
                        [NSNumber numberWithFloat:34.0],
                        [NSNumber numberWithFloat:20.0],
                        [NSNumber numberWithFloat:10.0],
                        [NSNumber numberWithFloat:5.0], nil];
    
    NSArray *trafficBajaFuture = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:5.0],
                            [NSNumber numberWithFloat:12.0],
                            [NSNumber numberWithFloat:35.0],
                            [NSNumber numberWithFloat:44.0],
                            [NSNumber numberWithFloat:20.0],
                            [NSNumber numberWithFloat:40.0],
                            [NSNumber numberWithFloat:13.0], nil];

    NSArray *trafficDobbs = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:58.0],
                            [NSNumber numberWithFloat:72.0],
                            [NSNumber numberWithFloat:52.0],
                            [NSNumber numberWithFloat:44.0],
                            [NSNumber numberWithFloat:10.0],
                            [NSNumber numberWithFloat:0.0],
                            [NSNumber numberWithFloat:0.0], nil];
    
    NSArray *trafficDobbsFuture = [NSArray arrayWithObjects:
                             [NSNumber numberWithFloat:0.0],
                             [NSNumber numberWithFloat:0.0],
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:0], nil];
    
    NSArray *trafficRollins = [NSArray arrayWithObjects:
                             [NSNumber numberWithFloat:10.0],
                             [NSNumber numberWithFloat:20.0],
                             [NSNumber numberWithFloat:23.0],
                             [NSNumber numberWithFloat:34.0],
                             [NSNumber numberWithFloat:40.0],
                             [NSNumber numberWithFloat:38.0],
                             [NSNumber numberWithFloat:34.0], nil];
    
    NSArray *trafficRollinsFuture = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:34.0],
                               [NSNumber numberWithFloat:44.0],
                               [NSNumber numberWithFloat:50.0],
                               [NSNumber numberWithFloat:30.0],
                               [NSNumber numberWithFloat:50.0],
                               [NSNumber numberWithFloat:44.0],
                               [NSNumber numberWithFloat:30.0], nil];
    
    NSArray *trafficMark = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:10.0],
                               [NSNumber numberWithFloat:30.0],
                               [NSNumber numberWithFloat:50.0],
                               [NSNumber numberWithFloat:23.0],
                               [NSNumber numberWithFloat:20.0],
                               [NSNumber numberWithFloat:34.0],
                               [NSNumber numberWithFloat:52.0], nil];
    
    NSArray *trafficMarkFuture = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:52.0],
                            [NSNumber numberWithFloat:40.0],
                            [NSNumber numberWithFloat:30.0],
                            [NSNumber numberWithFloat:27.0],
                            [NSNumber numberWithFloat:15.0],
                            [NSNumber numberWithFloat:10.0],
                            [NSNumber numberWithFloat:5.0], nil];
    
    
    NSArray *keys = [NSArray arrayWithObjects:@"name", @"hours", @"location", @"menu", @"traffic", @"walking", @"isOpen", @"future", nil];
    
    NSArray *baja = [NSArray arrayWithObjects:@"Baja Grill", @"8:00am - 11:00pm", @"Bingham Commons", @"theMenu", trafficBaja, @"14min", [NSNumber numberWithBool:YES], trafficBajaFuture, nil];
    
    
    
    NSArray *plaza = [NSArray arrayWithObjects:
                      @"Plaza 900",
                      @"7:00am - 6:00pm",
                      @"900 Virginia Avenue, University of Missouri, Columbia, MO",
                      [NSString stringWithFormat:@"This would be the menu"],
                      [NSArray arrayWithArray:traffic],
                      @"5min",
                      [NSNumber numberWithBool:YES],
                      trafficFuture,
                      nil];
    
    NSArray *dobbs = [NSArray arrayWithObjects:
                      @"Pavilion at Dobbs",
                      @"7:00am - 6:00pm",
                      @"Dobbs Pavilion, University of Missouri, Columbia, MO",
                      [NSString stringWithFormat:@"This would be the menu"],
                      [NSArray arrayWithArray:trafficDobbs],
                      @"10min",
                      [NSNumber numberWithBool:NO],
                      trafficDobbsFuture,
                      nil];
    
    
    NSArray *rollins = [NSArray arrayWithObjects:
                      @"Rollins",
                      @"7:00am - 6:00pm",
                      @"Rollins , University of Missouri, Columbia, MO",
                      [NSString stringWithFormat:@"This would be the menu"],
                      [NSArray arrayWithArray:trafficRollins],
                      @"4min",
                      [NSNumber numberWithBool:YES],
                        trafficRollinsFuture,
                      nil];
    
    NSArray *mark = [NSArray arrayWithObjects:
                        @"The Mark",
                        @"7:00am - 6:00pm",
                        @"The Mark , University of Missouri, Columbia, MO",
                        [NSString stringWithFormat:@"This would be the menu"],
                        [NSArray arrayWithArray:trafficMark],
                        @"4min",
                        [NSNumber numberWithBool:YES],
                     trafficMarkFuture,
                        nil];
    
    
    [halls addObject:[NSDictionary dictionaryWithObjects:plaza forKeys:keys]];
    
    [halls addObject:[NSDictionary dictionaryWithObjects:baja forKeys:keys]];
    
    [halls addObject:[NSDictionary dictionaryWithObjects:dobbs forKeys:keys]];
    
    [halls addObject:[NSDictionary dictionaryWithObjects:rollins forKeys:keys]];
    
    [halls addObject:[NSDictionary dictionaryWithObjects:mark forKeys:keys]];
    
    
    return halls;
    
    
    
    
}
-(UITableViewCell*)configureCell:(UITableViewCell*) cell withIndex:(NSUInteger) theIndex
{
    float headerHeight = 25.0;

    //  Add chart to cell
    
    NSDictionary *theDiningHall = [diningHalls objectAtIndex:theIndex];
    
    
    CGRect chartFrame;
    
    chartFrame.origin = CGPointMake(0.0, headerHeight);
    
    chartFrame.size.height = cell.bounds.size.height - headerHeight;
    chartFrame.size.width = 320.0 / 2;
    
    
    
    
    
    PNLineChart *lineChart = [[PNLineChart alloc] initWithFrame:chartFrame];
    
    [lineChart setXLabels:@[@"0", @"-30m", @"-1hr", @"-1.5hrs", @"-2hrs", @"-2.5hrs", @"-3hrs"]];
    
    // Line chart 1
    NSArray *data01Array = [theDiningHall objectForKey:@"traffic"];
    
    NSNumber *lastCount = [data01Array lastObject];
    
    PNLineChartData *data1 = [PNLineChartData new];
    
    [data1 setColor:[UIColor blackColor]];
    data1.itemCount = lineChart.xLabels.count;
    data1.getData = ^(NSUInteger index) {
        CGFloat yValue = [[data01Array objectAtIndex:index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    lineChart.chartData = @[data1];
    [lineChart setYValueMin:0.0];
    
    [cell.contentView addSubview:lineChart];
    [lineChart setShowLabel:NO];
    [lineChart setYValueMax:100.0];
    [lineChart setYValueMin:0.0];
    
//    [lineChart setBackgroundColor:[UIColor yellowColor]];

//        [lineChart setAlpha:0.2];
    
//    [lineChart setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"graphy.png"]]];

    [lineChart setBackgroundColor:[UIColor goldenrodColor]];
    
    [lineChart strokeChart];
    
    chartFrame.origin.x += 160.0;
    PNLineChart *futureChart = [[PNLineChart alloc] initWithFrame:chartFrame];
    
    [futureChart setXLabels:@[@"0", @"-30m", @"-1hr", @"-1.5hrs", @"-2hrs", @"-2.5hrs", @"-3hrs"]];
    
    // Line chart 1
    NSArray *futureDataArray = [theDiningHall objectForKey:@"future"];
    
//    NSNumber *lastCount2 = [data01Array lastObject];
    
    PNLineChartData *futureData = [PNLineChartData new];
    
    UIColor *lineColor;
    
    if ([lastCount floatValue] == 0.0) {
        lineColor = [self determineColorUsingCurrentPeople:[lastCount floatValue] andBackground:NO];
    }
    else
    {
        lineColor = [UIColor grayColor];
    }
    [futureData setColor:[UIColor grayColor]];
    futureData.itemCount = futureChart.xLabels.count;
    futureData.getData = ^(NSUInteger index) {
        CGFloat yValue = [[futureDataArray objectAtIndex:index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    futureChart.chartData = @[futureData];
    [futureChart setYValueMin:0.0];
    
    [cell.contentView addSubview:futureChart];
    [futureChart setShowLabel:NO];
    [futureChart setYValueMax:100.0];
    [futureChart setYValueMin:0.0];
    [futureChart setBackgroundColor:[UIColor goldenrodColor]];

    
    [futureChart strokeChart];
    float iconSize = headerHeight * 0.55;
    
    float iconYpos = (headerHeight / 2.0) - (iconSize / 2.0);
    
    CGSize iconDoubleSize = CGSizeMake(iconSize, iconSize);

    float specialIconSize = headerHeight * 0.3;
    
    FAKFontAwesome *target = [FAKFontAwesome angleDownIconWithSize:iconSize];
    
    [target addAttribute:NSForegroundColorAttributeName value:[UIColor charcoalColor]];
    
    CGRect targetFrame;
    
    targetFrame.origin.x = 160.0 - specialIconSize/2.0;
    targetFrame.origin.y = 35.0;
    
    targetFrame.size = CGSizeMake(specialIconSize, specialIconSize);
    
    UIImageView *targetImage = [[UIImageView alloc] initWithFrame:targetFrame];
    
    [targetImage setImage:[target imageWithSize:CGSizeMake(specialIconSize, specialIconSize)]];
    
    [cell.contentView addSubview:targetImage];
    
    CGRect nowLabelFrame;
    float nowLabelWidth = 30.0;
    
    nowLabelFrame.origin.x = 160.0 - nowLabelWidth / 2.0;
    nowLabelFrame.origin.y = headerHeight - 2.0;
    
    nowLabelFrame.size = CGSizeMake(nowLabelWidth, 15.0);
    
    
    UILabel *nowLabel = [[UILabel alloc] initWithFrame:nowLabelFrame];
    [nowLabel setTextAlignment:NSTextAlignmentCenter];
    [nowLabel setFont:[UIFont fontWithName:@"Avenir-Book" size:10.0]];
    [nowLabel setTextColor:[UIColor blackColor]];
    [nowLabel setText:@"Now"];
    
    [cell.contentView addSubview:nowLabel];
    
    
    //  Add title
    
    NSString *titleText = [theDiningHall objectForKey:@"name"];
    
    UILabel *title = [[UILabel alloc ] initWithFrame:CGRectMake(12.0, 3.0, 400.0, 30.0)];
    
    title.font = [UIFont fontWithName:@"Avenir-Heavy" size:15.0];
    
    UIColor *theTextColor;
    UIColor *theBackgroundColor;
    if ([[theDiningHall objectForKey:@"isOpen"] boolValue]) {
        theTextColor = [UIColor whiteColor];
        theBackgroundColor = [UIColor hollyGreenColor];
    }
    else
    {
        theTextColor = [UIColor black50PercentColor];
        theBackgroundColor = [UIColor crimsonColor];
    }
    
    
    theBackgroundColor = [UIColor charcoalColor];
    
    
    [title setText:titleText];
    [title setTextColor:theTextColor];
    [title sizeToFit];
    
    [cell.contentView addSubview:title];
    
    //  Create header view
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, headerHeight)];
    
    

    [headerView setBackgroundColor:theBackgroundColor];
    
    
    [headerView addSubview:title];
    [cell.contentView addSubview:headerView];
    

    // Icons view
    float offset = 0.0;
    
    UIView *iconsView = [[UIView alloc] initWithFrame:CGRectMake(320.0 / 2 + offset, 0.0, 320.0 - (320.0 / 2 + offset) , headerHeight)];
    
    [iconsView setBackgroundColor:[UIColor clearColor]];
    
    [headerView addSubview:iconsView];
    
    
    // Open
    
    
    FAKFoundationIcons *openIcon = [FAKFoundationIcons clockIconWithSize:iconSize];
    
    [openIcon addAttribute:NSForegroundColorAttributeName value:theTextColor];
    
    UIImageView *openIconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, iconYpos, (iconSize), (iconSize))];
    
    [openIconImage setImage:[openIcon imageWithSize:iconDoubleSize]];
    
    [iconsView addSubview:openIconImage];
    
    NSString *openInfo;
    
    if ([titleText isEqualToString:@"Pavilion at Dobbs"]) {
        openInfo = @"Closed";
    }
    else
    {
        openInfo = @"Open";
    }
    
    float labelHeight = headerHeight * 0.7;
    
    CGRect closedLabelRect;
    
    closedLabelRect.origin.x = iconSize + 4.0;
    closedLabelRect.origin.y = (headerHeight/2) - (labelHeight / 2.0);
    
    closedLabelRect.size.width = 35.0;
    closedLabelRect.size.height = labelHeight;
    
    UILabel *openLabel = [[UILabel alloc] initWithFrame:closedLabelRect];
    
    [openLabel setFont:[UIFont fontWithName:@"Avenir-Book" size:10.0]];
    [openLabel setTextColor:theTextColor];
    
    [openLabel setText:openInfo];
    [openLabel setBackgroundColor:[UIColor clearColor]];
    [iconsView addSubview:openLabel];
    
    
    //  Traffic icon
    
    FAKFoundationIcons *trafficIcon = [FAKFoundationIcons torsoIconWithSize:iconSize];
    
    [trafficIcon addAttribute:NSForegroundColorAttributeName value:theTextColor];
    
    
    
    UIImageView *trafficIconImage = [[UIImageView alloc] initWithFrame:CGRectMake((closedLabelRect.origin.x + closedLabelRect.size.width + 3.0), iconYpos, iconSize, iconSize)];
    
    [trafficIconImage setImage:[trafficIcon imageWithSize:iconDoubleSize]];
    
    [iconsView addSubview:trafficIconImage];
    
    CGRect countingLabelRect;
    
    float countingXOffset = 1.0;
    
    countingLabelRect.origin.x = (3.0 + closedLabelRect.origin.x + closedLabelRect.size.width + iconSize + countingXOffset);
    countingLabelRect.origin.y = (headerHeight / 2.0) - (labelHeight / 2.0);
    
    countingLabelRect.size.height = labelHeight;
    countingLabelRect.size.width = 35.0;
    
    UICountingLabel *trafficLabel = [[UICountingLabel alloc] initWithFrame:countingLabelRect];
    
    [trafficLabel setMethod:UILabelCountingMethodEaseIn];
    
    [iconsView addSubview:trafficLabel];
    
    NSNumber *lastobj = [data01Array lastObject];
    
    [trafficLabel setFont:[UIFont fontWithName:@"Avenir-Heavy" size:10.0]];
    [trafficLabel setTextColor:theTextColor];
    [trafficLabel setFormat:@"~ %.0f"];
    
    [trafficLabel countFrom:0.0 to:[lastobj floatValue]];
    
    
    
    float mapIconXOffset = 0.0;
    
    CGRect mapIconRect;
    
    mapIconRect.origin.x = countingLabelRect.origin.x + countingLabelRect.size.width + mapIconXOffset;
    mapIconRect.origin.y = iconYpos;
    
    mapIconRect.size.width = iconSize;
    mapIconRect.size.height = iconSize;
    
    FAKIonIcons *mapIcon = [FAKIonIcons mapIconWithSize:iconSize];
    
    [mapIcon addAttribute:NSForegroundColorAttributeName value:theTextColor];
    
    UIImageView *mapImageView = [[UIImageView alloc] initWithFrame:mapIconRect];
    
    [mapImageView setImage:[mapIcon imageWithSize:iconDoubleSize]];
    
    [iconsView addSubview:mapImageView];
    
    
    NSString *distLabelText = [theDiningHall objectForKey:@"walking"];
    
    CGRect distLabelRect;
    
    float distLabelXOffset = 2.0;
    
    distLabelRect.origin.x = mapIconRect.origin.x + mapIconRect.size.width + distLabelXOffset;
    distLabelRect.origin.y = (headerHeight / 2.0) - (labelHeight / 2.0);
    
    distLabelRect.size.height = labelHeight;
    distLabelRect.size.width = 40.0;
    
    UILabel *distLabel = [[UILabel alloc] initWithFrame:distLabelRect];
    
    [distLabel setFont:[UIFont fontWithName:@"Avenir-Heavy" size:10.0]];
    [distLabel setTextColor:theTextColor];
    [distLabel setText:distLabelText];
    
    [iconsView addSubview:distLabel];
    
    
    return cell;
    
    
}
-(void)showTestNotifiction
{
    
    
    
    float iconSize = 30.0;
    CGSize iconDoubleSize = CGSizeMake(iconSize, iconSize);
    
    FAKFoundationIcons *alertIcon = [FAKFoundationIcons alertIconWithSize:iconSize];
    [alertIcon addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
    
    
    
    
    
    NSDictionary *options = @{kCRToastTextKey : @"Swipes Low",
                              kCRToastTextAlignmentKey : @(NSTextAlignmentCenter),
                              kCRToastBackgroundColorKey : [UIColor dangerColor],
                              kCRToastAnimationInTypeKey : @(CRToastAnimationTypeLinear),
                              kCRToastAnimationOutTypeKey : @(CRToastAnimationTypeLinear),
                              kCRToastAnimationInDirectionKey : @(CRToastAnimationDirectionBottom),
                              kCRToastAnimationOutDirectionKey : @(CRToastAnimationDirectionBottom),
                              kCRToastAnimationInTimeIntervalKey : @(0.7),
                              kCRToastTimeIntervalKey : @(2.0),
                              kCRToastImageKey : [alertIcon imageWithSize:iconDoubleSize],
                              kCRToastTextAlignmentKey : @(NSTextAlignmentLeft),
                              kCRToastNotificationTypeKey : @(CRToastTypeNavigationBar),
                              kCRToastFontKey : [UIFont fontWithName:@"Avenir-Heavy" size:16.0],
                              kCRToastSubtitleTextKey : @"6 remaing (est. 2 days left)",
                              kCRToastSubtitleFontKey : [UIFont fontWithName:@"Avenir-Book" size:10.0]};
    
                              [CRToastManager showNotificationWithOptions:options
                                                          completionBlock:^{
                                                              NSLog(@"Completed");
                                                          }];
                              
}
-(UIColor*)determineColorUsingCurrentPeople:(float) current andBackground:(BOOL) returnBackground
{
    if (returnBackground) {
        if (current == 0) {
            return [UIColor black50PercentColor];
        }
        else if (current > 0 && current < 50.0)
        {
            return [UIColor Evernote];
        }
        else if (current >= 50.0 && current < 75.0)
        {
            return [UIColor Etsy];
        }
        else
        {
            return [UIColor CocaCola];
        }
    }
    else{
        if (current == 0) {
            return [UIColor black25PercentColor];
        }
        else if (current > 0 && current < 50.0)
        {
            return [UIColor whiteColor];
        }
        else if (current >= 50.0 && current < 75.0)
        {
            return [UIColor whiteColor];
        }
        else
        {
            return [UIColor whiteColor];
        }
    }
   
}
-(UIImage*)createCardView
{
    CGRect barButtonRect;
    
    barButtonRect.origin = CGPointMake(0.0, 0.0);
    
    barButtonRect.size = CGSizeMake(60.0, 30.0);
    
    
    UIView *mainView = [[UIView alloc] initWithFrame:barButtonRect];
//    [mainView setBackgroundColor:[UIColor yellowColor]];
    float iconSize = 15.0;
    
    CGSize iconDoubleSize = CGSizeMake(iconSize, iconSize);
    
    FAKFoundationIcons *cardIcon = [FAKFoundationIcons creditCardIconWithSize:iconSize];
    [cardIcon addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
    
    UIImageView *cardImage = [[UIImageView alloc] initWithFrame:CGRectMake(25.0, 5.0, iconSize, iconSize)];
    [cardImage setImage:[cardIcon imageWithSize:iconDoubleSize]];
    
    [mainView addSubview:cardImage];
    
    UILabel *cardCount = [[UILabel alloc] initWithFrame:CGRectMake(42.0, 6.0, 30.0, 30.0)];
    
    [cardCount setText:@"6"];
    
    [cardCount setTextColor:[UIColor whiteColor]];
    
    [cardCount setFont:[UIFont fontWithName:@"Avenir-Book" size:20.0]];
    
    [mainView addSubview:cardCount];
    
    UIGraphicsBeginImageContextWithOptions(mainView.bounds.size, NO, 0.0);
    [    mainView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;

    
    
    
    
}
@end
