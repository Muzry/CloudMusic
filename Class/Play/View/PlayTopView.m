//
//  PlayTopView.m
//  CloudMusic
//
//  Created by LiDan on 15/12/12.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayTopView.h"
#import "CloudMusic.pch"

@interface PlayTopView()

@property (nonatomic,weak) UIImageView * playNeedle;
@property (nonatomic,assign,getter=isSetted) BOOL setPosition;
@property (nonatomic,assign,getter=isFirstRotate) BOOL firstRotate;
@property (nonatomic,assign,getter=isScrolled) BOOL scrollStart;

@end


@implementation PlayTopView

-(instancetype)initWithFrame:(CGRect)frame
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
    UIImageView *playNeedle = [[UIImageView alloc]init];
    self.userInteractionEnabled = YES;
    
    if(IS_IPHONE_6)
    {
        [playNeedle setImage:[UIImage imageNamed:@"cm2_play_needle_play-ip6"]];
    }
    else if(IS_IPHONE_5)
    {
        [playNeedle setImage:[UIImage imageNamed:@"cm2_play_needle_play-ip5"]];
    }
    else
    {
        [playNeedle setImage:[UIImage imageNamed:@"cm2_play_needle_play"]];
    }
    
    playNeedle.layer.anchorPoint = CGPointMake(0.2, 0.2);
    self.playNeedle = playNeedle;
    [self addSubview:playNeedle];
    
    self.clipsToBounds = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startToRotate) name:@"SendPlayMusicInfo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopToRotate) name:@"SendPauseMusicInfo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playNextMusic) name:@"SendChangeMusic" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ScrollPause) name:@"sendScrollPause" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ScrollContinue) name:@"sendScrollContinue" object:nil];
    
}


-(void)layoutSubviews
{
    [super layoutSubviews];

    if(!self.isSetted)
    {
        self.playNeedle.size = self.playNeedle.image.size;
        self.playNeedle.x = ScreenWidth/2 - 28;
        self.playNeedle.y = -30;
        self.setPosition = YES;
    }

}

-(void)startToRotate
{
    if(!self.isFirstRotate)
    {
        self.playNeedle.transform = CGAffineTransformMakeRotation(M_PI * - 30 / 180);
        self.firstRotate = YES;
    }
    [UIImageView animateWithDuration:0.8 animations:^{
        self.playNeedle.transform = CGAffineTransformRotate(self.playNeedle.transform, M_PI * 30 / 180);
    }];
    
}

-(void)stopToRotate
{
    [UIImageView animateWithDuration:0.8 animations:^{
        self.playNeedle.transform = CGAffineTransformMakeRotation(M_PI * - 30 / 180);
    }];
}

-(void)playNextMusic
{
    [UIImageView animateWithDuration:0.3 animations:^{
        self.playNeedle.transform = CGAffineTransformMakeRotation(M_PI * - 10 / 180);
    } completion:^(BOOL finished) {
        [UIImageView animateWithDuration:0.3 animations:^{
            self.playNeedle.transform = CGAffineTransformRotate(self.playNeedle.transform, M_PI * 10   / 180);
        }];
    }];
    self.scrollStart = NO;
}

-(void)ScrollPause
{
    [self stopToRotate];
    self.scrollStart = YES;
}

-(void)ScrollContinue
{
    if (self.scrollStart)
    {
        [self startToRotate];
    }
    self.scrollStart = NO;
}

@end
