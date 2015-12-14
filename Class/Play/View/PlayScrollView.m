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
    
    PlayDiscView *playDiscView = [[PlayDiscView alloc]init];
    
    self.playDiscView = playDiscView;
    
    [self addSubview:playDiscView];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.playDiscView.size = self.playDiscView.image.size;
    self.playDiscView.x = (ScreenWidth - self.playDiscView.width) / 2;
    self.playDiscView.y = (self.height - self.playDiscView.height) / 2;
    self.playDiscView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    
    self.playDiscView.backgroundColor = [UIColor orangeColor];
}

-(void)rotateView
{
    self.playDiscView.transform = CGAffineTransformRotate(self.playDiscView.transform, M_PI_4 / 60);
}

@end
