//
//  MusicTool.m
//  CloudMusic
//
//  Created by LiDan on 15/12/14.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "MusicTool.h"
#import <AVFoundation/AVFoundation.h>

@interface MusicTool()

@property (nonatomic,strong) AVAudioPlayer* player;


@end

@implementation MusicTool

singleton_implementation(MusicTool)

-(NSArray *)musicList
{
    if (!_musicList)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"songs" ofType:@"plist"];
        _musicList = [MusicModel objectArrayWithFile:path];
    }
    return _musicList;
}


-(void)prepareToPlayWithMusic:(MusicModel *)music
{
    NSURL *musicUrl = [[NSBundle mainBundle] URLForResource:music.fileName withExtension:nil];
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:musicUrl error:nil];
    
    //准备播放音乐
    [self.player prepareToPlay];
}

-(void)playMusic
{
    [self.player play];
}


-(void)pauseMusic
{
    [self.player pause];
}



@end
