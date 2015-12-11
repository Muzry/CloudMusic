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
#import "CloudMusic.pch"

@interface PlayControlView()

@property (nonatomic,strong) PlayMainControlView *playMainControlView;
@property (nonatomic,strong) PlayOtherControlView *playOtherControlView;

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
    PlayMainControlView *playMainControlView = [[PlayMainControlView alloc] init];
    self.playMainControlView = playMainControlView;
    
    PlayOtherControlView *playOtherControlView = [[PlayOtherControlView alloc]init];
    self.playOtherControlView = playOtherControlView;
    
    [self addSubview:playMainControlView];
    [self addSubview:playOtherControlView];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.playMainControlView.width = ScreenWidth;
    self.playMainControlView.height = 80;
    self.playMainControlView.x = 0;
    self.playMainControlView.y = self.height - self.playMainControlView.height;

    self.playOtherControlView.height = 70;
    self.playOtherControlView.width = ScreenWidth;
    self.playOtherControlView.x = 0;
    self.playOtherControlView.y = self.playMainControlView.y - self.playOtherControlView.height;
}


@end
