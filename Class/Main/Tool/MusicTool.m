//
//  MusicTool.m
//  CloudMusic
//
//  Created by LiDan on 15/12/14.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "MusicTool.h"

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
    self.player.delegate = self;
    
    //准备播放音乐
    [self.player prepareToPlay];
}

-(void)playMusic
{
    [self.player play];
    NSNotification *notification =[NSNotification notificationWithName:@"SendPlayMusicInfo" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}


-(void)pauseMusic
{
    [self.player pause];
    NSNotification *notification =[NSNotification notificationWithName:@"SendPauseMusicInfo" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSNotification *notification =[NSNotification notificationWithName:@"SendFinishMusicInfo" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}



@end
