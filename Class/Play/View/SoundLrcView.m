//
//  SoundLrcView.m
//  CloudMusic
//
//  Created by LiDan on 15/12/23.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "SoundLrcView.h"
#import "SoundSlider.h"
#import "CloudMusic.pch"

@interface SoundLrcView()

@property (nonatomic,weak) SoundSlider *soundSlider;
@property (nonatomic,weak) UIImageView *soundView;

@end

@implementation SoundLrcView

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
    SoundSlider *soundSlider = [[SoundSlider alloc]init];
    UIImageView *soundView = [[UIImageView alloc]init];
    [soundView setImage:[UIImage imageNamed:@"cm2_fm_vol_speaker_silent"]];
    
    [self addSubview:soundSlider];
    [self addSubview:soundView];
    
    self.soundView = soundView;
    self.soundSlider = soundSlider;

}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.soundView.size = self.soundView.image.size;
    self.soundView.x = 10;
    self.soundView.y = 10;
    
    self.soundSlider.x = 40;
    self.soundSlider.y = 10;
    self.soundSlider.width = self.width - 40 - 25;
    self.soundSlider.height = 30;
}

@end
