//
//  CustomCell.m
//  转账宝
//
//  Created by zhen bowen on 11-11-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize accountLabel;
@synthesize nameLabel;
@synthesize bankLabel;
@synthesize sessionidLabel;

- (void)dealloc
{   [sessionidLabel release];
    [bankLabel release];
    [accountLabel release];
    [nameLabel release];
    [super dealloc];
}

@end
