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
@property (nonatomic,strong) UIImageView * topImage;
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

    
    UIImageView *topImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cm2_play_disc_mask-ip6"]];
    self.topImage = topImage;
    
    UIImageView *maskView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cm2_play_disc_radio-ip6"]];
    self.topImage = maskView;
    
    UIImageView *backgroundImage = [[UIImageView alloc] init];
    [backgroundImage setImage:[UIImage imageNamed:@"bg"]];
    self.backgroundImage = backgroundImage;
    
    PlayTabBar *playTabBar = [[PlayTabBar alloc]init];
    self.playTabBar = playTabBar;
    
    [self addSubview:backgroundImage];
    [self addSubview:maskView];
    [self addSubview:topImage];
    [self addSubview:playTabBar];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backgroundImage.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.topImage.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.maskView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.playTabBar.frame = CGRectMake(0, 0, ScreenWidth, 64);
}

@end
