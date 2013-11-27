//
//  JSRegisterView.m
//  JS血压ipad
//
//  Created by han's mac on 11/20/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//
#import "JSRegisterView.h"


@implementation JSRegisterView
@synthesize usernameTextField,passwordTextField,EmailTextField,rePasswordTextField,registerButton,cancelButton;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(200, 70, 200, 35)];
        usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
        usernameTextField.placeholder = @"请输入用户名";
        usernameTextField.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
        
        EmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(200, 140, 200, 35)];
        EmailTextField.borderStyle = UITextBorderStyleRoundedRect;
        EmailTextField.placeholder = @"请输入邮箱";
        EmailTextField.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
        
        passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(200, 210, 200, 35)];
        passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
        passwordTextField.placeholder = @"请输入密码";
        passwordTextField.secureTextEntry = YES;
        passwordTextField.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
        
        rePasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(200, 280, 200, 35)];
        rePasswordTextField.borderStyle = UITextBorderStyleRoundedRect;
        rePasswordTextField.placeholder = @"确认密码";
        rePasswordTextField.secureTextEntry = YES;
        rePasswordTextField.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
        
        [self addSubview:usernameTextField];
        [self addSubview:EmailTextField];
        [self addSubview:passwordTextField];
        [self addSubview:rePasswordTextField];
        
        NSArray *titlesArray = @[@"用户名",@"邮箱",@"密码",@"确认密码"];
        for(int i=1;i<=4;i++)
        {
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70*i, 100, 35)];
            titleLabel.text = [titlesArray objectAtIndex:i-1];
            titleLabel.textColor = [UIColor colorWithCGColor:PNGreen.CGColor];
            titleLabel.backgroundColor = [UIColor clearColor];
            [self addSubview:titleLabel];
        }
        
        registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        registerButton.layer.cornerRadius =10;
        registerButton.frame = CGRectMake(100, 350, 150, 50);
        registerButton.backgroundColor = [UIColor colorWithCGColor:PNGreen.CGColor];
        [registerButton setTitle:@"注册" forState:UIControlStateNormal];
        registerButton.titleLabel.font = [UIFont systemFontOfSize:25];
        [self addSubview:registerButton];
        
        cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        cancelButton.layer.cornerRadius =10;
        cancelButton.frame = CGRectMake(300, 350, 100, 50);
        cancelButton.backgroundColor = [UIColor colorWithCGColor:PNGreen.CGColor];
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        cancelButton.titleLabel.font = [UIFont systemFontOfSize:25];
        [self addSubview:cancelButton];
        
        
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
