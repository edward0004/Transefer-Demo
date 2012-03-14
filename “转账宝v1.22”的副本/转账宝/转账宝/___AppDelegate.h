//
//  ___AppDelegate.h
//  转账宝
//
//  Created by zhen bowen on 11-11-21.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginViewController;

@interface ___AppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> 
{
   LoginViewController *loginviewController;    
   UIWindow *window;
   UINavigationController *navController;    
   UITabBarController *tabBarController;
}

@property(nonatomic,retain)  LoginViewController *loginviewController;  
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet 	UITabBarController *tabBarController;

@end
