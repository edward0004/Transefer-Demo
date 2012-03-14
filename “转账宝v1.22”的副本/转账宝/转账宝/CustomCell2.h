//
//  CustomCell2.h
//  转账宝
//
//  Created by zhen bowen on 11-11-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell2 :  UITableViewCell
{
    UILabel *bankcodeLabel;
    UILabel *bankLabel;
    
}

@property (nonatomic, retain) IBOutlet    UILabel *bankLabel;
@property (nonatomic, retain) IBOutlet  UILabel *bankcodeLabel;
 
@end