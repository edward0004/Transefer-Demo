//
//  bankResult.h
//  转账宝
//
//  Created by zhen bowen on 11-11-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewPassValueDelegate2.h"

@class bank;

@interface bankResult : UITableViewController<NSXMLParserDelegate> 
{
    bank *kbank;
    NSMutableArray *XmlNode;    
    NSMutableString *currentResult;    
    NSMutableArray  *array;
    IBOutlet UITableView *tableView; 
    UIActivityIndicatorView *progressInd;     
    NSObject<UIViewPassValueDelegate2> * delegate1; 
    NSString  * sessionidstring;    
}

@property(nonatomic, assign) NSObject<UIViewPassValueDelegate2> * delegate1;
@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic, assign) UIActivityIndicatorView *progressInd; 
@property (nonatomic, assign) NSMutableString *currentResult;

- (UIActivityIndicatorView *)progressInd; 

@end