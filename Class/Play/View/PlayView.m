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
#import "PlayMainControlView.h"
#import "UIImage+ImageEffects.h"
#import "MusicTool.h"

@interface PlayView()<PlayMainControlDelegate>

@property (nonatomic,weak) PlayTabBar * playTabBar;
@property (nonatomic,weak) UIImageView * maskView;
@property (nonatomic,weak) UIImageView * backgroundView;
@property (nonatomic,weak) PlayControlView *playControlView;
@property (nonatomic,weak) PlayMainControlView *playMainControlView;

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

-(void)setMusic:(MusicModel *)music
{
    self.playTabBar.singerName = music.singer;
    self.playTabBar.songName = music.songName;
    [self.backgroundView setImage:[[UIImage imageNamed:music.ablumImage] applyBlurWithRadius:60 tintColor:[UIColor clearColor] saturationDeltaFactor:1.0 maskImage:nil]];
    self.playControlView.albumImageName = music.ablumImage;
    [[MusicTool sharedMusicTool] prepareToPlayWithMusic:music];
    [[MusicTool sharedMusicTool] playMusic];
    self.playMainControlView.playing = YES;
}

-(void)setup
{
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *maskView = [[UIImageView alloc]init];
    
    if (IS_IPHONE_6)
    {
        [maskView setImage:[UIImage imageNamed:@"cm2_play_disc_mask-ip6"]];
    }
    else if (IS_IPHONE_5)
    {
        [maskView setImage:[UIImage imageNamed:@"cm2_play_disc_mask-ip5"]];
    }
    else
    {
        [maskView setImage:[UIImage imageNamed:@"cm2_play_disc_mask"]];
    }
    
    self.maskView = maskView;
    
    //模糊效果的背景
    UIImageView *backgroundView = [[UIImageView alloc] init];
    self.backgroundView = backgroundView;
    
    PlayTabBar *playTabBar = [[PlayTabBar alloc]init];
    self.playTabBar = playTabBar;
    
    PlayControlView* playControlView = [[PlayControlView alloc]init];
    self.playControlView = playControlView;
    
    PlayMainControlView* playMainControlView = [[PlayMainControlView alloc]init];
    playMainControlView.delegate = self;
    self.playMainControlView = playMainControlView;
    
    [self addSubview:backgroundView];
    [self addSubview:maskView];
    [self addSubview:playControlView];
    [self addSubview:playMainControlView];
    [self addSubview:playTabBar];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backgroundView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.maskView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.playTabBar.frame = CGRectMake(0, 0, ScreenWidth, 64);
    
    self.playMainControlView.height = 100;
    self.playMainControlView.width = ScreenWidth;
    self.playMainControlView.x = 0;
    self.playMainControlView.y = self.height - self.playMainControlView.height;
    
    self.playControlView.x = 0;
    self.playControlView.y = 64;
    self.playControlView.width = ScreenWidth;
    self.playControlView.height = ScreenHeight - self.playMainControlView.height - self.playTabBar.height;
}

-(void)playMainControl:(PlayMainControlView *)mainControlView withBtnType:(playBtnType)type
{
    switch (type)
    {
        case playBtnTypePlay:
        {
            [[MusicTool sharedMusicTool] playMusic];
            break;
        }
        case playBtnTypePause:
        {
            [[MusicTool sharedMusicTool] pauseMusic];
            break;
        }
        case playBtnTypePrev:
        {
            NSInteger index = [MusicTool sharedMusicTool].playingIndex - 1;
            [self prepareToChangeMusic:index];
            break;
        }
        case playBtnTypeNext:
        {
            NSInteger index = [MusicTool sharedMusicTool].playingIndex + 1;
            [self prepareToChangeMusic:index];
            break;
        }
        case playBtnTypeList:
        {
            NSLog(@"列表");
            break;
        }
        default:
            break;
    }
}

-(void)prepareToChangeMusic:(NSInteger)index
{
    NSInteger count = [MusicTool sharedMusicTool].musicList.count;
    
    index = index > 0 ? index % count : (index + count) % count;
    
    MusicModel *music = [MusicTool sharedMusicTool].musicList[index];
    self.music = music;
    [MusicTool sharedMusicTool].playingIndex = index;
}

@end
