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
@property (nonatomic,strong) UIImageView * backgroundImage;

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
    UIImageView *backgroundImage = [[UIImageView alloc] init];
    backgroundImage.backgroundColor = [UIColor yellowColor];
    self.backgroundImage = backgroundImage;
    
    UIImageView *maskView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cm2_play_disc_mask-ip6"]];
    self.maskView = maskView;
    
    PlayTabBar *playTabBar = [[PlayTabBar alloc]init];
    self.playTabBar = playTabBar;
    
    [self addSubview:backgroundImage];
    [self addSubview:maskView];
    [self addSubview:playTabBar];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backgroundImage.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.maskView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.playTabBar.frame = CGRectMake(0, 0, ScreenWidth, 64);
}

@end