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
    
    self.loveBtn = loveBtn;
    self.downloadBtn = downloadBtn;
    self.commentBtn = commentBtn;
    self.moreBtn = moreBtn;
    
    [self addSubview:loveBtn];
    [self addSubview:downloadBtn];
    [self addSubview:commentBtn];
    [self addSubview:moreBtn];
    
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
    
}

@end
