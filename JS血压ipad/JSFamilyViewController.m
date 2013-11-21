//
//  JSFamilyViewController.m
//  JS血压ipad
//
//  Created by han's mac on 11/21/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import "JSFamilyViewController.h"
#import "JSFamilyCell.h"
#import "PNColor.h"
@interface JSFamilyViewController ()
{
    UINavigationController *navi;
    UITableViewController *tableViewController;
    UIButton  *addButton;
    
}

@end

@implementation JSFamilyViewController

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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"viewbg.png"]];
   
    // Do any additional setup after loading the view from its nib.
    tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
      tableViewController.tableView.delegate = self;
    tableViewController.tableView.dataSource = self;
   

    //tableViewController.tableView.frame = CGRectMake(200, 44, 768-44, 1024-200);
    tableViewController.tableView.backgroundColor =[UIColor clearColor];
    navi = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    navi.view.frame =CGRectMake(200, 0, 768-200, 1024);
    
    CALayer *whiteBlock = [[CALayer alloc] init];
    whiteBlock.backgroundColor =[UIColor whiteColor].CGColor;
    whiteBlock.frame = CGRectMake(200, 0, 1024, 64);
    [self.view.layer addSublayer:whiteBlock];
    [self addChildViewController:navi];
    
    [self.view addSubview:navi.view];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    JSFamilyCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[JSFamilyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor clearColor];
        
    }
    //cell.textLabel.text = @"haha";
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *test = [[UIViewController alloc] init];
    [navi pushViewController:test animated:YES];
    
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(float)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 44;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
            UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 75)];
        footerView.backgroundColor = [UIColor clearColor];
        addButton = [[UIButton alloc] initWithFrame:CGRectMake(780, 10, 40, 40)];
        addButton.layer.cornerRadius = 20;
        addButton.layer.masksToBounds = YES;
        addButton.layer.borderColor = [UIColor whiteColor].CGColor;
        addButton.layer.borderWidth = 2;
        [addButton setTitle:@"+" forState:UIControlStateNormal];
        [addButton setBackgroundImage:[UIImage imageNamed:@"menubg"] forState:UIControlStateNormal];
        [addButton setTitleColor:PNGreen forState:UIControlStateNormal];
        addButton.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:43.0];
    [addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [footerView addSubview:addButton];
        return footerView;
}

- (void)addButtonClick
{
    JSAddFamilyViewController *addController = [[JSAddFamilyViewController alloc] init];
    [navi pushViewController:addController animated:YES];
}

@end
