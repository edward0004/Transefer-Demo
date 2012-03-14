//
//  clientview.h
//  转账宝
//
//  Created by zhen bowen on 11-11-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class client;

@interface clientview : UITableViewController<NSXMLParserDelegate> 
{
    NSMutableArray *XmlNode;    
    NSMutableString *currentResult;    
    client  *kclient;  
    NSMutableArray  *array;    
}

@property (nonatomic, assign) NSMutableString *currentResult;

@end
