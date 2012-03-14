//
//  CustomCell12.m
//  转账宝
//
//  Created by zhen bowen on 11-11-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CustomCell12.h"

@implementation CustomCell12

@synthesize paymsgLabel;
@synthesize paycardLabel;
@synthesize payinfoLabel;
@synthesize paylistLabel;

- (void)dealloc
{  
    [paycardLabel release];
    [payinfoLabel release];
    [paylistLabel release];
    [paymsgLabel release];    
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end