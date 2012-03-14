//
//  DetailViewcontroller.h
//  转账宝
//
//  Created by zhen bowen on 11-11-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SaveResult;

@interface DetailViewcontroller : UIViewController<UITextFieldDelegate>
{
   IBOutlet UITextField *tradetime;
   IBOutlet UITextField  *tradetype;//+
   IBOutlet UITextField *tradeamt;
   IBOutlet UITextField  *tradecard;//+
   IBOutlet UITextField*tradememo;  //+
   IBOutlet UITextField  *inputno;//+
   IBOutlet UITextField *inputname;//+
   IBOutlet UITextField *inputbank;//+ 
   NSString *tradetime1;
   NSString  *tradetype1;//+
   NSString  *tradeamt1;
   NSString  *tradecard1;//+
   NSString *tradememo1;  //+
   NSString  *inputno1;//+
   NSString  *inputname1;//+
   NSString  *inputbank1;//+    
}

@property(nonatomic,retain) NSString *tradetime1;
@property(nonatomic,retain)NSString  *tradetype1;
@property(nonatomic,retain)NSString  *tradeamt1;
@property(nonatomic,retain) NSString  *tradecard1;
@property(nonatomic,retain)NSString *tradememo1;
@property(nonatomic,retain)NSString  *inputno1;
@property(nonatomic,retain)NSString  *inputname1;
@property(nonatomic,retain)NSString  *inputbank1;

@end
