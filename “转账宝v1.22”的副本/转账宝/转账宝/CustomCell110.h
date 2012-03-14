//
//  CustomCell110.h
//  转账宝
//
//  Created by zhen bowen on 11-11-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell110 :  UITableViewCell 
{
    UILabel *tradetypeLabel;
    UILabel *tradedateLabel;
    UILabel *tradeamtLabel;
    UILabel *tradecardLabel;      
}

@property (nonatomic, retain) IBOutlet UILabel *tradetypeLabel;
@property (nonatomic, retain) IBOutlet UILabel *tradedateLabel;
@property (nonatomic, retain) IBOutlet UILabel *tradeamtLabel;
@property (nonatomic, retain) IBOutlet  UILabel *tradecardLabel;

@end
