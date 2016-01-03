//
//  LeftViewController.m
//  Tactri
//
//  Created by nerochiu on 2015/12/17.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height - 50)];
    [leftTableView setDelegate:self];
    [leftTableView setDataSource:self];
    [self.view addSubview:leftTableView];
    [leftTableView setBackgroundColor:[UIColor whiteColor]];
    leftTableView.tableFooterView = [self creatTableFooterView];
     self.navigationItem.title = @"農毒所";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self getImageArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    if (cell == Nil) {
        cell = [[UITableViewCell alloc] init];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 26, 26)];
        [imageView setImage:[[self getImageArray] objectAtIndex:[indexPath row]]];
        [cell addSubview:imageView];
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];

    UIViewController *controller;
    
        if (row == 0) {
            ValidQueryViewController *validQueryVC =[[ValidQueryViewController alloc]initWithNibName:@"ValidQueryViewController" bundle:nil];
            controller = validQueryVC;
        }
        if (row == 1) {
             InvalidQueryViewController *invalidQuery =[[InvalidQueryViewController alloc]initWithNibName:@"InvalidQueryViewController" bundle:nil];
            controller = invalidQuery;
        }
        if (row == 2) {
            
            InvalidQueryViewController *invalidQuery =[[InvalidQueryViewController alloc]initWithNibName:@"InvalidQueryViewController" bundle:nil];
            controller = invalidQuery;
        }
        if (row == 3) {
            InvalidQueryViewController *invalidQuery =[[InvalidQueryViewController alloc]initWithNibName:@"InvalidQueryViewController" bundle:nil];
            controller = invalidQuery;
        }

    //每次換頁都需生成tabbar(只需改變以有效 無效等4大功能頁面轉換)
    CopyRightViewController *copyRightVC =[[CopyRightViewController alloc]initWithNibName:@"CopyRightViewController" bundle:nil];
    AboutViewController *aboutVC =[[AboutViewController alloc]initWithNibName:@"AboutViewController" bundle:nil];
    
    UINavigationController *navLeftVC = [[UINavigationController alloc] initWithRootViewController:controller];
    
    UINavigationController *navCopyRight = [[UINavigationController alloc]initWithRootViewController:copyRightVC];
    UINavigationController *navAbout = [[UINavigationController alloc]initWithRootViewController:aboutVC];
    
    //tabBar 生成
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[navLeftVC,navAbout,navCopyRight];
    
    //tabBar 名稱
    [navLeftVC.tabBarItem setTitle:@"首頁"];
    [navAbout.tabBarItem setTitle:@"關於我"];
    [navCopyRight.tabBarItem setTitle:@"著作權"];


    
   [self.revealSideViewController popViewControllerWithNewCenterController:tabBarController animated:YES];
   
    PP_RELEASE(controller);
    PP_RELEASE(navLeftVC);
    PP_RELEASE(navAbout);
    PP_RELEASE(navCopyRight);
    PP_RELEASE(copyRightVC);
    PP_RELEASE(aboutVC);
    PP_RELEASE(tabBarController);
   
}



-(UIView *)creatTableFooterView{
    UIView *tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 2)];
    [tableFooterView setBackgroundColor:[UIColor whiteColor]];
    return tableFooterView;
}
#pragma mark - Table view hight
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //hight
    //    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    //    return cell.frame.size.height;
    return 50;
}

-(NSArray *)getImageArray{
    NSArray *imageArray;
#pragma mark - 左側圖標

        imageArray = [[NSArray alloc]initWithObjects:
                      [UIImage imageNamed:@"nav_hat.png"],
                      [UIImage imageNamed:@"nav_hat.png"],
                      [UIImage imageNamed:@"nav_hat.png"],
                      [UIImage imageNamed:@"nav_hat.png"],
                      nil];
       return imageArray;
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
