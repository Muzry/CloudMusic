//
//  PlayView.m
//  CloudMusic
//
//  Created by LiDan on 15/12/10.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayView.h"
#import "PlayTabBar.h"
#import "CloudMusic.pch"

@interface PlayView()

@property (nonatomic,strong) PlayTabBar * playTabBar;
@property (nonatomic,strong) UIImageView * maskView;
@property (nonatomic,strong) UIImageView * backgroundView;

@end

@implementation PlayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

-(void)setup
{
    [self setBackgroundColor:[UIColor whiteColor]];

    
    UIImageView *maskView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cm2_play_disc_mask-ip6"]];
    self.maskView = maskView;
    
    
#TODO : 模糊效果
    UIImageView *backgroundView = [[UIImageView alloc] init];
    [backgroundView setImage:[UIImage imageNamed:@"bg"]];
    self.backgroundView = backgroundView;
    
    PlayTabBar *playTabBar = [[PlayTabBar alloc]init];
    self.playTabBar = playTabBar;
    
    [self addSubview:backgroundView];
    [self addSubview:maskView];
    [self addSubview:playTabBar];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backgroundView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.maskView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.playTabBar.frame = CGRectMake(0, 0, ScreenWidth, 64);
}

@end
