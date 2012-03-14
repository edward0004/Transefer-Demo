//
//  LoginViewController.m
//  转账宝
//
//  Created by zhen bowen on 11-11-21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "___AppDelegate.h"
#import "banding.h"

@implementation LoginViewController

@synthesize kpushpop1AppDelegate;
@synthesize currentResult;
@synthesize sessionidnumber;


-(IBAction)textFieldDoneEditing:(id)sender
{    
   [sender resignFirstResponder];
}

-(IBAction)backgroundClick:(id)sender
{
   [nameField resignFirstResponder];
   [passwordField resignFirstResponder];
}

- (IBAction)buttonPressed
{
   UIActionSheet *actionSheet = [[UIActionSheet alloc] 
                                  initWithTitle:@"是否进行用户验证？" 
                                  delegate:self 
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"验证" 
                                  otherButtonTitles:nil];
   [actionSheet showInView:self.view];
   [actionSheet release];    
}

-(void)changeString
{
   NSString *str221=sessionidnumber;
   str221=[str221 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
   NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
   NSString *str1234 = [[NSString alloc]initWithString:[str221 stringByTrimmingCharactersInSet:whiteSpace]];
   sessionidresult=str1234 ;  
}

- (void)actionSheet:(UIActionSheet *)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
   if (buttonIndex != [actionSheet cancelButtonIndex])
   {
      NSString *msg = nil;
      if ([nameField.text isEqualToString:sessionidresult])
      {
           msg = [[NSString alloc] initWithFormat:@"用户：%@通过验证", nameField.text];
           [self.view removeFromSuperview];        
       }else
       { 
            msg = @"用户未通过验证";
       }
        
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"验证结果" message:msg delegate:self cancelButtonTitle:@"ok!" otherButtonTitles:nil];
    [alert show];
    [alert release];
    [msg release];
    }
}

-(IBAction)logon
{
   [self.view removeFromSuperview];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
   self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
   if (self)
   {
        // Custom initialization
   }
   return self;
}

- (void)dealloc
{   
   [passwordField release];
   [currentResult release];
   [kpushpop1AppDelegate release];
   [nameField release];
   [sessionidnumber release];
   [loginingButton release];
   [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
   [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{   
   NSURL *url = [[NSURL alloc] initWithString:@"http://www.404670313.com/mobile/authpay.xml"];	  
   NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
   [xmlParser setDelegate:self];
   BOOL success = [xmlParser parse];
   if(success)
   {
      NSLog(@"login:No Errors");
   }else
   { 
      NSLog(@"login:Error Error Error!!!");
   }
   [super viewDidLoad];    
   [xmlParser  release];    
   [self changeString];
   UIImage *buttonImageNormal = [UIImage imageNamed:@"blueButton.png"];
   UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
   [loginingButton setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
   UIImage *buttonImagePressed = [UIImage imageNamed:@"whiteButton.png"];    
   UIImage *stretchableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
   [loginingButton setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];    
   [super viewDidLoad];
}

- (void)viewDidUnload
{
   [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark NSXMLParserDelegate

//解析的代理方法  重要的步骤就再这个里面 
//#pragma mark -

//这是一个解析代理的开始方法  elementName是节点的名称
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
    attributes:(NSDictionary *)attributeDict
{   
	if([elementName isEqualToString:@"tradeinfo"])
	{   
        XmlNode = [[NSMutableArray alloc] init ];	
	}
    
    if([elementName isEqualToString:@"errormsg"])
	{
		kbanding.errormsg = self.currentResult;
        
	}    
    else if([elementName isEqualToString:@"retcode"])
	{
		kbanding.retcode = self.currentResult;
	}   
    else if([elementName isEqualToString:@"paymsg"])
    {
        kbanding = [[banding alloc] init]; 
        kbanding.answ= [[NSMutableArray alloc] init];
        kbanding.paymsg = self.currentResult;
    }         
	self.currentResult = [[NSMutableString alloc] init ];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string 
{
	[self.currentResult appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"paylist"])
	{
	    kbanding.paylist = self.currentResult;
	} 
    
    else if([elementName isEqualToString:@"sessionid"])
	{
        sessionidnumber = [[NSString alloc] init ];
        sessionidnumber=self.currentResult;
    }    
    else if([elementName isEqualToString:@"payinfo"])
	{
	    kbanding.payinfo= self.currentResult;
    } 
    else if([elementName isEqualToString:@"paycard"])
	{
		kbanding.paycard = self.currentResult;
		[XmlNode addObject:kbanding];
        [kbanding release];  
		kbanding= Nil; 	
    }
    
}

@end
