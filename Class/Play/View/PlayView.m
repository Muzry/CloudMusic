//
//  PlayView.m
//  CloudMusic
//
//  Created by LiDan on 15/12/10.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayView.h"
#import "PlayTabBar.h"
#import "PlayControlView.h"
#import "CloudMusic.pch"
#import "UIImage+ImageEffects.h"

@interface PlayView()

@property (nonatomic,strong) PlayTabBar * playTabBar;
@property (nonatomic,strong) UIImageView * maskView;
@property (nonatomic,strong) UIImageView * backgroundView;
@property (nonatomic,strong) PlayControlView *playControlView;

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
    
    //模糊效果的背景
    UIImageView *backgroundView = [[UIImageView alloc] init];
    [backgroundView setImage:[[UIImage imageNamed:@"bg"] applyBlurWithRadius:60 tintColor:[UIColor clearColor] saturationDeltaFactor:1.0 maskImage:nil]];
    self.backgroundView = backgroundView;
    
    PlayTabBar *playTabBar = [[PlayTabBar alloc]init];
    self.playTabBar = playTabBar;
    
    PlayControlView *playControlView = [[PlayControlView alloc]init];
    self.playControlView = playControlView;
    
    [self addSubview:backgroundView];
    [self addSubview:maskView];
    [self addSubview:playTabBar];
    [self addSubview:playControlView];

}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backgroundView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.maskView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.playTabBar.frame = CGRectMake(0, 0, ScreenWidth, 64);
    
    self.playControlView.height = 150;
    self.playControlView.width = ScreenWidth;
    self.playControlView.x = 0;
    self.playControlView.y = self.height - self.playControlView.height;

}

@end
