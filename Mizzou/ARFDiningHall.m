//
//  ARFDiningHall.m
//  Mizzou
//
//  Created by Anthony Forsythe on 2/20/14.
//  Copyright (c) 2014 ARF. All rights reserved.
//

#import "ARFDiningHall.h"

@implementation ARFDiningHall

-(int)numberOfPointsInGraph
{
    if (self.currentTraffic) {
        return [self.currentTraffic count];
    }

    return 0;
}
-(float)valueForIndex:(NSInteger)index
{
    return [[self.currentTraffic objectAtIndex:index] floatValue];
}
@end
