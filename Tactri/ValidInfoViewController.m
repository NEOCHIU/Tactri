//
//  ValidInfoViewController.m
//  Tactri
//
//  Created by nerochiu on 2015/12/29.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import "ValidInfoViewController.h"

@interface ValidInfoViewController ()

@end

@implementation ValidInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化
    indexPage = 0;
    m=0;
    [self jsonModel];
    //初始化Listobj物件
    _listObj = [[NSMutableArray alloc]init];

}


-(void)jsonModel{
    
//    NSDictionary *val = @{@"PesticideNameCH":@"培丹"};
//    NSArray *innerParameter = @[val];
    NSDictionary *parameter =@{@"PesticideNameCH":@"培丹"};
    NSError * err;
    NSData * paramsData = [NSJSONSerialization dataWithJSONObject:parameter options:0 error:&err];
    NSString *params = [[NSString alloc] initWithData:paramsData encoding:NSUTF8StringEncoding];

    params =[params stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

//    NSString *urlString=[NSString stringWithFormat: @"http://service.iscom.com.tw:7002/AJAX/GetData_Pesticide?PageCount=30&PageIndex=1&QryString=[{\"PesticideNameCH\":\"培丹\"}]"];
//    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    
     NSString *urlString=[NSString stringWithFormat:@"http://service.iscom.com.tw:7002/AJAX/GetData_Pesticide?PageCount=30&PageIndex=%d&QryString=[%@]",i,params];
    
    NSLog(@"urlString-%@",urlString);
    
//連線狀況判斷
    [JSONHTTPClient postJSONFromURLWithString:urlString params:nil completion:^(NSDictionary *json, JSONModelError *err) {
        if(err == nil)
        {
            NSLog(@"連線成功");
            [SVProgressHUD showWithStatus:@"讀取資料中..." maskType:SVProgressHUDMaskTypeClear ];
            [SVProgressHUD setBackgroundColor:[UIColor whiteColor]];
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSURL *url =[NSURL URLWithString:urlString];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            
            //取得Json資訊
            NSArray* jsonobj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            

            // _ListInfoObj = [[NSMutableArray alloc]init];
            //迭代出NSArray裡面的所有值，轉成物件後，存放到NSMutableArray裡面
            [jsonobj enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
                
                NSDictionary* jsonArray = [jsonobj objectAtIndex:idx];
                NSLog(@"array1:%@",jsonArray);
                
                ValidObject *product = [[ValidObject alloc] initWithDictionary:jsonArray error:nil];
                NSLog(@"product=%@",product);
    
                [_listObj addObject:product];
              
        NSLog(@"_listObjCount=%lu",(unsigned long)_listObj.count);
        
                
            }];
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    if (indexPage == 0) {
                    cellA = (m*30 + ((indexPage*3)+1));
                    NSLog(@"cellA=%d",cellA);
                    cellB = (m*30 + ((indexPage*3)+2));
                    NSLog(@"cellA=%d",cellB);
                    cellC = (m*30 + ((indexPage*3)+3));
                    NSLog(@"cellA=%d",cellC);
                    
                    NSLog(@"_listObj=%@",_listObj);
                    ValidObject *validObjectA = [_listObj objectAtIndex:cellA];
                    ValidObject *validObjectB = [_listObj objectAtIndex:cellB];
                    ValidObject *validObjectC = [_listObj objectAtIndex:cellC];
                    
                    //第一欄
                    self.nameCHALabel.text = validObjectA.PesticideNameCH;
                    self.contentALabel.text = validObjectA.Content;
                    self.formsALabel.text = validObjectA.Forms;
                    self.companyALabel.text = validObjectA.Company;
                    self.dateALabel.text = validObjectA.PesticideDate;
                    //第二欄
                    self.nameCHBLabel.text = validObjectB.PesticideNameCH;
                    self.contentBLabel.text = validObjectB.Content;
                    self.formsBLabel.text = validObjectB.Forms;
                    self.companyBLabel.text = validObjectB.Company;
                    self.dateBLabel.text = validObjectB.PesticideDate;
                    //第三欄
                    self.nameCHCLabel.text = validObjectC.PesticideNameCH;
                    self.contentCLabel.text = validObjectC.Content;
                    self.formsCLabel.text = validObjectC.Forms;
                    self.companyCLabel.text = validObjectC.Company;
                    self.dateCLabel.text = validObjectC.PesticideDate;
                    }
                    [SVProgressHUD dismiss]; //圈圈結束
                });
          
            
            });
            
            
            
        }else{
             NSLog(@"連線失敗");
             [GlobalClass showAlertView:@"連線訊息" message:@"請檢查網路狀態" cancelButtonTitle:@"確定" otherButtonTitles:Nil delegate:self];
              [SVProgressHUD dismiss]; //圈圈結束
        }
        
                                       
        }];
    

}

-(void)appear{
    
}

- (IBAction)topPageButton:(id)sender {
    
    
}
- (IBAction)previouspageButton:(id)sender {
    
    indexPage--;
    NSLog(@"上一頁indexPage=%d",indexPage);
}
- (IBAction)nextPageButton:(id)sender {
    
      NSLog(@"上一個indexPage=%d",indexPage);
    
    if(indexPage ==6){
        NSLog(@"indexPage目前為6");
          NSLog(@"_listObjCount=%lu",(unsigned long)_listObj.count);
         i++; //每次進入＋1
        [self jsonModel];
        
    }else if (indexPage ==9){
        
        NSLog(@"indexPage目前為9");
        indexPage = 0;
        m++;
    }


    if (indexPage <= 9) {
    indexPage++;
    NSLog(@"(＋)現在indexPage=%d",indexPage);
        
    cellA = (m*30 + ((indexPage*3)+1));
    NSLog(@"cellA=%d",cellA);
    cellB = (m*30 + ((indexPage*3)+2));
    NSLog(@"cellA=%d",cellB);
    cellC = (m*30 + ((indexPage*3)+3));
    NSLog(@"cellA=%d",cellC);
        
    ValidObject *validObjectA = [_listObj objectAtIndex:cellA];
    ValidObject *validObjectB = [_listObj objectAtIndex:cellA];
    ValidObject *validObjectC = [_listObj objectAtIndex:cellA];
        //第一欄
        self.nameCHALabel.text = validObjectA.PesticideNameCH;
        self.contentALabel.text = validObjectA.Content;
        self.formsALabel.text = validObjectA.Forms;
        self.companyALabel.text = validObjectA.Company;
        self.dateALabel.text = validObjectA.PesticideDate;
        //第二欄
        self.nameCHBLabel.text = validObjectB.PesticideNameCH;
        self.contentBLabel.text = validObjectB.Content;
        self.formsBLabel.text = validObjectB.Forms;
        self.companyBLabel.text = validObjectB.Company;
        self.dateBLabel.text = validObjectB.PesticideDate;
        //第三欄
        self.nameCHCLabel.text = validObjectC.PesticideNameCH;
        self.contentCLabel.text = validObjectC.Content;
        self.formsCLabel.text = validObjectC.Forms;
        self.companyCLabel.text = validObjectC.Company;
        self.dateCLabel.text = validObjectC.PesticideDate;
        
    }
}

- (IBAction)endPageButton:(id)sender {
    
    
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
