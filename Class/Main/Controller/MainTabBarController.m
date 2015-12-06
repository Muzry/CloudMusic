//
//  MainTabBarController.m
//  CloudMusic
//
//  Created by LiDan on 15/12/6.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"

@implementation MainTabBarController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
}

-(void) addChildVC:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
}

@end
