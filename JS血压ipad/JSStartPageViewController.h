//
//  JSStartPageViewController.h
//  JS血压ipad
//
//  Created by han's mac on 11/18/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSLoginModel.h"
#import "JSMainViewController.h"
#import "JSRegisterView.h"
#import "PNColor.h"
#import "JSRegisterView.h"
#import "JSRegistModel.h"
#import "JSFamilyViewController.h"

#import "JSNaviMenuController.h"
@interface JSStartPageViewController : UIViewController<UITextFieldDelegate>

//@property (strong,nonatomic) UIScrollView *scrollView;
//@property (strong,nonatomic) UIPageControl *pageControl;
@property ( nonatomic) IBOutlet UIView *LoginRegisterView;

@property ( nonatomic) IBOutlet UITextField *UsernameTextField;
@property ( nonatomic) IBOutlet UITextField *PasswordTextField;





@end
