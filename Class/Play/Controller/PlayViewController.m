//
//  PlayViewController.m
//  CloudMusic
//
//  Created by LiDan on 15/12/10.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayViewController.h"
#import "UIView+Extension.h"
#import "CloudMusic.pch"
#import "PlayView.h"

@interface PlayViewController ()

@property (nonatomic,weak) PlayView *playView;

@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PlayView *playView = [[PlayView alloc]init];
    playView.frame = self.view.frame;
    self.view = playView;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
