//
//  RootViewController.m
//  UWTestNav
//
//  Created by 王智超 on 15/11/17.
//  Copyright © 2015年 com.FengurDev. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
#import "AnotherViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController


- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"test"]];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor blueColor];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"1" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(push1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(btn.frame.origin.x, btn.frame.origin.y+80, 50, 50)];
    btn1.backgroundColor = [UIColor blueColor];
    btn1.layer.cornerRadius = 5;
    btn1.layer.masksToBounds = YES;
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 setTitle:@"2" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(push2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    [super viewDidLoad];
}


- (void)push1
{
    ViewController *vc1 = [[ViewController alloc]init];
    [self.navigationController pushViewController:vc1 animated:YES];
}

- (void)push2
{
    AnotherViewController *vc2 = [[AnotherViewController alloc]init];
    [self.navigationController pushViewController:vc2 animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillDisappear:(BOOL)animated
{
        [self.navigationController setNavigationBarHidden:NO];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
