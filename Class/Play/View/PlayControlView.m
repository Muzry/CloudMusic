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
//    [self setBackgroundColor:[UIColor orangeColor]];
    PlayOtherControlView *playOtherControlView = [[PlayOtherControlView alloc]init];
    self.playOtherControlView = playOtherControlView;

    [self addSubview:playOtherControlView];
}


-(void)layoutSubviews
{
    [super layoutSubviews];

    self.playOtherControlView.height = 40;
    self.playOtherControlView.width = ScreenWidth;
    self.playOtherControlView.x = 0;
    self.playOtherControlView.y = self.height - self.playOtherControlView.height;
}


@end
