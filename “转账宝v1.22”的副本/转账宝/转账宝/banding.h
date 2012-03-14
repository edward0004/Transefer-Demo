//
//  banding.h
//  转账宝
//
//  Created by zhen bowen on 11-11-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface banding : NSObject 
{
    NSString *errormsg;//+
    NSString  *retcode;
    NSString  *sessionid;//+
    NSString  *paylist;//+
    NSString *paymsg;
    NSString  *payinfo;//+
    NSString *paycard;   
    NSMutableArray *answ;     
    
}

@property (nonatomic, assign) NSMutableArray *answ;
@property(nonatomic,assign)NSString *errormsg;
@property(nonatomic,assign)  NSString  *retcode;
@property(nonatomic,assign) NSString  *sessionid;
@property(nonatomic,assign)NSString  *paylist;
@property(nonatomic,assign) NSString *paymsg;
@property(nonatomic,assign)NSString  *payinfo;
@property(nonatomic,assign)   NSString *paycard; 

@end
