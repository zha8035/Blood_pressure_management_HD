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

#import "JSNaviMenuController.h"
@interface JSStartPageViewController : UIViewController//<UIScrollViewAccessibilityDelegate,UIScrollViewDelegate>

//@property (strong,nonatomic) UIScrollView *scrollView;
//@property (strong,nonatomic) UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIView *LoginRegisterView;

@property (weak, nonatomic) IBOutlet UITextField *UsernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordTextField;

- (IBAction)editingDidBegin:(UITextField *)sender;
- (IBAction)editingDidEnd:(UITextField *)sender;
- (IBAction)keyboardHideButtonTouched;
@end
