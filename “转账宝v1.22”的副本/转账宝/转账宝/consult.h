//
//  consult.h
//  转账宝
//
//  Created by zhen bowen on 11-11-21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewPassValueDelegate1111.h"

@class SaveResult;
@class bandingResult;

@interface consult : UIViewController<UITextFieldDelegate,UIActionSheetDelegate,UIViewPassValueDelegate1111> {
    SaveResult *saveResult;
    IBOutlet UIButton  *tradedatebutton;
    UILabel *TradedateLabel;    
    IBOutlet  UIButton *consultButton;    
    IBOutlet UITextField *phonenumber;    
    IBOutlet UITextField *cardnumber;     
    bandingResult *kbandingResult; 
}

@property(nonatomic,assign)IBOutlet UIButton  *tradedatebutton;
@property(nonatomic,assign)IBOutlet UITextField *phonenumber;
@property(nonatomic,assign) IBOutlet UITextField *cardnumber; 
@property (nonatomic, retain)   bandingResult *kbandingResult;
@property (nonatomic, assign)    IBOutlet  UIButton *consultButton;
@property (nonatomic, assign) IBOutlet UILabel *TradedateLabel;
@property(nonatomic,retain)SaveResult *saveResult;

-(IBAction)switchPagetoSaveResult:(id)sender;
-(IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)SelectValue:(id)sender ;
-(IBAction)switchPagetobanding:(id)sender;

@end
