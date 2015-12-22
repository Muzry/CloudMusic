//
//  MyMusicController.m
//  CloudMusic
//
//  Created by LiDan on 15/12/6.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "MyMusicController.h"
#import "PlayViewController.h"
#import "CloudMusic.pch"
#import "MusicModel.h"
#import "MusicCell.h"


@interface MyMusicController()

@end


@implementation MyMusicController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:RGBColor(251, 252, 253)];
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [MusicTool sharedMusicTool].musicList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MusicCell * cell = [MusicCell musicCellWithTableView:tableView];
    cell.music = [MusicTool sharedMusicTool].musicList[indexPath.row];
    cell.num = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MusicModel *music = [MusicTool sharedMusicTool].musicList[indexPath.row];
    PlayViewController *playerVc = [[PlayViewController alloc]init];
    playerVc.music = music;
    [[MusicTool sharedMusicTool] prepareToPlayWithMusic:music];
    [[MusicTool sharedMusicTool] playMusic];
    [MusicTool sharedMusicTool].playingIndex = indexPath.row;
    [self.navigationController pushViewController:playerVc animated:YES];
}

@end
