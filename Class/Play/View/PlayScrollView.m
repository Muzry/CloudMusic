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
#import "MusicModel.h"

@interface PlayScrollView()<UIScrollViewDelegate>

@property (nonatomic,weak) PlayDiscView * playDiscView;
@property (nonatomic,weak) PlayDiscView * prevDiscView;
@property (nonatomic,weak) PlayDiscView * nextDiscView;
@property (nonatomic,strong) CADisplayLink *link;
@property (nonatomic,assign,getter=isSetted) BOOL setPosition;
@property (nonatomic,assign) NSInteger prevIndex;
@property (nonatomic,assign) NSInteger nextIndex;
@property (nonatomic,assign) CGFloat startContentOffsetX;
@property (nonatomic,assign) CGFloat endContentOffsetX;

@property (nonatomic,strong)NSMutableArray *visibleImageViews;

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

-(CADisplayLink *)link
{
    if (!_link)
    {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotateView)];
    }
    return _link;
}

-(void)setAlbumImageName:(NSString *)albumImageName
{
    self.playDiscView.albumImageName = albumImageName;
    _albumImageName = albumImageName;
}

-(NSMutableArray *)visibleImageViews
{
    if (!_visibleImageViews)
    {
        _visibleImageViews = [NSMutableArray array];
    }
    return _visibleImageViews;
}

-(void)setPrevIndex:(NSInteger)prevIndex
{
    _prevIndex = [self judgeIndex: prevIndex];
    self.prevDiscView.albumImageName = ((MusicModel *)[MusicTool sharedMusicTool].musicList[_prevIndex]).albumImage;
}

-(void)setNextIndex:(NSInteger)nextIndex
{
    _nextIndex = [self judgeIndex: nextIndex];
    self.nextDiscView.albumImageName = ((MusicModel *)[MusicTool sharedMusicTool].musicList[_nextIndex]).albumImage;
}

-(void)setup
{
    PlayDiscView *playDiscView = [[PlayDiscView alloc]init];
    
    self.playDiscView = playDiscView;
    
    PlayDiscView *prevDiscView = [[PlayDiscView alloc]init];
    
    self.prevDiscView = prevDiscView;
    
    PlayDiscView *nextDiscView = [[PlayDiscView alloc]init];
    
    self.nextDiscView = nextDiscView;
    
    self.prevIndex = [self judgeIndex:[MusicTool sharedMusicTool].playingIndex - 1];
    
    self.nextIndex = [self judgeIndex:[MusicTool sharedMusicTool].playingIndex + 1];
    
    self.bounces = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.pagingEnabled = YES;
    self.delegate = self;

    
    [self addSubview:prevDiscView];
    [self addSubview:playDiscView];
    [self addSubview:nextDiscView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startToRotate) name:@"SendPlayMusicInfo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopToRotate) name:@"SendPauseMusicInfo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(autoToNextMusic) name:@"AutoNextMusic" object:nil];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    if (!self.isSetted)
    {
        
        self.playDiscView.size = self.playDiscView.image.size;
        self.playDiscView.x = (ScreenWidth - self.playDiscView.width) / 2 + self.width;
        self.playDiscView.y = (self.height - self.playDiscView.height) / 2;
        
        self.prevDiscView.size = self.prevDiscView.image.size;
        self.prevDiscView.x = (ScreenWidth - self.prevDiscView.width) / 2;
        self.prevDiscView.y = self.playDiscView.y;
        
        self.nextDiscView.size = self.nextDiscView.image.size;
        self.nextDiscView.x = (ScreenWidth - self.nextDiscView.width) / 2 + 2 * self.width;
        self.nextDiscView.y = self.playDiscView.y;
        
        [self.visibleImageViews addObject:self.prevDiscView];
        [self.visibleImageViews addObject:self.playDiscView];
        [self.visibleImageViews addObject:self.nextDiscView];
        
        self.setPosition = YES;
    }
}

-(void)startToRotate
{
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

-(void)stopToRotate
{
    [self.link invalidate];
    self.link = nil;
}

-(void)playNextMusic
{
    self.playDiscView.transform = CGAffineTransformIdentity;
}

-(void)rotateView
{
    double angle = M_PI / 1080;
    self.playDiscView.transform = CGAffineTransformRotate(self.playDiscView.transform, angle);
}


-(NSInteger)judgeIndex:(NSInteger)index
{
    NSInteger count = [MusicTool sharedMusicTool].musicList.count;
    return index > 0 ? index % count : (index + count) % count;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.startContentOffsetX = scrollView.contentOffset.x;
    [self sendScrollPause];
}

- (void)scrollViewDidScroll:(UIScrollView *)ScrollView {
    
    int x = self.endContentOffsetX = ScrollView.contentOffset.x;
    //往下翻一张
    if(x >= (2*self.width))
    {
        [self loadData];
    }
    //往上翻
    else if(x <= 0)
    {
        [self loadData];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self setContentOffset:CGPointMake(self.width, 0) animated:YES];
    if (self.endContentOffsetX == self.startContentOffsetX)
    {
        [self sendContinue];
    }
}


- (void)loadData
{
    //从scrollView上移除所有的subview
    NSArray *subViews = [self subviews];
    if([subViews count] != 0)
    {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    for (int i = 0; i < 3; i++)
    {
        PlayDiscView *v = [self.visibleImageViews objectAtIndex:i];
        [self addSubview:v];
    }
    if (self.endContentOffsetX > self.startContentOffsetX) //右划 下一首
    {
        self.albumImageName = ((MusicModel*)[MusicTool sharedMusicTool].musicList[[self judgeIndex:self.nextIndex]]).albumImage;
        self.prevIndex = self.prevIndex + 1;
        self.nextIndex = self.nextIndex + 1;
        [self sendNextMusicScroll];
    }
    else //左划 上一首
    {
        self.albumImageName = ((MusicModel*)[MusicTool sharedMusicTool].musicList[[self judgeIndex:self.prevIndex]]).albumImage;
        self.prevIndex = self.prevIndex - 1;
        self.nextIndex = self.nextIndex - 1;
        [self sendPrevMusicScroll];
    }

    [self setContentOffset:CGPointMake(self.width, 0)];
    [self playNextMusic];
}

-(void)sendPrevMusicScroll
{
    NSNotification *notification =[NSNotification notificationWithName:@"sendPrevMusicScroll" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

-(void)sendNextMusicScroll
{
    NSNotification *notification =[NSNotification notificationWithName:@"sendNextMusicScroll" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

-(void)sendScrollPause
{
    NSNotification *notification =[NSNotification notificationWithName:@"sendScrollPause" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

-(void)sendContinue
{
    NSNotification *notification =[NSNotification notificationWithName:@"sendScrollContinue" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}


@end
