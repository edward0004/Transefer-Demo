//
//  SecondViewController.h
//  转账宝
//
//  Created by zhen bowen on 11-11-21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewPassValueDelegate2.h"
#import "UIViewPassValueDelegate1111.h"
#import "UIViewPassValueDelegate1.h"

@class bandingResult;
@class historyResult;
@class bankResult;
@class LoginViewController;

@interface SecondViewController : UIViewController<UITextFieldDelegate,UIViewPassValueDelegate1111,UIViewPassValueDelegate2,UIViewPassValueDelegate1>
{
    IBOutlet UITextField *phonenumber;    
    IBOutlet UITextField *cardnumber;   
    IBOutlet UITextField *namenumber;
    IBOutlet UITextField *accountnumber;
    historyResult *khistoryResult;    
    IBOutlet UITextField *TradedateLabel;    
    IBOutlet  UIButton *zhuanzhangButton;    
    bandingResult *kbandingResult; 
    bankResult *kbankResult;
    LoginViewController  *kLoginViewController;
}

@property(nonatomic,assign)IBOutlet UITextField *accountnumber;
@property(nonatomic,assign)IBOutlet UITextField *namenumber;
@property(nonatomic,assign)IBOutlet UITextField *phonenumber;
@property(nonatomic,assign) IBOutlet UITextField *cardnumber; 
@property (nonatomic, assign) IBOutlet  UIButton *zhuanzhangButton;
@property (nonatomic, assign) IBOutlet UITextField *TradedateLabel;
@property(nonatomic,assign)LoginViewController  *kLoginViewController; 
@property(nonatomic,retain) bankResult *kbankResult;
@property (nonatomic, retain)   bandingResult *kbandingResult;
@property (nonatomic, retain)  historyResult *khistoryResult;  

-(IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)buttonPressed;
-(IBAction)switchPagetobanding:(id)sender;
-(IBAction)switchPagetobankResult:(id)sender;
-(IBAction)switchPagetohistory:(id)sender;

@end