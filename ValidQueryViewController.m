//
//  ValidQueryViewController.m
//  Tactri
//
//  Created by nerochiu on 2015/12/17.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import "ValidQueryViewController.h"

@interface ValidQueryViewController ()

@end

@implementation ValidQueryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     //左上角側欄標籤
     UIImage *faceImage = [UIImage imageNamed:@"ic_nav.png"];
    UIBarButtonItem *leftBarBtn= [[UIBarButtonItem alloc]initWithImage:faceImage style:UIBarButtonItemStyleBordered target:self action:@selector(enterLeftNavication)];

    self.navigationItem.leftBarButtonItem = leftBarBtn;
 
    //初始化側邊欄
    [self.revealSideViewController setDirectionsToShowBounce:PPRevealSideDirectionBottom | PPRevealSideDirectionLeft | PPRevealSideDirectionRight | PPRevealSideDirectionTop];
    //TableView初始化
    self.conditionTableView.delegate = self;
    self.conditionTableView.dataSource = self;
    //初始化 conditonMuArray陣列
    conditonMuArray =[[NSMutableArray alloc]init];
    [conditonMuArray addObject:@"全部"];
    
    //初始化 jsonConditionMuArray陣列
    jsonConditionMuArray =[[NSMutableArray alloc]init];
    [jsonConditionMuArray addObject:@"All"];
    
    
    //搜尋條件品名
    searchDataMuArray = [[NSMutableArray alloc]initWithObjects:@"全部",@"農藥中文普通名",@"農藥中文商品名",@"農藥英文商品名",@"劑型",@"含量(%)",@"許可證字號",@"毒性標示",@"產品來源",@"廠商名稱",nil];
    //搜尋條件的毒性標示
    remarkMuArray=[[NSMutableArray alloc]initWithObjects:@"紅色",@"黃色",@"藍色",@"綠色", nil];
    //搜尋條件的許可證字號
    registMuArray=[[NSMutableArray alloc]initWithObjects:@"有效",@"無效",@"全部",nil];
    
    
    //搜尋條件品名 TO JSON
    conditionDictionary = @{@"全部":@"All",@"農藥中文普通名":@"PesticideNameCH",@"農藥中文商品名":@"PesticideGoodsNameCH",@"農藥英文商品名":@"PesticideNameEN",@"劑型":@"Forms",@"含量(%)":@"Content",@"許可證字號":@"RegistrationCertificate",@"毒性標示":@"Remark",@"產品來源":@"Source",@"廠商名稱":@"Company"};
    
    //
    //搜尋條件的許可證字號轉字典
    registDictionary = @{@"有效":@"Y",@"無效":@"N",@"全部":@""};
    
    //
    
    //移除及增加NameArry
    searchNameArray=[[NSMutableArray alloc]initWithObjects:@"",nil];
    //
    
    //conditionPickerView
    conditionPickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, 300,150)];
    conditionPickerView.tag = 1;
    conditionPickerView.dataSource =self;
    conditionPickerView.delegate = self;
    toorBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 300,30)];
    
    //remarkPickerView
    remarkPickerView =[[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, 300,150)];
    remarkPickerView.tag =2;
    remarkPickerView.dataSource =self;
    remarkPickerView.delegate = self;
    
    //registPickerView
    registPickerView =[[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, 300,150)];
    registPickerView.tag =3;
    registPickerView.dataSource =self;
    registPickerView.delegate = self;
    
}
//toolbar的done
-(void)conditionViewDone
{

   tableCell.conditionTextField.text = [searchDataMuArray objectAtIndex:[conditionPickerView selectedRowInComponent:0]];
   
    
    //判斷是否重複
    for (int i =0 ; i < conditonMuArray.count ; i++) {
    NSString *obj = [conditonMuArray objectAtIndex:i];
    if ([tableCell.conditionTextField.text  isEqual:obj])
    {
    
    [GlobalClass showAlertView:@"提示訊息" message:@"搜尋條件已重複" cancelButtonTitle:@"確定" otherButtonTitles:Nil delegate:self];
        NSLog(@"已重複");
        tableCell.conditionTextField.text = @"";
        break;
        
    }}
    
    //非重複欄位
    
    // 獲取到indexPath
    NSIndexPath *path = [self.conditionTableView indexPathForCell:tableCell];
    // 修改conditonMuArray裡的值
    [conditonMuArray replaceObjectAtIndex:path.row
                               withObject:(tableCell.conditionTextField.text == nil ? @"" : tableCell.conditionTextField.text)];
    // 修改儲存JSON裡的陣列值
     NSString *tampText = conditionDictionary[tableCell.conditionTextField.text];
    [jsonConditionMuArray replaceObjectAtIndex:path.row
                               withObject:(tampText == nil ? @"" : tampText)];
    
    //按下去done後隱藏鍵盤
     [tableCell.conditionTextField resignFirstResponder];
    
}
//毒性標示 toolbar done
-(void)remarkDone{
    tableCell.nameTextField.text = [remarkMuArray objectAtIndex:[remarkPickerView selectedRowInComponent:0]];
    
    
    //按下去done後隱藏鍵盤
    [tableCell.nameTextField resignFirstResponder];
    
}
//許可證字號 toolbar done
-(void)registkDone{
    tableCell.nameTextField.text = [registMuArray objectAtIndex:[registPickerView selectedRowInComponent:0]];
    //按下去done後隱藏鍵盤
    [tableCell.nameTextField resignFirstResponder];

    
}

//取消pickerview
-(void)cancelDone{
 [tableCell.nameTextField resignFirstResponder];
 [tableCell.conditionTextField resignFirstResponder];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    // Return the number of sections.
    
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [conditonMuArray count];
  
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *simpleTableIdentifier = @"VaildQueryTableViewCell";
   cell = (VaildQueryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"VaildQueryTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }

    //獲取cell conditionTextField delegate
    cell.conditionTextField.delegate=self;
    cell.nameTextField.delegate=self;
    cell.nameTextField.clearButtonMode = UITextFieldViewModeAlways;
    cell.nameTextField.returnKeyType=UIReturnKeyDone;
    
    cell.conditionTextField.inputView = conditionPickerView;
//    barItem =[[UIBarButtonItem alloc]initWithTitle:@"確定"style:UIBarButtonItemStyleBordered target:self action:@selector(conditionViewDone)];//Done
//    
//    barCancelItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(conditionViewDone)];//Done
//    
//    
//    toorBar.items = [NSArray arrayWithObject:barItem];
//     toorBar.items = [NSArray arrayWithObject:barCancelItem];
//    
//    cell.conditionTextField.inputAccessoryView=toorBar;
    //

    cell.conditionTextField.text = conditonMuArray[indexPath.row];
    cell.nameTextField.text = searchNameArray[indexPath.row];
  
    return cell;
}

//觸發TextField 編輯前的事件
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

//     [conditionPickerView reloadAllComponents];
    tableCell  = (VaildQueryTableViewCell *)[[[textField superview]superview]superview];
    NSLog(@"cell=%@",tableCell);
    NSLog(@"cell1=%@",tableCell.nameTextField);
    NSLog(@"cell2=%@",tableCell.conditionTextField);
    
    //判斷當conditionTextField等於毒性標示則nameTextField為pickerview顯示值,防止使用者如一開始選擇nameTextField時無法切換.
    
    if ((tableCell.nameTextField == textField)) {//當觸發為nameTextField
        
    if ([tableCell.conditionTextField.text  isEqual:@"毒性標示"]) {
        NSLog(@"前選擇毒性標示");
        tableCell.nameTextField.inputView = remarkPickerView;
        barItem =[[UIBarButtonItem alloc]initWithTitle:@"確定"style:UIBarButtonItemStyleDone target:self action:@selector(remarkDone)];
        
        UIBarButtonItem *spce = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];//中間空白處
        
        barCancelItem =[[UIBarButtonItem alloc]initWithTitle:@"取消"style:UIBarButtonSystemItemCancel target:self action:@selector(cancelDone)];
        
        toorBar.items = @[barItem,spce,barCancelItem];
        tableCell.nameTextField.inputAccessoryView=toorBar;
        
    }else if ([tableCell.conditionTextField.text isEqual:@"許可證字號"]){
        tableCell.nameTextField.inputView = registPickerView;
        barItem =[[UIBarButtonItem alloc]initWithTitle:@"確定"style:UIBarButtonItemStyleDone target:self action:@selector(registkDone)];
        
        UIBarButtonItem *spce = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];//中間空白處
        
        barCancelItem =[[UIBarButtonItem alloc]initWithTitle:@"取消"style:UIBarButtonSystemItemCancel target:self action:@selector(cancelDone)];
        
        toorBar.items = @[barItem,spce,barCancelItem];
        tableCell.nameTextField.inputAccessoryView=toorBar;
        
    }else{
        tableCell.nameTextField.text=@"";
        cell.nameTextField.inputView =nil;
        tableCell.nameTextField.inputView = nil;
    }};
    
    if (!(tableCell.nameTextField == textField)) {//當觸發不是為nameTextField
        tableCell.conditionTextField.inputView = conditionPickerView;
        barItem =[[UIBarButtonItem alloc]initWithTitle:@"確定"style:UIBarButtonItemStyleDone target:self action:@selector(conditionViewDone)];
       UIBarButtonItem *spce = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];//中間空白處
        
        barCancelItem =[[UIBarButtonItem alloc]initWithTitle:@"取消"style:UIBarButtonSystemItemCancel target:self action:@selector(cancelDone)];
        
        
        
        toorBar.items = @[barItem,spce,barCancelItem];
        
        tableCell.conditionTextField.inputAccessoryView=toorBar;
    }
   

    
   return YES;
}

//觸發TextField 編輯後的事件
- (void)textFieldDidEndEditing:(UITextField *)textField{
  
    // 獲取目前cell的indexPath
    NSIndexPath *path = [self.conditionTableView indexPathForCell:tableCell];
    
    //判斷一開始選擇conditionTextField為毒性標示則nameTextField改成pickerview顯示
    if ([tableCell.conditionTextField.text  isEqual:@"毒性標示"]) {
        NSLog(@"後選擇毒性標示");
        
        //當點擊欄位搜尋名字欄位得值修改
        //修改 毒性標示 裡的值
        [searchNameArray replaceObjectAtIndex:path.row
                                   withObject:(tableCell.nameTextField.text == nil ? @"" : tableCell.nameTextField.text)];
    }else if([tableCell.conditionTextField.text isEqual:@"許可證字號"]){
        
        //當點擊欄位搜尋名字欄位得值修改
        //修改 毒性標示 裡的值
    NSString *tampText = registDictionary[tableCell.nameTextField.text];
    [searchNameArray replaceObjectAtIndex:path.row
                                                withObject:(tampText == nil ? @"" : tampText)];
  
    }else{
    //當點擊欄位搜尋名字欄位得值修改
    // 修改searchNameArray裡的值
        //tableCell.nameTextField.text=@"";
       
    [searchNameArray replaceObjectAtIndex:path.row
                               withObject:(tableCell.nameTextField.text == nil ? @"" : tableCell.nameTextField.text)];
   
    };
    //  [_conditionTableView reloadData];
}


//點擊鍵盤return隱藏鍵盤
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//pickerview delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
   if(pickerView.tag==1)
   {
    return  [searchDataMuArray count];
       
   }else if(pickerView.tag==2){
    return [remarkMuArray count];
       
   }else if(pickerView.tag==3){
    return [registMuArray count];
   }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if(pickerView.tag==1)
    {
      return [searchDataMuArray objectAtIndex:row];
    }else if(pickerView.tag==2){
      return [remarkMuArray objectAtIndex:row];
        
    }else if(pickerView.tag==3){
      return [registMuArray objectAtIndex:row];
    }
    return 0;
}


//新增button
- (IBAction)addButton:(id)sender {
    
    //判斷取消條件時要array要小於1
    
    if ([cell.conditionTextField.text  isEqual: @""]) {
       [GlobalClass showAlertView:@"提示訊息" message:@"請輸入搜尋條件名稱" cancelButtonTitle:@"確定" otherButtonTitles:Nil delegate:self];
    }else{
    if (conditonMuArray.count <= 9) {
     //按增加新增一個空的值
    [conditonMuArray addObject:@""];
    [jsonConditionMuArray addObject:@""];
    [searchNameArray addObject:@""];
        
//確定後刪除條件的值並免重複
//    [searchDataMuArray removeObject:[searchDataMuArray objectAtIndex:[conditionPickerView selectedRowInComponent:0]]];

    [_conditionTableView reloadData];
    NSLog(@"conditonMuArray = %lu",(unsigned long)conditonMuArray.count);

    }else{
        
    [GlobalClass showAlertView:@"提示訊息" message:@"已達到搜尋條件最大值" cancelButtonTitle:@"確定" otherButtonTitles:Nil delegate:self];
        NSLog(@"大於8");
    }
    }
}

//移除的button
- (IBAction)removeButton:(id)sender {
    
    //判斷取消條件時要array要大於1,保留最後一欄位（重最後一欄開始刪除）
    if (conditonMuArray.count > 1) {
        
        //如已點選conditionTextField又沒編輯,直接刪除會錯誤,因此加入這段
        [self textFieldDidEndEditing:tableCell.conditionTextField];
        
      //  [self textFieldDidEndEditing:tableCell.nameTextField];
        
        [conditonMuArray removeObjectAtIndex:[conditonMuArray count]-1];//conditon顯示cell欄位 陣列
        [jsonConditionMuArray removeObjectAtIndex:[jsonConditionMuArray count]-1];//條件欄位 陣列
        [searchNameArray removeObjectAtIndex:[searchNameArray count]-1];//name cell欄位陣列
        
        
        [_conditionTableView reloadData];
        NSLog(@"[conditonMuArray count]=%lu",(unsigned long)[conditonMuArray count]);
    }else{
        NSLog(@"低於0");
    }
    
 
    
}

//搜尋button
- (IBAction)queryButton:(id)sender {
    
    if ([cell.conditionTextField.text  isEqual: @""]) {
        
        [GlobalClass showAlertView:@"提示訊息" message:@"請至少輸入一項搜尋條件!!" cancelButtonTitle:@"確定" otherButtonTitles:Nil delegate:self];
    }
    
    for (int i = 0; i <jsonConditionMuArray.count; i++) {
        NSLog(@"搜尋條件：%@",[jsonConditionMuArray objectAtIndex:i]);
        NSLog(@"搜尋名字：%@",[searchNameArray objectAtIndex:i]);
        
        
        ValidInfoViewController *validInfoVC =[[ValidInfoViewController alloc]initWithNibName:@"ValidInfoViewController" bundle:nil];
        UINavigationController *navvalidInfoVC = [[UINavigationController alloc] initWithRootViewController:validInfoVC];
        
        [self presentViewController:navvalidInfoVC animated:YES completion:nil];
        
     //   [self.navigationController pushViewController:validInfoVC animated:YES];
//        [self.navigationController popViewControllerAnimated:YES];
        
//         [self.revealSideViewController popViewControllerWithNewCenterController:validInfoVC animated:YES];
    
    }

    
    
}
//側欄
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
