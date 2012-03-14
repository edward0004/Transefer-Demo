//
//  SaveResult.m
//  TradeClient
//
//  Created by zhen bowen on 11-10-26.
//  Copyright 2011年 zjut. All rights reserved.
//

#import "SaveResult.h"
#import "ModelSave.h"
#import "CustomCell110.h"
#import "DetailViewcontroller.h"
#define    kTableViewRowHeight   120

@implementation SaveResult

@synthesize currentResult;
@synthesize tableView;
@synthesize progressInd;
@synthesize kDetailViewcontroller;

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
   NSURL *url = [[NSURL alloc] initWithString:@"http://www.404670313.com/mobile/querypay.xml"];	  
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
        progressInd.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |  UIViewAutoresizingFlexibleRightMargin |    UIViewAutoresizingFlexibleTopMargin |          UIViewAutoresizingFlexibleBottomMargin);      progressInd.tag = 1;    // tag this view for later so we can remove it from recycled table cells 
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
     self.title = @"记账交易查询结果"; 
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [XmlNode count];
}

#pragma mark -
#pragma mark Table Data Source Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kTableViewRowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier ";
    CustomCell110 *cell = (CustomCell110 *)[tableView1 dequeueReusableCellWithIdentifier: CustomCellIdentifier];
    if (cell == nil)  
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell110" owner:self options:nil];
        for (id oneObject in nib)
        if ([oneObject isKindOfClass:[CustomCell110 class]])
        cell = (CustomCell110 *)oneObject;
    }
    ModelSave *rowData = [XmlNode objectAtIndex:indexPath.row];
    cell.tradedateLabel.text = tradedatestring;
    cell.tradetypeLabel.text = rowData.tradetype;
    cell.tradeamtLabel.text=rowData.tradeamt;
    cell.tradecardLabel.text=rowData.tradecard;
    return cell;
    [rowData release];
}

- (void)viewDidUnload
{   
    self.tableView=nil;
    [super viewDidUnload];
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{   
    [tableView release];
	[currentResult release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
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
    //根节点为test 所以再解析到这个节点的时候 我需要为我用来存放Question类的xmlNlde的可变数组分配空间
	if([elementName isEqualToString:@"tradeinfo"])
	{
        XmlNode = [[NSMutableArray alloc] init ];
	}
    else if([elementName isEqualToString:@"trademsg"])
    {
        modelSave = [[ModelSave alloc] init]; 
        modelSave.answ= [[NSMutableArray alloc] init];           
        modelSave.trademsg = self.currentResult;
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
    if([elementName isEqualToString:@"tradetime"])
	{
		modelSave.tradetime = self.currentResult;
	} 
    else if([elementName isEqualToString:@"sessionid"])
	{
	    //因为answ是一个可变数组来存放数据 需要用下面的方法添加数组的对象	
		//modelSave.sessionID = self.currentResult;
        sessionidstring = [[NSString alloc] init ];
        sessionidstring=self.currentResult;
    }
    else if([elementName isEqualToString:@"tradedate"])
	{
        tradedatestring = [[NSString alloc] init ];
        tradedatestring=self.currentResult;
    }    
    else if([elementName isEqualToString:@"tradetype"])
	{
	    //因为answ是一个可变数组来存放数据 需要用下面的方法添加数组的对象	
		modelSave.tradetype = self.currentResult;
	} 
    else if([elementName isEqualToString:@"tradeamt"])
	{
	    //因为answ是一个可变数组来存放数据 需要用下面的方法添加数组的对象	
		modelSave.tradeamt = self.currentResult;
	} 
    else if([elementName isEqualToString:@"tradecard"])
	{
	    //因为answ是一个可变数组来存放数据 需要用下面的方法添加数组的对象	
		modelSave.tradecard = self.currentResult;
	}    
    else if([elementName isEqualToString:@"tradememo"])
	{
	    //因为answ是一个可变数组来存放数据 需要用下面的方法添加数组的对象	
		modelSave.tradememo= self.currentResult;
	} 
    else if([elementName isEqualToString:@"inputno"])
	{
	    //因为answ是一个可变数组来存放数据 需要用下面的方法添加数组的对象	
		modelSave.inputno = self.currentResult;
	}  
    else if([elementName isEqualToString:@"inputname"])
	{
	    //因为answ是一个可变数组来存放数据 需要用下面的方法添加数组的对象	
		modelSave.inputname= self.currentResult;
	}  
    else if([elementName isEqualToString:@"inputbank"])
	{
		modelSave.inputbank= self.currentResult;
		[XmlNode addObject:modelSave];
		[modelSave release];
        modelSave= nil;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModelSave *rowData = [XmlNode objectAtIndex:indexPath.row];     
    NSString  *tradetimeinfo=[[NSString alloc] initWithFormat:@"%@  ",rowData.tradetime];
    NSString  *tradetypeinfo=[[NSString alloc] initWithFormat:@"%@  ",rowData.tradetype]; 
    NSString  *tradeamtinfo=[[NSString alloc] initWithFormat:@"%@  ",rowData.tradeamt];  
    NSString  *tradecardinfo=[[NSString alloc] initWithFormat:@"%@  ",rowData.tradecard]; 
    NSString  *tradememoinfo=[[NSString alloc] initWithFormat:@"%@  ",rowData.tradememo];  
    NSString  *inputnoinfo=[[NSString alloc] initWithFormat:@"%@  ",rowData.inputno]; 
    NSString  *inputnameinfo=[[NSString alloc] initWithFormat:@"%@  ",rowData.inputname];
    NSString  *inputbankinfo=[[NSString alloc] initWithFormat:@"%@  ",rowData.inputbank];     
    DetailViewcontroller *dvController = [[DetailViewcontroller alloc] initWithNibName:@"DetailViewcontroller" bundle:[NSBundle mainBundle]];
    dvController.tradememo1=tradememoinfo;
    dvController.tradeamt1=tradeamtinfo;
    dvController.tradecard1=tradecardinfo;
    dvController.tradetime1=tradetimeinfo;
    dvController.tradetype1=tradetypeinfo;
    dvController.inputbank1=inputbankinfo;
    dvController.inputname1=inputnameinfo;
    dvController.inputno1=inputnoinfo;
    [self.navigationController pushViewController:dvController animated:YES];
    [dvController release];
    dvController = nil;
    [tradeamtinfo release];
    [tradecardinfo release];
    [tradememoinfo release];
    [tradetimeinfo release];
    [tradetypeinfo release];
    [inputnoinfo release];
    [inputnameinfo release];
    [inputbankinfo release];    
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath 
{
    //return UITableViewCellAccessoryDetailDisclosureButton;
    return UITableViewCellAccessoryDisclosureIndicator;
}

- (void)tableView123:(UITableView *)tableView123 accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self tableView:tableView123 didSelectRowAtIndexPath:indexPath];
}

@end