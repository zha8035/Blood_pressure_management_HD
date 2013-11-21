//
//  JSNaviMenuController.m
//  JS血压ipad
//
//  Created by han's mac on 11/21/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import "JSNaviMenuController.h"

@interface JSNaviMenuController ()
{
    NSArray *titlesInSection0;
    NSArray *titlesInSection1;
    
    UITableView *menuBar;
    BOOL isRootViewController;
}
@end

@implementation JSNaviMenuController

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
    
    isRootViewController = YES;
    
    
    UIButton *homePageButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, 200, 75)];
    homePageButton.backgroundColor = [UIColor grayColor];
    [homePageButton setTitle:@"主页" forState:UIControlStateNormal];
    [homePageButton addTarget:self action:@selector(homePageClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:homePageButton];
    
    
    
    menuBar = [[UITableView alloc] initWithFrame:CGRectMake(0, 44+75, 200, 768-44-75) style:UITableViewStyleGrouped];
    menuBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"viewbg.png"]];
    menuBar.delegate = self;
    menuBar.dataSource =self;
    [self.view addSubview:menuBar];
    titlesInSection0 = @[@"家庭成员",@"提醒",@"退出登录"];
    titlesInSection1 = @[@"用户指南",@"给我们评分",@"关于"];
    
    self.navigationBar.hidden = YES;
    
	// Do any additional setup after loading the view.
}

- (void)homePageClick
{
    [self popToRootViewControllerAnimated:YES];
    isRootViewController = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    if(section == 0)
    {
        return 3;
    }
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor clearColor];
    }
    if(indexPath.section == 0)
    {
        cell.textLabel.text = [titlesInSection0 objectAtIndex:indexPath.row];
        
    }
    else
    {
        cell.textLabel.text = [titlesInSection1 objectAtIndex:indexPath.row];
        
        
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0 && indexPath.row == 0 && isRootViewController == YES)
    {
        JSFamilyViewController *viewCotroller = [[JSFamilyViewController alloc] init];
        [self pushViewController:viewCotroller animated:YES];
        isRootViewController = NO;
    }
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(float)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
@end
