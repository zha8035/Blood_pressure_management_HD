//
//  JSAddFamilyViewController.m
//  JS血压ipad
//
//  Created by han's mac on 11/21/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import "JSAddFamilyViewController.h"
#import "PNColor.h"
#import "JSlocalSaveAndRead.h"
@interface JSAddFamilyViewController ()

@end

@implementation JSAddFamilyViewController
@synthesize memberInfoDict,nameField,ageField,genderField,heightField,weightField,headImageButton;
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
    
    viewFrameChanged = NO;
    headPickerShow = NO;
    headImageName = @"headImage0";
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"viewbg.png"]];
    
    CALayer *whiteBlock = [[CALayer alloc] init];
    whiteBlock.backgroundColor =[UIColor whiteColor].CGColor;
    whiteBlock.frame = CGRectMake(0, 0, 1024, 64);
    [self.view.layer addSublayer:whiteBlock];
    
    
    CALayer *headImageBg = [[CALayer alloc] init];
    headImageBg.frame = CGRectMake(100, 180, 150, 150);
    headImageBg.cornerRadius = 75;
    headImageBg.backgroundColor = [UIColor whiteColor].CGColor;
    headImageBg.borderWidth = 5;
    headImageBg.borderColor = PNGreen.CGColor;
    [self.view.layer addSublayer:headImageBg];
    
    
    
    NSArray *titles =@[@"姓名",@"性别",@"年龄",@"身高",@"体重"];
    for(int i = 0 ;i<=4;i++)
    {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(500-100, 120+70*i, 100, 35)];
        titleLabel.text = [titles objectAtIndex:i];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:20];
        [self.view addSubview:titleLabel];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    //headerImagePicker init
    headImagePickerView = [[UIScrollView alloc] init];
    headImagePickerView.frame = CGRectMake(0, 768, 1024-200, 150);
    headImagePickerView.contentSize = CGSizeMake(125*7+25, 150);
    headImagePickerView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:headImagePickerView];
    
    for(int j=0;j<=6;j++)
    {
        CALayer *layer = [[CALayer alloc] init];
        layer.frame = CGRectMake(25+125*j, 25, 100, 100);
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.cornerRadius = 50;
        layer.borderWidth = 2;
        layer.borderColor = PNGreen.CGColor;
        
        [headImagePickerView.layer addSublayer:layer];
        
        UIButton *selectButton = [[UIButton alloc] init];
        selectButton.frame = CGRectMake(25+10+125*j, 35, 80, 80);
        selectButton.layer.cornerRadius = 40;
        selectButton.tag = j;
        [selectButton addTarget:self action:@selector(selectHeadImage:) forControlEvents:UIControlEventTouchUpInside];
        [selectButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"headImage%i",j]] forState:UIControlStateNormal];
        [headImagePickerView addSubview:selectButton];
        
    }
    
    
    
    UITapGestureRecognizer *selfViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    [self.view addGestureRecognizer:selfViewTap];
	// Do any additional setup after loading the view.
}
- (void)makeChange
{
    nameField = [[UITextField alloc] initWithFrame:CGRectMake(500, 120, 200, 35)];
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    nameField.placeholder = @"请输入家庭成员姓名";
    nameField.delegate = self;
    [self.view addSubview:nameField];
    
    genderField = [[UITextField alloc] initWithFrame: CGRectMake(500, 190, 200, 35)];
    genderField.borderStyle = UITextBorderStyleRoundedRect;
    genderField.placeholder = @"请选择性别";
    genderField.delegate = self;
    [self.view addSubview:genderField];
    
    ageField = [[UITextField alloc] initWithFrame:CGRectMake(500, 260, 200, 35)];
    ageField.borderStyle = UITextBorderStyleRoundedRect;
    ageField.placeholder = @"请输入年龄";
    ageField.delegate = self;
    [self.view addSubview:ageField];
    
    heightField = [[UITextField alloc] initWithFrame:CGRectMake(500, 330, 200, 35)];
    heightField.borderStyle = UITextBorderStyleRoundedRect;
    heightField.placeholder = @"请输入身高";
    heightField.delegate = self;
    [self.view addSubview:heightField];
    
    weightField = [[UITextField alloc] initWithFrame:CGRectMake(500, 400, 200, 35)];
    weightField.borderStyle = UITextBorderStyleRoundedRect;
    weightField.placeholder = @"请输入体重";
    weightField.delegate = self;
    [self.view addSubview:weightField];
    
    UIButton *submitButton = [[UIButton alloc] initWithFrame:CGRectMake(300, 500, 200, 60)];
    submitButton.backgroundColor = [UIColor colorWithCGColor:PNGreen.CGColor];
    submitButton.layer.cornerRadius = 5;
    [submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitButton];
    
    headImageButton = [[UIButton alloc] initWithFrame:CGRectMake(115, 195, 120, 120)];
    
    headImageButton.layer.cornerRadius = 60;
    [headImageButton setBackgroundImage:[UIImage imageNamed:@"headImage0" ] forState:UIControlStateNormal];
    [headImageButton addTarget:self action:@selector(pickHeadImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:headImageButton];

    if(memberInfoDict)
    {
    NSString *name = [memberInfoDict objectForKey:@"name"];
    NSString *age = [memberInfoDict objectForKey:@"age"];
    NSString *gender = [memberInfoDict objectForKey:@"gender"];
    NSString *height = [memberInfoDict objectForKey:@"height"];
    NSString *weight = [memberInfoDict objectForKey:@"weight"];
    NSString *headImageStr = [memberInfoDict objectForKey:@"image"];
    nameField.text = name;
    ageField.text = age;
    genderField.text = gender;
    heightField.text =height;
    weightField.text = weight;
    [headImageButton setBackgroundImage:[UIImage imageNamed:headImageStr] forState:UIControlStateNormal];
    }
}

- (void)submit
{
    BOOL filled = YES;
    if(nameField.text.length==0||ageField.text.length==0||genderField.text.length==0||heightField.text.length==0||weightField.text.length==0)
    {
        filled = NO;
    }
   if(!filled)
    {
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"出错啦"
                                                           message:@"请把表格填满"
                                                          delegate:self
                                                 cancelButtonTitle:@"我知道了"
                                                 otherButtonTitles:nil, nil];
        alerView.delegate=nil;
        [alerView show];
    }
    else
    {
        NSDictionary *infoDict = @{@"name": nameField.text,@"age":ageField.text,@"gender":genderField.text,@"height":heightField.text,@"weight":weightField.text,@"image":headImageName};
        JSlocalSaveAndRead *saveReadModel = [[JSlocalSaveAndRead alloc] init];
        [saveReadModel saveNewFamilyMember:infoDict :nameField.text];
        [self.delegate reloadData];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField.frame.origin.y>300&&viewFrameChanged == NO)
    {
        CGRect frame = self.view.frame;
        frame.origin.y-=70;
        [UIView animateWithDuration:0.15 animations:^{
            self.view.frame = frame;
        }];
        viewFrameChanged = YES;
    }
    if(textField.frame.origin.y<150&&viewFrameChanged == YES)
    {
        CGRect frame = self.view.frame;
        frame.origin.y+=70;
        [UIView animateWithDuration:0.15 animations:^{
            self.view.frame = frame;
        }];
        viewFrameChanged = NO;
    }
    if(textField == genderField)
    {
        for(UITextField *field in[self.view subviews])
        {
            [field resignFirstResponder];
        }

        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"您的性别"
                                                           message:@""
                                                          delegate:self
                                                 cancelButtonTitle:@"男"
                                                 otherButtonTitles:@"女", nil];
        alerView.delegate=self;
        [alerView show];
        
        
    }
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(buttonIndex==0)
    {
        genderField.text = @"男";
    }
    else
    {
        genderField.text = @"女";
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(viewFrameChanged)
    {
        CGRect frame = self.view.frame;
        frame.origin.y+=70;
        [UIView animateWithDuration:0.15 animations:^{
            self.view.frame = frame;
        }];
        viewFrameChanged = NO;
    }
    for(UITextField *field in[self.view subviews])
    {
        [field resignFirstResponder];
    }

    return YES;
}

- (void)keyboardHide
{
    if(viewFrameChanged)
    {
        CGRect frame = self.view.frame;
        frame.origin.y+=70;
        [UIView animateWithDuration:0.15 animations:^{
            self.view.frame = frame;
        }];
        viewFrameChanged = NO;
    }
    
}

- (void)pickHeadImage
{
    CGRect frame = headImagePickerView.frame;
    
    if(headPickerShow == NO)
    {
        frame.origin.y -= 150;
        [UIView animateWithDuration:0.15 animations:^{
            headImagePickerView.frame = frame;
        }];
        headPickerShow = YES;
        
    }
    else
    {
        frame.origin.y +=150;
        [UIView animateWithDuration:0.15 animations:^{
            headImagePickerView.frame = frame;
        }];
        headPickerShow = NO;
    }
    
}

- (void)selectHeadImage:(UIButton *)sender
{
    [headImageButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"headImage%i",sender.tag]]
                               forState:UIControlStateNormal];
    headImageName = [NSString stringWithFormat:@"headImage%i",sender.tag];
    CGRect frame = headImagePickerView.frame;
    frame.origin.y +=150;
    [UIView animateWithDuration:0.15 animations:^{
        headImagePickerView.frame = frame;
    }];
    headPickerShow = NO;
    
}

- (void)hideKeyBoard
{
    for(UITextField *field in[self.view subviews])
    {
        [field resignFirstResponder];
    }
}


@end
