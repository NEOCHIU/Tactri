//
//  InvalidQueryViewController.m
//  Tactri
//
//  Created by nerochiu on 2015/12/21.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import "InvalidQueryViewController.h"

@interface InvalidQueryViewController ()

@end

@implementation InvalidQueryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //左上角側欄標籤
    UIImage *faceImage = [UIImage imageNamed:@"ic_nav.png"];
    UIBarButtonItem *leftBarBtn= [[UIBarButtonItem alloc]initWithImage:faceImage style:UIBarButtonItemStyleBordered target:self action:@selector(enterLeftNavication)];
    
    self.navigationItem.leftBarButtonItem = leftBarBtn;
    //初始化側邊欄
    [self.revealSideViewController setDirectionsToShowBounce:PPRevealSideDirectionBottom | PPRevealSideDirectionLeft | PPRevealSideDirectionRight | PPRevealSideDirectionTop];
}

- (void)enterLeftNavication
{

    LeftViewController *leftTableView = [[LeftViewController alloc]init];

    //初始側邊欄寬度及展開leftTableView
    [self.revealSideViewController pushViewController:leftTableView onDirection:PPRevealSideDirectionLeft withOffset:150 animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
