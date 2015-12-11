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
#import "CloudMusic.pch"

@interface PlayMainControlView()

@property (nonatomic,strong) UIButton *prevBtn;
@property (nonatomic,strong) UIButton *playAndPauseBtn;
@property (nonatomic,strong) UIButton *nextBtn;
@property (nonatomic,strong) UIButton *playTypeBtn;
@property (nonatomic,strong) UIButton *musicListBtn;
@property (nonatomic,strong) UISlider *slider;
@property (nonatomic,strong) UILabel *totalTime;
@property (nonatomic,strong) UILabel *currentTime;

@end

@implementation PlayMainControlView

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
    
    UIButton *prevBtn = [[UIButton alloc]init];
    
    [prevBtn setBackgroundImage:[UIImage imageNamed:@"cm2_play_btn_prev"] forState:UIControlStateNormal];
    [prevBtn setBackgroundImage:[UIImage imageNamed:@"cm2_play_btn_prev_prs"] forState:UIControlStateHighlighted];
    
    UIButton *playAndPauseBtn = [[UIButton alloc]init];
    
    [playAndPauseBtn setBackgroundImage:[UIImage imageNamed:@"cm2_fm_btn_play"] forState:UIControlStateNormal];
    [playAndPauseBtn setBackgroundImage:[UIImage imageNamed:@"cm2_fm_btn_play_prs"] forState:UIControlStateHighlighted];
    
    UIButton *nextBtn = [[UIButton alloc]init];
    
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"cm2_fm_btn_next"] forState:UIControlStateNormal];
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"cm2_fm_btn_next_prs"] forState:UIControlStateHighlighted];
    
    UIButton *playTypeBtn = [[UIButton alloc]init];
    
    [playTypeBtn setBackgroundImage:[UIImage imageNamed:@"cm2_icn_loop"] forState:UIControlStateNormal];
    [playTypeBtn setBackgroundImage:[UIImage imageNamed:@"cm2_icn_loop_prs"] forState:UIControlStateHighlighted];
    
    UIButton *musicListBtn = [[UIButton alloc]init];
    
    [musicListBtn setBackgroundImage:[UIImage imageNamed:@"cm2_icn_list"] forState:UIControlStateNormal];
    [musicListBtn setBackgroundImage:[UIImage imageNamed:@"cm2_icn_list_prs"] forState:UIControlStateHighlighted];
    
    UILabel *currentTime = [[UILabel alloc]init];
    currentTime.text = @"00:00";
    currentTime.textColor = [UIColor whiteColor];
    currentTime.alpha = 0.8;
    currentTime.font = [UIFont systemFontOfSize:11];
    
    UILabel *totalTime = [[UILabel alloc]init];
    totalTime.text = @"04:05";
    totalTime.textColor = [UIColor whiteColor];
    totalTime.font = [UIFont systemFontOfSize:11];
    totalTime.alpha = 0.4;
    
    UISlider *slider = [[UISlider alloc]init];
    
    self.prevBtn = prevBtn;
    self.playAndPauseBtn = playAndPauseBtn;
    self.nextBtn = nextBtn;
    self.playTypeBtn = playTypeBtn;
    self.musicListBtn = musicListBtn;
    self.currentTime = currentTime;
    self.totalTime = totalTime;
    self.slider = slider;
    
    [self addSubview:prevBtn];
    [self addSubview:playAndPauseBtn];
    [self addSubview:nextBtn];
    [self addSubview:playTypeBtn];
    [self addSubview:musicListBtn];
    [self addSubview:currentTime];
    [self addSubview:totalTime];
    [self addSubview:slider];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.playAndPauseBtn.size = self.playAndPauseBtn.currentBackgroundImage.size;
    self.playAndPauseBtn.x = (ScreenWidth - self.playAndPauseBtn.width) / 2;
    self.playAndPauseBtn.y = (self.height - self.playAndPauseBtn.height) / 2;
    
    self.prevBtn.size = self.prevBtn.currentBackgroundImage.size;
    self.prevBtn.x =  self.playAndPauseBtn.x - 20 - self.prevBtn.width;
    self.prevBtn.y = (self.height - self.prevBtn.height) / 2;
    
    self.nextBtn.size = self.nextBtn.currentBackgroundImage.size;
    self.nextBtn.x =  self.playAndPauseBtn.x + self.playAndPauseBtn.width + 20;
    self.nextBtn.y = (self.height - self.nextBtn.height) / 2;
    
    self.playTypeBtn.size = self.playTypeBtn.currentBackgroundImage.size;
    self.playTypeBtn.x = 10;
    self.playTypeBtn.y = (self.height - self.playTypeBtn.height) / 2;
    
    self.musicListBtn.size = self.musicListBtn.currentBackgroundImage.size;
    self.musicListBtn.x = ScreenWidth - self.musicListBtn.width - 10;
    self.musicListBtn.y = (self.height - self.musicListBtn.height) / 2;
    
    self.currentTime.width = 32;
    self.currentTime.height = 8;
    self.currentTime.x = 10;
    self.currentTime.y = 0;
    
    self.totalTime.width = 32;
    self.totalTime.height = 8;
    self.totalTime.x = ScreenWidth - self.totalTime.width - 10;
    self.totalTime.y = self.currentTime.y;
    
    self.slider.width = ScreenWidth - 2 * (self.currentTime.x + self.currentTime.width + 5);
    self.slider.height = 0;
    self.slider.x = self.currentTime.x + self.currentTime.width + 2;
    self.slider.y = self.totalTime.y + 4;
    
}

@end
