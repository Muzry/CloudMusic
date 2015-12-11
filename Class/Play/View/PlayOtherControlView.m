//
//  PlayOtherControlView.m
//  CloudMusic
//
//  Created by LiDan on 15/12/11.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayOtherControlView.h"
#import "CloudMusic.pch"

@interface PlayOtherControlView()

@property (nonatomic,strong) UISlider *slider;
@property (nonatomic,strong) UILabel *totalTime;
@property (nonatomic,strong) UILabel *currentTime;
@property (nonatomic,strong) UIButton *loveBtn;
@property (nonatomic,strong) UIButton *downloadBtn;
@property (nonatomic,strong) UIButton *commentBtn;
@property (nonatomic,strong) UIButton *moreBtn;


@end

@implementation PlayOtherControlView

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
    
    UIButton *loveBtn = [[UIButton alloc]init];
    [loveBtn setBackgroundImage:[UIImage imageNamed:@"cm2_play_icn_love"] forState:UIControlStateNormal];
    [loveBtn setBackgroundImage:[UIImage imageNamed:@"cm2_play_icn_love_prs"] forState:UIControlStateHighlighted];
    
    
    UIButton *downloadBtn = [[UIButton alloc]init];
    [downloadBtn setBackgroundImage:[UIImage imageNamed:@"cm2_play_icn_dld"] forState:UIControlStateNormal];
    [downloadBtn setBackgroundImage:[UIImage imageNamed:@"cm2_play_icn_dld_prs"] forState:UIControlStateHighlighted];
    
    UIButton *commentBtn = [[UIButton alloc]init];
    [commentBtn setBackgroundImage:[UIImage imageNamed:@"cm2_play_icn_cmt"] forState:UIControlStateNormal];
    [commentBtn setBackgroundImage:[UIImage imageNamed:@"cm2_play_icn_cmt_prs"] forState:UIControlStateHighlighted];
    
    UIButton *moreBtn = [[UIButton alloc]init];
    [moreBtn setBackgroundImage:[UIImage imageNamed:@"cm2_play_icn_more"] forState:UIControlStateNormal];
    [moreBtn setBackgroundImage:[UIImage imageNamed:@"cm2_play_icn_more_prs"] forState:UIControlStateHighlighted];
    
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
    
    self.loveBtn = loveBtn;
    self.downloadBtn = downloadBtn;
    self.commentBtn = commentBtn;
    self.moreBtn = moreBtn;
    
    self.currentTime = currentTime;
    self.totalTime = totalTime;
    self.slider = slider;
    
    [self addSubview:loveBtn];
    [self addSubview:downloadBtn];
    [self addSubview:commentBtn];
    [self addSubview:moreBtn];
    
    [self addSubview:currentTime];
    [self addSubview:totalTime];
    [self addSubview:slider];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnX = 55;
    CGFloat btnY = 0;
    CGFloat margin = 80;
    
    for (int i = 0; i < 4 ; i++)
    {
        UIButton *btn = self.subviews[i];
        btn.size = btn.currentBackgroundImage.size;
        btn.x = btnX + i * margin;
        btn.y = btnY;
    }
    
    self.currentTime.width = 32;
    self.currentTime.height = 8;
    self.currentTime.x = 10;
    self.currentTime.y = self.height - self.currentTime.height;
    
    self.totalTime.width = 32;
    self.totalTime.height = 8;
    self.totalTime.x = ScreenWidth - self.totalTime.width - 10;
    self.totalTime.y = self.currentTime.y;
    
    self.slider.width = ScreenWidth - 2 * (self.currentTime.x + self.currentTime.width + 5);
    self.slider.height = 10;
    self.slider.x = self.currentTime.x + self.currentTime.width + 2;
    self.slider.y = self.totalTime.y;
}

@end
