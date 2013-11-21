//
//  JSRegisterView.h
//  JS血压ipad
//
//  Created by han's mac on 11/20/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "PNColor.h"

@interface JSRegisterView : UIView
{
    UITextField *usernameTextField;
    UITextField *EmailTextField;
    UITextField *passwordTextField;
    UITextField *rePasswordTextField;
    
    UIButton *registerButton;
    UIButton *cancelButton;
    
}
@property (nonatomic) UITextField *usernameTextField;
@property (nonatomic) UITextField *EmailTextField;
@property (nonatomic) UITextField *passwordTextField;
@property (nonatomic) UITextField *rePasswordTextField;
@property (nonatomic)    UIButton *registerButton;
@property (nonatomic)    UIButton *cancelButton;

@end
