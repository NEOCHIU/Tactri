//
//  ValidQueryViewController.h
//  Tactri
//
//  Created by nerochiu on 2015/12/17.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"
#import "GlobalClass.h"
#import "VaildQueryTableViewCell.h"
#import "ValidInfoViewController.h"
#import "PPRevealSideViewController.h"

#import "AppDelegate.h"
@interface ValidQueryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSMutableArray *conditonMuArray;//搜尋條件的array (cell值固定)
    NSMutableArray *searchDataMuArray;//PickerView data
    NSMutableArray *remarkMuArray;//搜尋條件的毒性標示 array
    NSMutableArray *registMuArray;//搜尋條件的許可證字號 array
    
    NSMutableArray *searchNameArray;//搜尋條件的name array
    NSDictionary *conditionDictionary;// 對應JSON條件值
    NSMutableArray *jsonConditionMuArray;//JSON key name;
    NSDictionary *registDictionary; //許可證字號 字典
    
    UIPickerView *conditionPickerView;//條件名稱
    UIPickerView *remarkPickerView;//毒性標示
    UIPickerView *registPickerView;//許可證字號
    
    
    BOOL remarkBool;
    
    VaildQueryTableViewCell *tableCell;
    VaildQueryTableViewCell *cell;
    UIBarButtonItem *barItem;
    UIBarButtonItem *barCancelItem;
    UIToolbar *toorBar;


}
@property (weak, nonatomic) IBOutlet UITableView *conditionTableView;

@property (nonatomic, weak)   UITextField    *tmpTextField; // 獲取當前編輯的TextField

@end
