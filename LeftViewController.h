//
//  LeftViewController.h
//  Tactri
//
//  Created by nerochiu on 2015/12/17.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ValidQueryViewController.h"//有效查詢VC
#import "InvalidQueryViewController.h" ////無效查詢VC
#import "CopyRightViewController.h" //著作權VC
#import "AboutViewController.h" //關於我
#import "PPRevealSideViewController.h"

@interface LeftViewController : UIViewController<UITableViewDelegate , UITableViewDataSource>


@property (nonatomic, strong) PPRevealSideViewController *revealSideViewController;

@end
