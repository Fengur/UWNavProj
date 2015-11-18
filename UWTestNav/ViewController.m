//
//  ViewController.m
//  UWTestNav
//
//  Created by 王智超 on 15/11/17.
//  Copyright © 2015年 com.FengurDev. All rights reserved.
//

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#import "ViewController.h"
#import "AnotherViewController.h"
#import "UINavigationBar+Awesome.h"
#import "UIViewExt.h"
#define NAVBAR_CHANGE_POINT -140

#define IMAGEHEIGHT 200.0f
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate> {
    UITableView *_testTableView;
    UIImageView *_headImageView;
}

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    //状态栏白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    [self scrollViewDidScroll:_testTableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)createBackItem {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    btn.backgroundColor = [UIColor clearColor];
    [btn setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    _testTableView.delegate = nil;
    [self.navigationController.navigationBar lt_reset];
}
- (void)viewDidLoad {
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    [self createTableView];
    [self createBackItem];
    [super viewDidLoad];
}

- (void)createHeadImageView {
    _headImageView = [[UIImageView alloc] init];
    _headImageView.backgroundColor = [UIColor redColor];
    _headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test"]];
    _headImageView.contentMode = UIViewContentModeScaleToFill;
    _headImageView.frame = CGRectMake(0, -IMAGEHEIGHT, ScreenWidth, IMAGEHEIGHT);
    [_testTableView addSubview:_headImageView];
}
- (void)createTableView {
    _testTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds
                                                  style:UITableViewStylePlain];
    _testTableView.delegate = self;
    _testTableView.dataSource = self;
    _testTableView.showsVerticalScrollIndicator = NO;
    _testTableView.contentInset = UIEdgeInsetsMake(IMAGEHEIGHT, 0, 0, 0);
    _testTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_testTableView];
    [self createHeadImageView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellString = @"cellString";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:cellString];
    cell.textLabel.text = @"text";
    return cell;
}

#pragma mark - 滑动tableView事件

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    UIColor *color = [UIColor colorWithRed:0 / 255.0 green:175 / 255.0 blue:240 / 255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;

    if (offsetY < -IMAGEHEIGHT) {
        CGRect frame = _headImageView.frame;
        frame.origin.y = offsetY;
        frame.size.height = -offsetY;
        _headImageView.frame = frame;
    }

    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.navigationController.navigationBar
            lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar
            lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
