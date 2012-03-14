//
//  clientview.m
//  转账宝
//
//  Created by zhen bowen on 11-11-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "clientview.h"
#import "client.h"

@implementation clientview

@synthesize currentResult;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*- (void)viewWillAppear:(BOOL)animated {
    if ([self.array count]==0) {
        [NSThread detachNewThreadSelector:@selector(myTaskMethod) toTarget:self withObject:nil];
    }
}*/

-(void)myTaskMethod
{
   NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
   NSURL *url = [[NSURL alloc] initWithString:@"http://www.404670313.com/mobile/directpay.xml"];	  
   NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
   [xmlParser setDelegate:self];
   BOOL success = [xmlParser parse];
   if(success)
   {
      NSLog(@"No Errors");
   }
   else
   {
      NSLog(@"Error Error Error!!!");
   }
   [super viewDidLoad];    
   [self.tableView reloadData];
   [xmlParser  release];
   [pool release];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) 
   {
        // Custom initialization
   }
    return self;
}

- (void)dealloc
{
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
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{   //self.array=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
   [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
   [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
   [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
   return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
    attributes:(NSDictionary *)attributeDict
{
	if([elementName isEqualToString:@"tradeinfo"])
	{
        XmlNode = [[NSMutableArray alloc] init ];	
	}
    else if([elementName isEqualToString:@"sessionid"])
    {
        kclient = [[client alloc] init]; 
        kclient.answ= [[NSMutableArray alloc] init];
        kclient.sessionid = self.currentResult;
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
	    
    if([elementName isEqualToString:@"errormsg"])
	{
		kclient.errormsg = self.currentResult;
	}    
    else if([elementName isEqualToString:@"retcode"])
	{
	    //因为answ是一个可变数组来存放数据 需要用下面的方法添加数组的对象	
		kclient.retcode = self.currentResult;
		[XmlNode addObject:kclient];
		NSLog(@"XmlNode: %@",XmlNode);	
        [kclient release];  
		kclient= Nil; 
	}
}

@end
