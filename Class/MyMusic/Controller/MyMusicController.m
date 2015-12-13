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

@property (nonatomic,strong) NSArray *musicList;

@end


@implementation MyMusicController

-(NSArray *)musicList
{
    if (!_musicList)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"songs" ofType:@"plist"];
        _musicList = [MusicModel objectArrayWithFile:path];
    }
    return _musicList;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.musicList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MusicCell * cell = [MusicCell musicCellWithTableView:tableView];
    cell.music = self.musicList[indexPath.row];
    cell.num = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MusicModel *music = self.musicList[indexPath.row];
    PlayViewController *playerVc = [[PlayViewController alloc]init];
    playerVc.music = music;
    [self.navigationController pushViewController:playerVc animated:YES];
}

@end
