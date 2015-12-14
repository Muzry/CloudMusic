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
#import "PlaySlider.h"

@interface PlayMainControlView()

@property (nonatomic,weak) UIButton *prevBtn;
@property (nonatomic,weak) UIButton *playAndPauseBtn;
@property (nonatomic,weak) UIButton *nextBtn;
@property (nonatomic,weak) UIButton *playTypeBtn;
@property (nonatomic,weak) UIButton *musicListBtn;
@property (nonatomic,weak) PlaySlider *slider;
@property (nonatomic,weak) UILabel *totalTime;
@property (nonatomic,weak) UILabel *currentTime;

@property (nonatomic,assign) playType playingType;


@property (nonatomic,strong) CADisplayLink *link;

@end

@implementation PlayMainControlView

-(CADisplayLink *)link
{
    if (!_link)
    {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateSlider)];
    }
    return _link;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

-(void)setTotalTimeString:(NSString *)totalTimeString
{
    self.totalTime.text = totalTimeString;
    _totalTimeString = totalTimeString;
    self.slider.maximumValue = [MusicTool sharedMusicTool].player.duration;

}

-(void)setup
{
    
    UIButton *prevBtn = [[UIButton alloc]init];
    
    [prevBtn setNormalName:@"cm2_play_btn_prev" highlightName:@"cm2_play_btn_prev_prs"];
    [prevBtn addTarget:self action:@selector(prevBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *playAndPauseBtn = [[UIButton alloc]init];
    
    [playAndPauseBtn setNormalName:@"cm2_fm_btn_pause" highlightName:@"cm2_fm_btn_pause_prs"];
    [playAndPauseBtn addTarget:self action:@selector(playBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *nextBtn = [[UIButton alloc]init];
    [nextBtn setNormalName:@"cm2_fm_btn_next" highlightName:@"cm2_fm_btn_next_prs"];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *playTypeBtn = [[UIButton alloc]init];
    
    [playTypeBtn setNormalName:@"cm2_icn_loop" highlightName:@"cm2_icn_loop_prs"];
    [playTypeBtn addTarget:self action:@selector(typeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *musicListBtn = [[UIButton alloc]init];
    
    [musicListBtn setNormalName:@"cm2_icn_list" highlightName:@"cm2_icn_list_prs"];
    
    UILabel *currentTime = [[UILabel alloc]init];
    currentTime.textColor = [UIColor whiteColor];
    currentTime.alpha = 0.8;
    currentTime.font = [UIFont systemFontOfSize:11];
    
    UILabel *totalTime = [[UILabel alloc]init];
    totalTime.textColor = [UIColor whiteColor];
    totalTime.font = [UIFont systemFontOfSize:11];
    totalTime.alpha = 0.4;
    
    PlaySlider *slider = [[PlaySlider alloc]init];
    
    self.prevBtn = prevBtn;
    self.playAndPauseBtn = playAndPauseBtn;
    self.nextBtn = nextBtn;
    self.playTypeBtn = playTypeBtn;
    self.musicListBtn = musicListBtn;
    self.currentTime = currentTime;
    self.totalTime = totalTime;
    self.slider = slider;
    self.playingType = playTypeLoop;
    
    [self addSubview:playTypeBtn];
    [self addSubview:prevBtn];
    [self addSubview:playAndPauseBtn];
    [self addSubview:nextBtn];
    [self addSubview:musicListBtn];
    [self addSubview:currentTime];
    [self addSubview:totalTime];
    [self addSubview:slider];
    
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}

-(void)playBtnClick
{
    if (self.isPlaying)
    {
        self.playing = NO;
        [self notifyDelegateWithBtnType:playBtnTypePause];
    }
    else
    {
        self.playing = YES;
        [self notifyDelegateWithBtnType:playBtnTypePlay];
    }
}

-(void)setPlaying:(BOOL)playing
{
    if (playing)
    {
        [self.playAndPauseBtn setNormalName:@"cm2_fm_btn_pause" highlightName:@"cm2_fm_btn_pause_prs"];
    }
    else
    {
        [self.playAndPauseBtn setNormalName:@"cm2_fm_btn_play" highlightName:@"cm2_fm_btn_play_prs"];
    }
    _playing = playing;
}

-(void)prevBtnClick
{
    [self notifyDelegateWithBtnType:playBtnTypePrev];
}

-(void)nextBtnClick
{
    [self notifyDelegateWithBtnType:playBtnTypeNext];
}

-(void)typeBtnClick
{
    if (self.playingType == playTypeLoop)
    {
        [self.playTypeBtn setNormalName:@"cm2_icn_one" highlightName:@"cm2_icn_one_prs"];
        self.playingType = playTypeOne;
    }
    else if (self.playingType == playTypeOne)
    {
        
        [self.playTypeBtn setNormalName:@"cm2_icn_shuffle" highlightName:@"cm2_icn_shuffle_prs"];
        self.playingType = playTypeShuffle;
    }
    else
    {
        [self.playTypeBtn setNormalName:@"cm2_icn_loop" highlightName:@"cm2_icn_loop_prs"];
        self.playingType = playTypeLoop;
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    CGFloat margin = (ScreenWidth) / 5;
    for (int i = 0; i < 5 ; i++)
    {
        UIButton *btn = self.subviews[i];
        btn.size = btn.currentBackgroundImage.size;
        btn.x = i * margin + (margin - btn.size.width) / 2;
        btn.y = (self.height - btn.height) / 2;
    }
    
    self.currentTime.width = 32;
    self.currentTime.height = 8;
    self.currentTime.x = 10;
    self.currentTime.y = 10;
    
    self.totalTime.width = 32;
    self.totalTime.height = 8;
    self.totalTime.x = ScreenWidth - self.totalTime.width - 10;
    self.totalTime.y = self.currentTime.y;
    
    self.slider.width = ScreenWidth - 2 * (self.currentTime.x + self.currentTime.width + 10);
    self.slider.height = 10;
    self.slider.x = self.currentTime.x + self.currentTime.width + 10;
    self.slider.y = self.totalTime.y - 1;
    
}

//按钮监听代理
-(void)notifyDelegateWithBtnType:(playBtnType)playBtnType
{
    if ([self.delegate respondsToSelector:@selector(playMainControl:withBtnType:)])
    {
        [self.delegate playMainControl:self withBtnType:playBtnType];
    }
}

-(void)dealloc
{
    //移除定时器
    [self.link removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

//进度条更新
-(void)updateSlider
{
    double currentTime = [MusicTool sharedMusicTool].player.currentTime;
    self.slider.value = currentTime;
    self.currentTime.text = [NSString getMinuteSecondFrom:currentTime];
    if ([self.currentTime.text isEqualToString:self.totalTimeString])
    {
        [self nextBtnClick];
    }
}

@end
