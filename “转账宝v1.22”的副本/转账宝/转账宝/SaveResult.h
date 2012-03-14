//
//  SaveResult.h
//  TradeClient
//
//  Created by zhen bowen on 11-10-26.
//  Copyright 2011年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModelSave;
@class DetailViewcontroller;

@interface SaveResult : UIViewController<NSXMLParserDelegate> 
{
    DetailViewcontroller  *kDetailViewcontroller;
    NSMutableArray *XmlNode;    
    NSMutableString *currentResult;    
    ModelSave  *modelSave;  
    NSMutableArray  *array;
    IBOutlet UITableView *tableView; 
    NSString *sessionidstring;
    NSString  *tradedatestring;
    UIActivityIndicatorView *progressInd; 
}

@property(nonatomic,assign) DetailViewcontroller  *kDetailViewcontroller;
@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic, assign) UIActivityIndicatorView *progressInd; 
@property (nonatomic, assign) NSMutableString *currentResult;

- (UIActivityIndicatorView *)progressInd; 

@end