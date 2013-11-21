//
//  JSAddFamilyViewController.m
//  JS血压ipad
//
//  Created by han's mac on 11/21/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import "JSAddFamilyViewController.h"
#import "PNColor.h"
@interface JSAddFamilyViewController ()
{
    UITextField *nameField;
    UITextField *genderField;
    UITextField *ageField;
    UITextField *heightField;
    UITextField *weightField;
    
    BOOL viewFrameChanged;
}

@end

@implementation JSAddFamilyViewController

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
    
    UIButton *headImageButton = [[UIButton alloc] initWithFrame:CGRectMake(115, 195, 120, 120)];
    
    headImageButton.layer.cornerRadius = 60;
    [headImageButton setBackgroundImage:[UIImage imageNamed:@"headImage0" ] forState:UIControlStateNormal];
    [self.view addSubview:headImageButton];
    
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
    
	// Do any additional setup after loading the view.
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
@end
