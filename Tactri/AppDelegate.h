//
//  AppDelegate.h
//  Tactri
//
//  Created by nerochiu on 2015/12/17.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ValidQueryViewController.h"//有效查詢VC
#import "ValidInfoViewController.h"//有效資訊
#import "CopyRightViewController.h" //著作權VC
#import "AboutViewController.h" //關於我
#import "PPRevealSideViewController.h" //側邊欄位
#import "JSONAPI.h" //JSONHTTPClient
#import "SVProgressHUD.h" //讀取的圈圈
#import "GlobalClass.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,PPRevealSideViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) PPRevealSideViewController *revealSideViewController;
@end

