//
//  PlayScrollView.m
//  CloudMusic
//
//  Created by LiDan on 15/12/12.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayScrollView.h"
#import "PlayDiscView.h"
#import "CloudMusic.pch"

@interface PlayScrollView()

@property (nonatomic,weak) PlayDiscView * playDiscView;
@property (nonatomic,strong) CADisplayLink *link;
@property (nonatomic,assign,getter=isSetted) BOOL setPosition;

@end

@implementation PlayScrollView

-(instancetype)initWithFrame:(CGRect)frame
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
    self.playDiscView.albumImageName = albumImageName;
    _albumImageName = albumImageName;
}


-(void)setup
{
    PlayDiscView *playDiscView = [[PlayDiscView alloc]init];
    
    self.playDiscView = playDiscView;
    
    [self addSubview:playDiscView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startToRotate) name:@"SendPlayMusicInfo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopToRotate) name:@"SendPauseMusicInfo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playNextMusic) name:@"SendChangeMusic" object:nil];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    if (!self.isSetted)
    {
        self.playDiscView.size = self.playDiscView.image.size;
        self.playDiscView.x = (ScreenWidth - self.playDiscView.width) / 2;
        self.playDiscView.y = (self.height - self.playDiscView.height) / 2;
        self.setPosition = YES;
    }
}

-(void)startToRotate
{
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotateView)];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

-(void)stopToRotate
{
    [self.link invalidate];
}

-(void)playNextMusic
{
    [self.link invalidate];
    self.playDiscView.transform = CGAffineTransformIdentity;
}

-(void)rotateView
{
    double angle = M_PI / 1080;
    self.playDiscView.transform = CGAffineTransformRotate(self.playDiscView.transform, angle);
}



@end
