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

@end

@implementation PlayScrollView

static bool isSet = NO;

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


-(void)setup
{
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    PlayDiscView *playDiscView = [[PlayDiscView alloc]init];
    
    self.playDiscView = playDiscView;
    
    [self addSubview:playDiscView];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!isSet)
    {
        self.playDiscView.size = self.playDiscView.image.size;
        self.playDiscView.x = (ScreenWidth - self.playDiscView.width) / 2;
        self.playDiscView.y = (self.height - self.playDiscView.height) / 2;
        isSet = YES;
    }
}

-(void)rotateView
{
    double angle = M_PI / 1080;
    self.playDiscView.transform = CGAffineTransformRotate(self.playDiscView.transform, angle);
}

@end
