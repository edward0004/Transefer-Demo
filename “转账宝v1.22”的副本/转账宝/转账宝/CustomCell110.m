//
//  CustomCell110.m
//  转账宝
//
//  Created by zhen bowen on 11-11-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CustomCell110.h"

@implementation CustomCell110

@synthesize tradedateLabel;
@synthesize tradetypeLabel;
@synthesize tradeamtLabel;
@synthesize tradecardLabel;

- (void)dealloc
{  
    [tradedateLabel release];
    [tradecardLabel release];
    [tradeamtLabel release];
    [tradetypeLabel release];    
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
