//
//  GlobalClass.m
//  Tactri
//
//  Created by nerochiu on 2015/12/18.
//  Copyright © 2015年 Iscom. All rights reserved.
//

#import "GlobalClass.h"



@implementation GlobalClass

@synthesize someProperty;

+ (id)sharedManager {
    static GlobalClass *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    
    });
    return sharedMyManager;
}





- (id)init {
    if (self = [super init]) {
        someProperty = @"Default Property Value";
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

//全域呼叫alert
+(void)showAlertView:(NSString *)alertTitle message:(NSString *)alertMessage cancelButtonTitle:(NSString *)alertCancelBtnTitle otherButtonTitles:(NSString *)alertotherButtonTitles delegate:(id)delegate{
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:alertTitle
                                                       message:alertMessage
                                                      delegate:delegate
                                             cancelButtonTitle:alertCancelBtnTitle
                                             otherButtonTitles:alertotherButtonTitles, nil];
    [alertView show];
}



@end
