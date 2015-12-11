//
//  PlayControlView.m
//  CloudMusic
//
//  Created by LiDan on 15/12/11.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayControlView.h"
#import "CloudMusic.pch"

@interface PlayControlView()

@property (nonatomic,strong) UIButton *prevBtn;
@property (nonatomic,strong) UIButton *playAndPauseBtn;
@property (nonatomic,strong) UIButton *nextBtn;
@property (nonatomic,strong) UIButton *playTypeBtn;
@property (nonatomic,strong) UIButton *musicListBtn;
@property (nonatomic,strong) UISlider *slider;

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
    
    self.prevBtn = prevBtn;
    self.playAndPauseBtn = playAndPauseBtn;
    self.nextBtn = nextBtn;
    self.playTypeBtn = playTypeBtn;
    self.musicListBtn = musicListBtn;
    
    
    [self addSubview:prevBtn];
    [self addSubview:playAndPauseBtn];
    [self addSubview:nextBtn];
    [self addSubview:playTypeBtn];
    [self addSubview:musicListBtn];
    
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

}
@end
