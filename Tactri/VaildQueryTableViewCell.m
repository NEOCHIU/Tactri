//
//  VaildQueryTableViewCell.m
//  Tactri
//
//  Created by nerochiu on 2015/12/21.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import "VaildQueryTableViewCell.h"

@implementation VaildQueryTableViewCell

- (void)viewDidLoad {
    
  
//    //搜尋條件品名
//
//    _nameTextField.delegate=self;
//    searchDataMuArray = [[NSMutableArray alloc]initWithObjects:@"農藥中文普通名",@"農藥中文商品名",@"農藥英文商品名",@"劑型",@"含量(%)",@"登記證字號",@"毒性標示",@"產品來源",nil];
//    //PickerView
//    conditionPickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, 300,150)];
//   
//    conditionPickerView.dataSource =self;
//    conditionPickerView.delegate = self;
//     _nameTextField.inputView = conditionPickerView;
//    
//    UIToolbar *toorBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 300,30)];
//    UIBarButtonItem *barItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(conditionViewDone)];
//    toorBar.items = [NSArray arrayWithObject:barItem];
//    _nameTextField.inputAccessoryView=toorBar;
//
}
//-(void)conditionViewDone
//{
//    
//    //plantPicker
//    [conditionPickerView reloadComponent:0];
//    //滾輪1
//    vaildQuerryCell.nameTextField.text = [searchDataMuArray objectAtIndex:[conditionPickerView selectedRowInComponent:0]];
//    //按下去done後隱藏鍵盤
//    [_nameTextField resignFirstResponder];
//}
//
////pickerview delegate
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
//    return 1;
//}
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
//    return  [searchDataMuArray count];
//}
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    
//    return [searchDataMuArray objectAtIndex:row];
//}



- (void)awakeFromNib {
   }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
