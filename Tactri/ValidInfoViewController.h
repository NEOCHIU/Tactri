//
//  ValidInfoViewController.h
//  Tactri
//
//  Created by nerochiu on 2015/12/29.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ValidObject.h"
#import "AppDelegate.h"
//#import "JSONHTTPClient.h"
@interface ValidInfoViewController : UIViewController

{
    int indexPage;//頁數
    int m;//每30筆＋1
    int cellA; //欄位1
    int cellB; //欄位2
    int cellC; //欄位3
    int i ; //網頁index
    
}


//動態陣列用來存放Json物件集合
@property (nonatomic)NSMutableArray *listObj;

//第一欄
@property (weak, nonatomic) IBOutlet UILabel *nameCHALabel;
@property (weak, nonatomic) IBOutlet UILabel *contentALabel;
@property (weak, nonatomic) IBOutlet UILabel *formsALabel;
@property (weak, nonatomic) IBOutlet UILabel *companyALabel;
@property (weak, nonatomic) IBOutlet UILabel *dateALabel;

//第二欄
@property (weak, nonatomic) IBOutlet UILabel *nameCHBLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentBLabel;
@property (weak, nonatomic) IBOutlet UILabel *formsBLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyBLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateBLabel;
//第三欄
@property (weak, nonatomic) IBOutlet UILabel *nameCHCLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentCLabel;
@property (weak, nonatomic) IBOutlet UILabel *formsCLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyCLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateCLabel;

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end
