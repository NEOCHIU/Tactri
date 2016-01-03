//
//  AboutViewController.m
//  Tactri
//
//  Created by nerochiu on 2015/12/17.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     //左上角側欄標籤
    UIImage *faceImage = [UIImage imageNamed:@"ic_nav.png"];
    UIBarButtonItem *leftBarBtn= [[UIBarButtonItem alloc]initWithImage:faceImage style:self target:self action:@selector(enterLeftNavication)];
    
    self.navigationItem.leftBarButtonItem = leftBarBtn;
}

- (void)enterLeftNavication
{

    LeftViewController *leftTableView = [[LeftViewController alloc] init];
   
    [self.revealSideViewController pushViewController:leftTableView onDirection:PPRevealSideDirectionLeft animated:YES forceToPopPush:YES];
    
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
