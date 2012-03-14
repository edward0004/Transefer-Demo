//
//  CustomCell2.m
//  转账宝
//
//  Created by zhen bowen on 11-11-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CustomCell2.h"


@implementation CustomCell2

@synthesize bankcodeLabel;
@synthesize bankLabel;

- (void)dealloc
{   
    [bankLabel release];
    [bankcodeLabel release];
    [super dealloc];
}

@end