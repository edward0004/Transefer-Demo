//
//  DetailViewcontroller.m
//  转账宝
//
//  Created by zhen bowen on 11-11-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DetailViewcontroller.h"

@implementation DetailViewcontroller

@synthesize tradetime1;
@synthesize tradetype1;
@synthesize tradeamt1;
@synthesize tradecard1;
@synthesize tradememo1;
@synthesize inputno1;
@synthesize inputname1;
@synthesize inputbank1;

- (void)dealloc
{    
    [tradeamt1 release];
    [tradecard1 release];
    [tradememo1 release];
    [tradetime1 release];
    [tradetype1 release];
    [inputbank1 release];
    [inputname1 release];
    [inputno1 release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc. that aren't in use.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}

- (void)viewDidLoad
{   
    tradeamt.delegate=self;
    tradecard.delegate=self;
    tradememo.delegate=self;
    tradetime.delegate=self;
    tradetype.delegate=self;
    inputbank.delegate=self;
    inputname.delegate=self;
    inputno.delegate=self;
    tradetype.text=tradetype1;
    tradecard.text=tradecard1; 
    tradememo.text=tradememo1;
    tradeamt.text=tradeamt1;      
    tradetime.text=tradetime1;
    inputno.text=inputno1; 
    inputname.text=inputname1;
    inputbank.text=inputbank1; 
    self.title=@"详细信息";
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
