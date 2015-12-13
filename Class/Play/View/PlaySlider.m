//
//  PlaySlider.m
//  CloudMusic
//
//  Created by LiDan on 15/12/12.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlaySlider.h"
#import "UIImage+ResizeImage.h"
#import "CloudMusic.pch"

@implementation PlaySlider

-(instancetype)initWithFrame:(CGRect)frame
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
    [self setThumbImage:[UIImage imageNamed:@"cm2_fm_playbar_btn"] forState:UIControlStateNormal];
    [self setMaximumTrackImage:[UIImage resizeImageWihtImageName:@"cm2_fm_playbar_ready"] forState:UIControlStateNormal];
    [self setMinimumTrackImage:[UIImage resizeImageWihtImageName:@"cm2_fm_playbar_curr"] forState:UIControlStateNormal];
}

@end
