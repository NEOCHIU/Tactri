//
//  GlobalClass.h
//  Tactri
//
//  Created by nerochiu on 2015/12/18.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPRevealSideViewController.h"
#import "LeftViewController.h"
@interface GlobalClass : NSObject{
     NSString *someProperty;
}
@property (nonatomic, retain) NSString *someProperty;

+ (id)sharedManager;

//alert
+(void)showAlertView:(NSString *)alertTitle message:(NSString *)alertMessage cancelButtonTitle:(NSString *)alertCancelBtnTitle otherButtonTitles:(NSString *)alertotherButtonTitles delegate:(id)delegate;
@end
