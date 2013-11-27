//
//  JSAddDataViewController.m
//  JS血压ipad
//
//  Created by han's mac on 11/22/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import "JSAddDataViewController.h"
#import "PNColor.h"
#import "JSlocalSaveAndRead.h"
@interface JSAddDataViewController ()
{
    UITextField *BPH_TextField;
    UITextField *BPL_TextField;
    UITextField *HR_TextField;
    UITextField *timeTextField;
}

@end

@implementation JSAddDataViewController
@synthesize name;
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
    
    BPH_TextField = [[UITextField alloc] initWithFrame:CGRectMake(400, 120, 200, 35)];
    BPH_TextField.placeholder = @"点击输入收缩压";
    BPH_TextField.borderStyle = UITextBorderStyleRoundedRect;
    [BPH_TextField setKeyboardType:UIKeyboardTypeNumberPad];
    BPH_TextField.delegate = self;
    [self.view addSubview:BPH_TextField];
    
    BPL_TextField = [[UITextField alloc] initWithFrame:CGRectMake(400, 190, 200, 35)];
    BPL_TextField.placeholder = @"点击输入舒张压";
    BPL_TextField.borderStyle = UITextBorderStyleRoundedRect;
    [BPL_TextField setKeyboardType:UIKeyboardTypeNumberPad];
    BPL_TextField.delegate = self;
    [self.view addSubview:BPL_TextField];
    
    HR_TextField = [[UITextField alloc] initWithFrame:CGRectMake(400, 260, 200, 35)];
    HR_TextField.placeholder = @"点击输入心率";
    HR_TextField.borderStyle = UITextBorderStyleRoundedRect;
    [HR_TextField setKeyboardType:UIKeyboardTypeNumberPad];
    HR_TextField.delegate = self;
    [self.view addSubview:HR_TextField];
    
    timeTextField = [[UITextField alloc] initWithFrame:CGRectMake(400, 330, 200, 35)];
    
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"MM-dd-HH-mm-ss"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    timeTextField.text = locationString;
    timeTextField.textColor = [UIColor grayColor];
    [timeTextField setEnabled:NO];
    timeTextField.borderStyle = UITextBorderStyleRoundedRect;
    timeTextField.delegate = self;
    [self.view addSubview:timeTextField];
    
    NSArray *titles = @[@"收缩压",@"舒张压",@"心率",@"创建时间"];
    
    for(int i=0 ; i<4 ; i++)
    {
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(250, 120+70*i, 100, 35)];
        title.text = [titles objectAtIndex:i];
        title.textColor = [UIColor whiteColor];
        title.backgroundColor = [UIColor clearColor];
        title.font = [UIFont systemFontOfSize:20];
        [self.view addSubview:title];
    }
    
    UIButton *submitButton = [[UIButton alloc] initWithFrame:CGRectMake(300, 400, 200, 60)];
    submitButton.backgroundColor = [UIColor colorWithCGColor:PNGreen.CGColor];
    submitButton.layer.cornerRadius = 5;
    [submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitButton];
    
    
    UITapGestureRecognizer *selfViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    [self.view addGestureRecognizer:selfViewTap];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)submit
{
    BOOL inputOk = [self CheckInput:BPL_TextField]&&[self CheckInput:BPH_TextField]&&[self CheckInput:HR_TextField];
    if(inputOk)
    {
        JSlocalSaveAndRead *dataSaveModel = [[JSlocalSaveAndRead alloc] init];
        NSString *BPH = BPH_TextField.text;
        NSString *BPL = BPL_TextField.text;
        NSString *HR  = HR_TextField.text;
        NSString *date = timeTextField.text;
        NSDictionary *data = @{@"BPH": BPH,@"BPL":BPL,@"HR":HR};
        [dataSaveModel saveNewData:data :name :date];
        [self.delegate reloadData];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
    else
    {
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"出错啦" message:@"请输入正确的数据" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alerView show];
    }
}

- (BOOL)CheckInput:(UITextField *)sender {
    
    NSScanner* scan = [NSScanner scannerWithString:sender.text];
    
    int val;
    
    return [scan scanInt:&val] && [scan isAtEnd];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    for(UITextField *field in[self.view subviews])
    {
        [field resignFirstResponder];
    }
    
    return YES;
}
                                           
- (void)hideKeyBoard
{
    for(UITextField *field in[self.view subviews])
    {
        [field resignFirstResponder];
    }
}
@end
