//
//  LoginViewController.h
//  转账宝
//
//  Created by zhen bowen on 11-11-21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  ___AppDelegate;
@class client;
@class  banding;
@class bandingResult;

@interface LoginViewController : UIViewController<UIActionSheetDelegate,NSXMLParserDelegate> 
{
   IBOutlet UITextField *nameField;
   IBOutlet  UIButton *loginingButton;
   IBOutlet UITextField *passwordField;
   ___AppDelegate *kpushpop1AppDelegate;
   NSMutableArray *XmlNode;    
   bandingResult *kbandingResult;     
   banding  *kbanding;     
   NSMutableString *currentResult;    
   client  *kclient;  
   NSMutableArray  *array; 
   NSString  *sessionidnumber;
   NSString   *sessionidresult;    
}

@property(nonatomic,assign)NSString  *sessionidnumber;
@property(nonatomic,assign)___AppDelegate *kpushpop1AppDelegate;
@property (nonatomic, assign) NSMutableString *currentResult;

-(IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)backgroundClick:(id)sender;
- (IBAction)buttonPressed;
-(IBAction)textFieldDoneEditing:(id)sender;

@end