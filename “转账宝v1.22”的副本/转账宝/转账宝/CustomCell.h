//
//  CustomCell.h
//  转账宝
//
//  Created by zhen bowen on 11-11-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell :  UITableViewCell 
{
    UILabel *nameLabel;
    UILabel *bankLabel;
    UILabel *accountLabel;
    UILabel *sessionidLabel;      
}

@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet    UILabel *bankLabel;
@property (nonatomic, retain) IBOutlet  UILabel *accountLabel;
@property (nonatomic, retain) IBOutlet  UILabel *sessionidLabel; 

@end