//
//  bandingResult.h
//  转账宝
//
//  Created by zhen bowen on 11-11-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewPassValueDelegate1111.h"

@class  banding;

@interface bandingResult : UIViewController<NSXMLParserDelegate>
{
    NSMutableArray *XmlNode;    
    NSMutableString *currentResult;    
    banding  *kbanding;  
    NSMutableArray  *array;
    IBOutlet UITableView *tableView; 
    NSString *sessionidstring;
    UIActivityIndicatorView *progressInd;     
    NSObject<UIViewPassValueDelegate1111> * delegate1;      
}

@property(nonatomic, assign) NSObject<UIViewPassValueDelegate1111> * delegate1;
@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic, assign) UIActivityIndicatorView *progressInd; 
@property (nonatomic, assign) NSMutableString *currentResult;

- (UIActivityIndicatorView *)progressInd; 

@end
