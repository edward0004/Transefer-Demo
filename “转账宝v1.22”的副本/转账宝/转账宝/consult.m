//
//  consult.m
//  转账宝
//
//  Created by zhen bowen on 11-11-21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "consult.h"
#import "SaveResult.h"
#import "UIViewPassValueDelegate1111.h"
#import "bandingResult.h"

@implementation consult

@synthesize cardnumber;
@synthesize phonenumber;
@synthesize kbandingResult;
@synthesize saveResult;
@synthesize TradedateLabel;
@synthesize consultButton;
@synthesize tradedatebutton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}

-(IBAction)switchPagetoSaveResult:(id)sender
{
    
    if(self.saveResult == nil)
	{
		SaveResult *SaveResultviewThree = [[SaveResult alloc]initWithNibName:@"SaveResult" bundle:[NSBundle mainBundle]];
		self.saveResult = SaveResultviewThree;
		[SaveResultviewThree release];
	}
    [self.navigationController pushViewController:self.saveResult animated:YES];    
}

- (void)passValue2222:(NSString *)value2222
{           
}

- (void)passValue1111:(NSString *)value1111
{       
    self.cardnumber.text= value1111;
}

-(IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

- (void)dealloc
{    
    [tradedatebutton release];
    [cardnumber release];
    [phonenumber release];
    [consultButton release];
    [TradedateLabel release];
    [kbandingResult release];
    [saveResult release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
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

#pragma mark - View lifecycle

- (void)viewDidLoad
{   
    cardnumber.delegate=self;  
    phonenumber.delegate=self;    
    UIImage *buttonImageNormal1 = [UIImage imageNamed:@"blueButton.png"];    
    UIImage *stretchableButtonImageNormal1 = [buttonImageNormal1 stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [tradedatebutton setBackgroundImage:stretchableButtonImageNormal1 forState:UIControlStateNormal];
    UIImage *buttonImagePressed1 = [UIImage imageNamed:@"whiteButton.png"];     
    UIImage *stretchableButtonImagePressed1 = [buttonImagePressed1 stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [tradedatebutton  setBackgroundImage:stretchableButtonImagePressed1 forState:UIControlStateHighlighted];     
    UIImage *buttonImageNormal = [UIImage imageNamed:@"blueButton.png"];    
    UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [consultButton setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
    UIImage *buttonImagePressed = [UIImage imageNamed:@"whiteButton.png"];     
    UIImage *stretchableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [consultButton setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];     
    self.title=@"支付查询";
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)SelectValue:(id)sender 
{ 
    NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n\n" ; 
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:@"确定" destructiveButtonTitle:nil otherButtonTitles:nil]; 
    [actionSheet showInView:self.view]; 
    UIDatePicker *datePicker = [[[UIDatePicker alloc] init] autorelease]; 
    datePicker.tag = 101; 
    datePicker.datePickerMode = 1; 
    [actionSheet addSubview:datePicker]; 
    [actionSheet showFromTabBar:(UITabBar *)self.tabBarController.view];     
} 

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex 
{ 
    UIDatePicker *datePicker = (UIDatePicker *)[actionSheet viewWithTag:101]; 
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease]; 
    formatter.dateFormat = @"yyyy年 MM月 dd日"; 
    NSString *timesp = [formatter stringFromDate:datePicker.date]; 
    TradedateLabel.text =timesp; 
    [actionSheet release]; 
} 

@end
