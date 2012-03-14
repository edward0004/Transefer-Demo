//
//  historyResult.h
//  转账宝
//
//  Created by zhen bowen on 11-11-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewPassValueDelegate1.h"

@class history;

@interface historyResult : UITableViewController<NSXMLParserDelegate>
{
    history *khistory;
    NSMutableArray *XmlNode;    
    NSMutableString *currentResult;    
    NSMutableArray  *array;
    IBOutlet UITableView *tableView; 
    UIActivityIndicatorView *progressInd;     
    NSObject<UIViewPassValueDelegate1> * delegate1;        
}

@property(nonatomic, assign) NSObject<UIViewPassValueDelegate1> * delegate1;
@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,assign) UIActivityIndicatorView *progressInd; 
@property (nonatomic, assign) NSMutableString *currentResult;

- (UIActivityIndicatorView *)progressInd; 

@end
