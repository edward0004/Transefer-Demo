//
//  SecondViewController.m
//  转账宝
//
//  Created by zhen bowen on 11-11-21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#import "bandingResult.h"
#import "historyResult.h"
#import "bankResult.h"
#import "LoginViewController.h"

@implementation SecondViewController

@synthesize phonenumber;@synthesize cardnumber;
@synthesize TradedateLabel;
@synthesize accountnumber;
@synthesize kbandingResult;
@synthesize khistoryResult;
@synthesize namenumber;
@synthesize kbankResult;
@synthesize kLoginViewController;
@synthesize zhuanzhangButton;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)passValue12:(NSString *)value12
{       
    self.TradedateLabel.text = value12;
}

- (void)passValue2222:(NSString *)value2222
{       
    
}

- (void)passValue1111:(NSString *)value1111
{       
    self.cardnumber.text = value1111;
   
}

-(void)passValue4:(NSString *)value4
{
    
}

- (void)passValue1:(NSString *)value1
{       
    self.namenumber.text = value1;
}

- (void)passValue2:(NSString *)value2
{       
    self.TradedateLabel.text = value2;
}

- (void)passValue3:(NSString *)value3
{       
    self.accountnumber.text = value3;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}


-(IBAction)switchPagetobanding:(id)sender
{
    if(self.kbandingResult == nil)
	{
		bandingResult *bandingResultThree = [[bandingResult alloc]initWithNibName:@"bandingResult" bundle:[NSBundle mainBundle]];
        bandingResultThree.delegate1 = self;         
		self.kbandingResult = bandingResultThree;
		[bandingResultThree release];
	}
    [self.navigationController pushViewController:self.kbandingResult animated:NO];    
}


-(IBAction)switchPagetobankResult:(id)sender
{
    if(self.kbankResult == nil)
	{
		bankResult *bankResultThree = [[bankResult alloc]initWithNibName:@"bankResult" bundle:[NSBundle mainBundle]];
        bankResultThree .delegate1 = self;         
		self.kbankResult = bankResultThree;
		[bankResultThree  release];
	}
    [self.navigationController pushViewController:self.kbankResult animated:NO];    
}

-(IBAction)switchPagetohistory:(id)sender
{
    historyResult *khistoryResultThree = [[historyResult alloc]initWithNibName:@"historyResult" bundle:[NSBundle mainBundle]];
    khistoryResultThree.delegate1 = self;         
    self.khistoryResult = khistoryResultThree;
    [khistoryResultThree release];
    [self.navigationController pushViewController:self.khistoryResult animated:NO];        
}

- (IBAction)buttonPressed 
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"转账明细" message:@"您的转账请求已成功提交，稍后会短信通知您进行转账确认" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];    
}

-(IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

- (void)viewDidLoad
{   
    cardnumber.delegate=self;  
    phonenumber.delegate=self;
    NSLog(@"%@",kLoginViewController.sessionidnumber);
    UIImage *buttonImageNormal = [UIImage imageNamed:@"blueButton.png"];    
    UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [zhuanzhangButton setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
    UIImage *buttonImagePressed = [UIImage imageNamed:@"whiteButton.png"];     
    UIImage *stretchableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [zhuanzhangButton setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];  
    self.title=@"转账";
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)dealloc
{   
    [kbankResult release];
    [kbandingResult release];
    [khistoryResult release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
