//
//  ARFDiningHall.h
//  Mizzou
//
//  Created by Anthony Forsythe on 2/20/14.
//  Copyright (c) 2014 ARF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BEMSimpleLineGraphView.h>


@interface ARFDiningHall : NSObject <BEMSimpleLineGraphDelegate>

@property (nonatomic, weak) NSString *name;
@property (nonatomic, weak) NSString *address;
@property (nonatomic, weak) NSString *walkingDistance;
@property (nonatomic, weak) NSString *menu;
@property (nonatomic, weak) NSString *hours;

@property (nonatomic, weak) NSArray *currentTraffic;
@property (nonatomic, weak) NSArray *futureTraffic;

@property (nonatomic, weak) UIColor *graphColor;


@property (nonatomic, assign) BOOL  isOpen;

@end
