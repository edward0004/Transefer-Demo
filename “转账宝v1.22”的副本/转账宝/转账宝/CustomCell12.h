//
//  CustomCell12.h
//  转账宝
//
//  Created by zhen bowen on 11-11-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell12 : UITableViewCell
{
    UILabel *paycardLabel;
    UILabel *paylistLabel;
    UILabel *paymsgLabel;
    UILabel *payinfoLabel;      
}

@property (nonatomic, retain) IBOutlet UILabel *paycardLabel;
@property (nonatomic, retain) IBOutlet  UILabel *paylistLabel;
@property (nonatomic, retain) IBOutlet  UILabel *paymsgLabel;
@property (nonatomic, retain) IBOutlet  UILabel *payinfoLabel;

@end
