//
//  bankResult.m
//  转账宝
//
//  Created by zhen bowen on 11-11-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "bankResult.h"
#import "bank.h"
#import "CustomCell2.h"

#define    kTableViewRowHeight   100

@implementation bankResult

@synthesize currentResult;
@synthesize tableView;
@synthesize progressInd;
@synthesize delegate1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
     // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated 
{
    [NSThread detachNewThreadSelector:@selector(myTaskMethod) toTarget:self withObject:nil];
}

-(void)myTaskMethod
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.404670313.com/mobile/bank.xml"];     
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [xmlParser setDelegate:self];
	BOOL success = [xmlParser parse];
	if(success)
    {
        NSLog(@"No Errors");
        [self.progressInd removeFromSuperview];        
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

- (UIActivityIndicatorView *)progressInd 
{
    if (progressInd == nil) 
    {    
       CGRect frame = CGRectMake(self.view.frame.size.width/2-15, self.view.frame.size.height/2-15, 30, 30);  
       progressInd = [[UIActivityIndicatorView alloc] initWithFrame:frame];
       [progressInd startAnimating]; 
       progressInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;    
       [progressInd sizeToFit];   
       progressInd.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |   UIViewAutoresizingFlexibleRightMargin |  UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleBottomMargin);  
       progressInd.tag = 1; 
    } 
    return progressInd; 
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
    [self.view addSubview:self.progressInd];      
    self.title = @"银行选项"; 
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark -
#pragma mark Table Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [XmlNode count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kTableViewRowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView2 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier ";
    CustomCell2 *cell = (CustomCell2 *)[tableView2 dequeueReusableCellWithIdentifier: CustomCellIdentifier];
    if (cell == nil)  
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell2" owner:self options:nil];
        for (id oneObject in nib)
        if ([oneObject isKindOfClass:[CustomCell2 class]])
        cell = (CustomCell2 *)oneObject;
    }
    bank *rowData = [XmlNode objectAtIndex:indexPath.row];
    cell.bankLabel.text = rowData.bank;
    cell.bankcodeLabel.text = rowData.bankcode;
    return cell;
}


- (void)viewDidUnload
{   //self.array=nil;
    self.tableView=nil;
    [super viewDidUnload];
}

- (void)dealloc
{   
    [tableView release];
	[currentResult release];
    [super dealloc];
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
    else if([elementName isEqualToString:@"sessionid"])
	{
        sessionidstring = [[NSString alloc] init ];
        sessionidstring=self.currentResult;
    }  
    else if([elementName isEqualToString:@"bankinfo"])
    {
        kbank = [[bank alloc] init]; 
        kbank.answ= [[NSMutableArray alloc] init];	
        kbank.bankinfo = self.currentResult;
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
    if([elementName isEqualToString:@"bank"])
	{
	    //因为answ是一个可变数组来存放数据 需要用下面的方法添加数组的对象	
		kbank.bank = self.currentResult;
	}   
    else if([elementName isEqualToString:@"bankcode"])
	{
		kbank.bankcode = self.currentResult;
        [XmlNode addObject:kbank];
        [kbank release];  
		kbank= Nil; 	
    }
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    bank *rowData = [XmlNode objectAtIndex:indexPath.row];    
    NSString  *info=[[NSString alloc] initWithFormat:@"%@  ",rowData.bank]; 
    [delegate1 passValue12:info];
    [info release];
}

@end

