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


@property (nonatomic,strong) UIButton* leftBtn;
@property (nonatomic,strong) UIButton* rightBtn;
@property (nonatomic,strong) UIImageView* crossView;

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
    
    
    // 下端阴影
    UIImageView *crossView = [[UIImageView alloc]init];
    [crossView setImage:[UIImage imageNamed:@"cm2_play_crossline"]];
    self.crossView = crossView;
    
    [self addSubview:leftBtn];
    [self addSubview:rightBtn];
    [self addSubview:title];
    [self addSubview:singer];
    [self addSubview:crossView];
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
    

    
    self.crossView.x = 0;
    self.crossView.height = self.crossView.image.size.height;
    self.crossView.width = ScreenWidth;
    self.crossView.y = self.height - self.crossView.height;
}

@end
