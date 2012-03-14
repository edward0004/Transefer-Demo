//
//  bank.h
//  转账宝
//
//  Created by zhen bowen on 11-11-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface bank : NSObject 
{
    NSString *errormsg;//+
    NSString  *retcode;
    NSString  *sessionid;//+
    NSString   *bankcode;
    NSString   *bank; 
    NSString  *bankinfo;
    NSMutableArray *answ;    
}

@property (nonatomic,assign) NSMutableArray *answ;
@property(nonatomic,assign) NSString *errormsg;
@property(nonatomic,assign)   NSString  *bank;
@property(nonatomic,assign)   NSString  *retcode;
@property(nonatomic,assign)  NSString  *sessionid;
@property(nonatomic,assign)   NSString   *bankinfo;
@property(nonatomic,assign)   NSString   *bankcode;

@end
