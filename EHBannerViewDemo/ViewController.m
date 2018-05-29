//
//  ViewController.m
//  YCBannerViewDemo
//
//  Created by 岳琛 on 2018/5/28.
//  Copyright © 2018年 KMF-Engineering. All rights reserved.
//

#import "ViewController.h"
#import "EHBannerView.h"

@interface ViewController ()<EHBannerViewDelegate>

@property (strong, nonatomic) EHBannerView *bannerView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *arr = @[ @"http://pic39.nipic.com/20140226/18071023_162553457000_2.jpg",//网络图片
                      [UIImage imageNamed:@"1.jpg"],//本地图片，传image，不能传名称
                      @"http://photo.l99.com/source/11/1330351552722_cxn26e.gif",//网络gif图片
                      gifImageNamed(@"2.gif")//本地gif使用gifImageNamed(name)函数创建
                     ];

    NSArray * titleArr = @[@"网图", @"JPG", @"网络动态图", @"GIF"];
    
    _bannerView = [[EHBannerView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 180)];
    _bannerView.delegate = self;
    _bannerView.placeholderImage = [UIImage imageNamed:@"placeholderImage.jpg"];
    _bannerView.imageArray = arr;
    _bannerView.describeArray = titleArr;
    _bannerView.time = 3;
    [_bannerView setPageImage:[UIImage imageNamed:@"other"] andCurrentPageImage:[UIImage imageNamed:@"current"]];
    _bannerView.pagePosition = PositionBottomRight;
    _bannerView.gifPlayMode = GifPlayModePauseWhenScroll;
    [self.view addSubview:_bannerView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [EHBannerView clearDiskCache];
}

#pragma mark XRCarouselViewDelegate
- (void)carouselView:(EHBannerView *)carouselView clickImageAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%ld张图片", index);
}

@end
