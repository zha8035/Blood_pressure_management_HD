//
//  JSStartPageViewController.m
//  JS血压ipad
//
//  Created by han's mac on 11/18/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import "JSStartPageViewController.h"

@interface JSStartPageViewController ()
{
    BOOL keyboardShowedOrNot;
    BOOL isEditingNow;
    CGRect startFrame;
    
    JSRegisterView *registerView;
}

@end

@implementation JSStartPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        _LoginRegisterView.layer.cornerRadius = 10;
    
    keyboardShowedOrNot = NO;
    isEditingNow = NO;
    startFrame = _LoginRegisterView.frame;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardHideButtonTouched)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    

    //self.view.backgroundColor = [UIColor grayColor];
	// Do any additional setup after loading the view.
}
/*
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat pageWidth = _scrollView.frame.size.width;
    
    //函数名： floor  功 能： 返回小于或者等于指定表达式的最大整数
    //函数名： ceil  功 能： 返回大于或者等于指定表达式的最小整数
    int page = floor((_scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1;
    _pageControl.currentPage = page;
 
    
}
 */
- (IBAction)Login:(id)sender {
    JSLoginModel *loginModel = [[JSLoginModel alloc] init];
    BOOL test = [self loginValueProof];
    if(test)
    {
    loginModel.username = _UsernameTextField.text;
    loginModel.password = _PasswordTextField.text;
    [loginModel login];
    if(loginModel.status)
    {
//        JSTabMenuBarController *tabController =[[JSTabMenuBarController alloc] init];
//        JSMainViewController *mainView = [[JSMainViewController alloc] init];
//        tabController.viewControllers = [NSArray arrayWithObjects:mainView, nil];
//        tabController.tabBar.hidden = YES;
//        [self presentViewController:tabController animated:YES completion:nil];
        JSMainViewController *mainView = [[JSMainViewController alloc] init];
        JSNaviMenuController *navItemController = [[JSNaviMenuController alloc] initWithRootViewController:mainView];
        [self presentViewController:navItemController animated:YES completion:nil];
        
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败"
                                                         message:@"用户名或密码错误"
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败"
                                                            message:@"用户名或密码不能为空"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
        [alertView show];
        
    }
}
- (BOOL)loginValueProof
{
    if(_UsernameTextField.text.length==0||_PasswordTextField.text.length==0)
    {
        return NO;
    }
    else
    {
    return YES;
    }
}

- (IBAction)register:(id)sender {
    [_UsernameTextField resignFirstResponder];
    [_PasswordTextField resignFirstResponder];
    keyboardShowedOrNot = NO;

    registerView = [[JSRegisterView alloc] init];
    registerView.frame = CGRectMake(262, 0, 500, 768);
    //registerView.alpha = 0.8;
    //registerView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
    registerView.backgroundColor = [UIColor clearColor];
    registerView.alpha = 0;
    [self.view addSubview:registerView];
    [UIView animateWithDuration:0.15 animations:^{
        registerView.alpha = 1;
    }];
    [self loginRegisterViewHideAnimate];
    [registerView.registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [registerView.cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)registerButtonClick
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"错误信息"
                                                        message:@""
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
    BOOL alertShowOrNot = YES;
    if(registerView.usernameTextField.text.length == 0)
    {
        alertView.message = @"用户名不能为空";
    }
    else
    {
        if(registerView.EmailTextField.text.length == 0)
        {
            alertView.message = @"邮箱地址不能为空";
        }
        else
        {
            if(registerView.passwordTextField.text.length == 0)
            {
                alertView.message = @"密码不能为空";
            }
            else
            {
                if(![registerView.passwordTextField.text isEqualToString:registerView.rePasswordTextField.text])
                {
                    alertView.message = @"密码不一致";
                      registerView.passwordTextField.text = @"";
                    registerView.rePasswordTextField.text = @"";
                    
                    
                }
                else
                {
                    alertShowOrNot = NO;
                    
                }
            }
        }
    }
    if(alertShowOrNot)
    {
    [alertView show];
    }
}

- (void)cancelButtonClick
{
    [UIView animateWithDuration:0.15 animations:^{
        registerView.alpha = 0;
        _LoginRegisterView.alpha =1;
    } completion:^(BOOL finished) {
        [registerView removeFromSuperview];
    }];
    
}


- (IBAction)editingDidBegin:(UITextField *)sender {
    
    
    CGRect frame = _LoginRegisterView.frame;
    if(keyboardShowedOrNot == NO)
    {
    frame.origin.y-=350;
    [UIView animateWithDuration:0.15 animations:^{
        _LoginRegisterView.frame=frame;
    } completion:^(BOOL finished) {
        
    }];
        keyboardShowedOrNot = YES;
        
    }
}

- (IBAction)editingDidEnd:(UITextField *)sender
{
    
    
    
    if(keyboardShowedOrNot)
    {
    CGRect frame = _LoginRegisterView.frame;
    frame.origin.y+=350;
    [UIView animateWithDuration:0.2 animations:^{
        _LoginRegisterView.frame=frame;
    } completion:^(BOOL finished) {
        
    }];
        keyboardShowedOrNot = NO;
    }

}

- (IBAction)keyboardHideButtonTouched
{
   
    if(keyboardShowedOrNot)
    {
        CGRect frame = _LoginRegisterView.frame;
        frame.origin.y+=350;
        [UIView animateWithDuration:0.2 animations:^{
            _LoginRegisterView.frame=frame;
        } completion:^(BOOL finished) {
            
        }];
        keyboardShowedOrNot = NO;
    }

}

- (void)loginRegisterViewHideAnimate
{
    [UIView animateWithDuration:0.3 animations:^{
        _LoginRegisterView.alpha = 0;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
