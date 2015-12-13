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

@interface MyMusicController()

@property (nonatomic,strong) NSArray *musicList;

@end


@implementation MyMusicController

-(NSArray *)musicList
{
    if (!_musicList)
    {
        _musicList = [MusicModel objectArrayWithFile:@"songs.plist"];
    }
    return _musicList;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.musicList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MusicCell"];
    cell.textLabel.text = @"测试歌曲";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayViewController *playerVc = [[PlayViewController alloc]init];
    playerVc.title = @"测试歌曲";
    [self.navigationController pushViewController:playerVc animated:YES];
}

@end
