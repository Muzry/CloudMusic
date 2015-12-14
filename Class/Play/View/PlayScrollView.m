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
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.playDiscView.size = self.playDiscView.image.size;
    self.playDiscView.x = (ScreenWidth - self.playDiscView.width) / 2;
    self.playDiscView.y = (self.height - self.playDiscView.height) / 2;
}

@end
