//
//  MusicTool.h
//  CloudMusic
//
//  Created by LiDan on 15/12/14.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "MusicModel.h"
#import "CloudMusic.pch"

@interface MusicTool : NSObject
singleton_interface(MusicTool)

@property (nonatomic,strong) NSArray *musicList;
@property (nonatomic,assign) NSInteger playingIndex;

/** 音乐播放前的准备工作*/
-(void)prepareToPlayWithMusic:(MusicModel *)music;

/**
 *  播放
 */
-(void)playMusic;


/**
 *  暂停
 */
-(void)pauseMusic;

@end
