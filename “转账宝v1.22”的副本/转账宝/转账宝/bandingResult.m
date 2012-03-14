//
//  bandingResult.m
//  转账宝
//
//  Created by zhen bowen on 11-11-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "bandingResult.h"
#import "banding.h"
#import "CustomCell12.h"

#define    kTableViewRowHeight   60

@implementation bandingResult

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
    //if ([self.array count]==0) {
        [NSThread detachNewThreadSelector:@selector(myTaskMethod) toTarget:self withObject:nil];
    //}
}

-(void)myTaskMethod
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.404670313.com/mobile/transpay.xml"];	  
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
        progressInd.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |  UIViewAutoresizingFlexibleRightMargin |  UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);      
        progressInd.tag = 1;    // tag this view for later so we can remove it from recycled table cells 
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
    self.title = @"绑定详细信息"; 
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

- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier ";
    CustomCell12 *cell = (CustomCell12 *)[tableView2  dequeueReusableCellWithIdentifier: CustomCellIdentifier];
    if (cell == nil)  
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell12" owner:self options:nil];
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[CustomCell12 class]])
                cell = (CustomCell12 *)oneObject;
    }
    banding *rowData = [XmlNode objectAtIndex:indexPath.row];
    cell.paycardLabel.text = rowData.paycard;
    cell.payinfoLabel.text=rowData.payinfo;
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
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
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
    if([elementName isEqualToString:@"errormsg"])
	{
		kbanding.errormsg = self.currentResult;
	}    
    else if([elementName isEqualToString:@"retcode"])
	{
		kbanding.retcode = self.currentResult;
	}   
    else if([elementName isEqualToString:@"sessionid"])
	{
        sessionidstring = [[NSString alloc] init ];
        sessionidstring=self.currentResult;
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
	//把xml中所有的数据存放到这个可变的字符串里面
	[self.currentResult appendString:string];	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	 if([elementName isEqualToString:@"paylist"])
	{
	    kbanding.paylist = self.currentResult;      
	} 
    else if([elementName isEqualToString:@"paycard"])
	{
	    kbanding.paycard= self.currentResult;
    } 
    else if([elementName isEqualToString:@"payinfo"])
	{
		kbanding.payinfo = self.currentResult;
        [XmlNode addObject:kbanding];
        [kbanding release];  
		kbanding= Nil; 
	}
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    banding *rowData = [XmlNode objectAtIndex:indexPath.row];    
    NSString  *info=[[NSString alloc] initWithFormat:@"%@  ",rowData.paycard]; 
    NSString  *info2=[[NSString alloc] initWithFormat:@"%@  ",sessionidstring]; 
    [delegate1 passValue1111:info];
    [delegate1 passValue2222:info2];    
    [info release];
    [info2 release];
}

@end
