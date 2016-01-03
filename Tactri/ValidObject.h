//
//  ValidObject.h
//  Tactri
//
//  Created by nerochiu on 2015/12/29.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ValidObject : JSONModel

//跟據傳回JSON 的key name 給予以下的變數（大小寫有差）
@property (nonatomic) NSString *DGID;
@property (nonatomic) NSString *DID;
@property (nonatomic) NSString *PesticideNameCH;
@property (nonatomic) NSString *PesticideNameEN;
@property (nonatomic) NSString *PesticideGoodsNameCH;
@property (nonatomic) NSString *Content;
@property (nonatomic) NSString *Forms;
@property (nonatomic) NSString *Company ;
@property (nonatomic) NSString *RegistrationCertificate ;
@property (nonatomic) NSString *Source ;
@property (nonatomic) NSString *Remark ;
@property (nonatomic) NSString *Number ;
@property (nonatomic) NSString *PackageSize;
@property (nonatomic) NSString *PesticideDate;
@property (nonatomic) NSString *ValidCertificate;
@property (nonatomic) NSString *DocPages ;
@property (nonatomic) NSString *TotalDataCount;
@property (nonatomic) NSString *Company_Short;
@end
