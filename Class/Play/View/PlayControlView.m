//
//  PlayMainView.m
//  CloudMusic
//
//  Created by LiDan on 15/12/11.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayMainControlView.h"
#import "PlayControlView.h"
#import "PlayOtherControlView.h"
#import "PlayScrollView.h"
#import "PlayTopView.h"
#import "CloudMusic.pch"

@interface PlayControlView()

@property (nonatomic,weak) PlayOtherControlView *playOtherControlView;
@property (nonatomic,weak) UIImageView* crossView;
@property (nonatomic,weak) PlayScrollView *playScrollView;
@property (nonatomic,weak) PlayTopView *playTopView;

@end

@implementation PlayControlView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

-(void)setAlbumImageName:(NSString *)albumImageName
{
    self.playScrollView.ablumImageName = albumImageName;
}

-(void)setup
{
//    [self setBackgroundColor:[UIColor orangeColor]];
    PlayOtherControlView *playOtherControlView = [[PlayOtherControlView alloc]init];
    self.playOtherControlView = playOtherControlView;
    
    // 下端阴影
    UIImageView *crossView = [[UIImageView alloc]init];
    [crossView setImage:[UIImage imageNamed:@"cm2_play_crossline"]];
    self.crossView = crossView;
    
    
    PlayScrollView *playScrollView = [[PlayScrollView alloc]init];
    self.playScrollView = playScrollView;
    
    PlayTopView *playTopView = [[PlayTopView alloc]init];
    self.playTopView = playTopView;

    [self addSubview:playOtherControlView];
    [self addSubview:playScrollView];
    [self addSubview:playTopView];
    [self addSubview:crossView];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.crossView.height = self.crossView.image.size.height;
    self.crossView.width = ScreenWidth;
    self.crossView.x = 0;
    self.crossView.y = -self.crossView.height;
    
    self.playOtherControlView.height = 40;
    self.playOtherControlView.width = ScreenWidth;
    self.playOtherControlView.x = 0;
    self.playOtherControlView.y = self.height - self.playOtherControlView.height - 25;
    
    self.playScrollView.x = 0;
    self.playScrollView.y = 20;
    self.playScrollView.width = ScreenWidth;
    self.playScrollView.height = self.height - self.playOtherControlView.height - self.playScrollView.y - 20;
    
    self.playTopView.x = ScreenWidth / 2 - 30;
    self.playTopView.y = 0;
    self.playTopView.width = ScreenWidth;
    self.playTopView.height = 200;
}


@end
