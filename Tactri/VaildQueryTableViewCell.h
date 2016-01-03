//
//  VaildQueryTableViewCell.h
//  Tactri
//
//  Created by nerochiu on 2015/12/21.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VaildQueryTableViewCell : UITableViewCell<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
//    NSMutableArray *searchDataMuArray;
//    UIPickerView *conditionPickerView;
//    VaildQueryTableViewCell *vaildQuerryCell;
}


@property (weak, nonatomic) IBOutlet UITextField *conditionTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@end
