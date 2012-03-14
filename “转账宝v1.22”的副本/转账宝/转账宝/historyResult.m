//
//  historyResult.m
//  转账宝
//
//  Created by zhen bowen on 11-11-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "historyResult.h"
#import "history.h"
#import "CustomCell.h"
#define    kTableViewRowHeight   100

@implementation historyResult

@synthesize currentResult;
@synthesize tableView;
@synthesize progressInd;
@synthesize delegate1;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
  
    [NSThread detachNewThreadSelector:@selector(myTaskMethod) toTarget:self withObject:nil];
   
}
-(void)myTaskMethod
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.404670313.com/mobile/transpayid.xml"];     
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
    {   CGRect frame = CGRectMake(self.view.frame.size.width/2-15, self.view.frame.size.height/2-15, 30, 30);     
        progressInd = [[UIActivityIndicatorView alloc] initWithFrame:frame];  
        [progressInd startAnimating]; 
        progressInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray; 
        [progressInd sizeToFit];     progressInd.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |  UIViewAutoresizingFlexibleRightMargin |  UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);   
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
    self.title = @"历史记录"; 
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
    CustomCell *cell = (CustomCell *)[tableView2 dequeueReusableCellWithIdentifier: CustomCellIdentifier];
    if (cell == nil)  
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        for (id oneObject in nib)
        if ([oneObject isKindOfClass:[CustomCell class]])
        cell = (CustomCell *)oneObject;
    }
    history *rowData = [XmlNode objectAtIndex:indexPath.row];
    cell.accountLabel.text = rowData.account;
    cell.nameLabel.text = rowData.name;
    cell.bankLabel.text=rowData.bank;
    return cell;
}

- (void)viewDidUnload
{   
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
    else if([elementName isEqualToString:@"receivermsg"])
    {
        khistory = [[history alloc] init]; 
        khistory.answ= [[NSMutableArray alloc] init];	
        khistory.recevermsg = self.currentResult;
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
    if([elementName isEqualToString:@"name"])
	{
	    //因为answ是一个可变数组来存放数据 需要用下面的方法添加数组的对象	
		khistory.name = self.currentResult;
	}   
    else if([elementName isEqualToString:@"bank"])
	{
	    //因为answ是一个可变数组来存放数据 需要用下面的方法添加数组的对象	
		khistory.bank = self.currentResult;
	} 
    else if([elementName isEqualToString:@"account"])
	{
		khistory.account = self.currentResult;
        [XmlNode addObject:khistory];
        [khistory release];  
		khistory= Nil;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    history *rowData = [XmlNode objectAtIndex:indexPath.row];    
    NSString  *info=[[NSString alloc] initWithFormat:@"%@  ",rowData.name]; 
    NSString  *bank=[[NSString alloc] initWithFormat:@"%@  ",rowData.bank]; 
    NSString  *account=[[NSString alloc] initWithFormat:@"%@  ",rowData.account];  
    [delegate1 passValue1:info];
    [delegate1 passValue2:bank];
    [delegate1 passValue3:account];
    [info release];
    [bank release];
    [account release];
}


@end
