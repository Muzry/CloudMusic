//
//  PlayTabBar.m
//  CloudMusic
//
//  Created by LiDan on 15/12/10.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayTabBar.h"
#import "UIView+Extension.h"
#import "CloudMusic.pch"


@interface PlayTabBar()

@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UILabel *singer;
@property (nonatomic,weak) UIButton* leftBtn;
@property (nonatomic,weak) UIButton* rightBtn;


@end

@implementation PlayTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

-(void)setSongName:(NSString *)songName
{
    self.title.text = songName;
    _songName = songName;
}

-(void)setSingerName:(NSString *)singerName
{
    self.singer.text = singerName;
    _singerName = singerName;
}

-(void)setup
{
    // 左边点击按钮
    UIButton *leftBtn = [[UIButton alloc]init];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"cm2_topbar_icn_back"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.leftBtn = leftBtn;
    
    //右边点击按钮
    UIButton *rightBtn = [[UIButton alloc]init];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"cm2_topbar_icn_share"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn = rightBtn;
    
    //歌曲名
    UILabel *title = [[UILabel alloc]init];
    title.text = @"测试歌曲";
    title.textColor = [UIColor whiteColor];
    self.title = title;
    
    // 演唱者
    UILabel *singer = [[UILabel alloc]init];
    singer.text = @"演唱者";
    singer.textColor = title.textColor = [UIColor whiteColor];
    singer.font = [UIFont systemFontOfSize:12];
    self.singer = singer;

    
    [self addSubview:leftBtn];
    [self addSubview:rightBtn];
    [self addSubview:title];
    [self addSubview:singer];

}

-(void)back
{
    [[self superViewController].navigationController popViewControllerAnimated:YES];
    [self superViewController].navigationController.navigationBarHidden = NO;
}

-(void)share
{
    NSLog(@"分享");
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.leftBtn.size = self.leftBtn.currentBackgroundImage.size;
    self.leftBtn.x = 10;
    self.leftBtn.y = 30;
    
    self.rightBtn.size = self.rightBtn.currentBackgroundImage.size;
    self.rightBtn.x = ScreenWidth - self.rightBtn.width - 10;
    self.rightBtn.y = self.leftBtn.y;
    
    self.title.width = 70;
    self.title.height = 10;
    self.title.x = (ScreenWidth - self.title.width) / 2;
    
    self.title.y = self.rightBtn.y;
    
    self.singer.width = 40;
    self.singer.x = (ScreenWidth - self.singer.width) / 2;
    self.singer.height = 8;
    self.singer.y =  self.title.y + self.title.height + 10;

}



@end
