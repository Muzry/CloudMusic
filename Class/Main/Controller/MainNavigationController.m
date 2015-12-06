//
//  MainNavigationController.m
//  CloudMusic
//
//  Created by LiDan on 15/12/6.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "MainNavigationController.h"
#import "CloudMusic.pch"

@implementation MainNavigationController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"cm2_topbar_bg"] forBarMetrics:UIBarMetricsDefault];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    [self.navigationBar setTitleTextAttributes:att];
}

//+(void)setNavTheme
//{
//    UINavigationBar *navBar = [UINavigationBar appearance];
//    navBar.tintColor = [UIColor whiteColor];
//    [navBar setBackgroundImage:[UIImage imageNamed:@"topbarbg_ios7"] forBarMetrics:UIBarMetricsDefault];
//    NSMutableDictionary *att = [NSMutableDictionary dictionary];
//    att[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    att[NSFontAttributeName] = [UIFont systemFontOfSize:18];
//    [navBar setTitleTextAttributes:att];
//    
//    
//    UIBarButtonItem *item = [UIBarButtonItem appearance];
//    
//    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
//    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//}

@end
