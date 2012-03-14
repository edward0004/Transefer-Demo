//
//  ModelSave.h
//  TradeClient
//
//  Created by zhen bowen on 11-10-26.
//  Copyright 2011年 zjut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelSave : NSObject 
{
    NSString *sessionID;//+
    NSString  *tradedate;
    NSString  *tradelist;//+
    NSString  *trademsg;//+
    NSString *tradetime;
    NSString  *tradetype;//+
    NSString  *tradeamt;
    NSString  *tradecard;//+
    NSString *tradememo;  //+
    NSString *tradedetail;//+
    NSString  *inputno;//+
    NSString  *inputname;//+
    NSString  *inputbank;//+
    NSMutableArray *answ;    
}

@property (nonatomic, assign) NSMutableArray *answ;
@property(nonatomic,assign)NSString *sessionID;
@property(nonatomic,assign) NSString  *tradedate;
@property(nonatomic,assign)  NSString  *tradelist;
@property(nonatomic,assign)NSString  *trademsg;
@property(nonatomic,assign) NSString *tradetime;
@property(nonatomic,assign)NSString  *tradetype;
@property(nonatomic,assign)NSString  *tradeamt;
@property(nonatomic,assign) NSString  *tradecard;
@property(nonatomic,assign) NSString *tradedetail;
@property(nonatomic,assign)NSString *tradememo;
@property(nonatomic,assign)NSString  *inputno;
@property(nonatomic,assign)NSString  *inputname;
@property(nonatomic,assign)NSString  *inputbank;

@end