//
//  JSMainViewController.m
//  JS血压ipad
//
//  Created by han's mac on 11/20/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import "JSMainViewController.h"
#import "JSBPCell.h"
#import "PNColor.h"
@interface JSMainViewController ()
{
    NSArray *titlesInSection0;
    NSArray *titlesInSection1;
    
    
    
}

@property (weak, nonatomic) IBOutlet UITableView *LeftMenuTableVIew;
@property (weak, nonatomic) IBOutlet UITableView *MainTableView;

@end

@implementation JSMainViewController
@synthesize infoDict;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    titlesInSection0 = @[@"家庭成员",@"提醒",@"退出登录"];
    titlesInSection1 = @[@"健康问答",@"用户指南",@"给我们评分",@"关于"];
    _LeftMenuTableVIew.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"viewbg.png"]];
    _MainTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"viewbg.png"]];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    
    if(tableView == _LeftMenuTableVIew)
    {
        return 2;
    }
    else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    
    if(tableView == _LeftMenuTableVIew)
    {
        if(section == 0)
        {
            return 3;
        }
        else
        {
            return 4;
        }
    }
    else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _LeftMenuTableVIew)
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
    
    else
    {
        static NSString *CellIdentifier = @"JSBPCell";
        JSBPCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            cell = [[JSBPCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
        }
        
        
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _LeftMenuTableVIew)
    {
        
    }
    else
    {
        
    }
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _MainTableView)
    {
        return 140;
    }
    return 55;
}

- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 55;
}


//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if(tableView == _LeftMenuTableVIew)
//    {
//        if(section == 0)
//        {
//            return @"设置";
//        }
//        else
//        {
//            return @"更多";
//        }
//    }
//    else
//    {
//        return nil;
//    }
//}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(tableView == _LeftMenuTableVIew)
    {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];
    headerView.backgroundColor = [UIColor grayColor];
    UILabel *headerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 50, 45)];
    headerTitleLabel.textColor = [UIColor whiteColor];
    if(section == 0)
    {
        headerTitleLabel.text = @"设置";
        
    }
    else
    {
        headerTitleLabel.text = @"更多";
    }
    [headerView addSubview:headerTitleLabel];
    return headerView;
    }
    else
    {
        return nil;
    }
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(tableView == _MainTableView)
    {
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 75)];
        footerView.backgroundColor = [UIColor clearColor];
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(780, 10, 40, 40)];
    addButton.layer.cornerRadius = 20;
    addButton.layer.masksToBounds = YES;
    addButton.layer.borderColor = [UIColor whiteColor].CGColor;
    addButton.layer.borderWidth = 2;
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    [addButton setBackgroundImage:[UIImage imageNamed:@"menubg"] forState:UIControlStateNormal];
    [addButton setTitleColor:PNGreen forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:43.0];
        [footerView addSubview:addButton];
        return footerView;
    }
    return nil;
}
- (float) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(tableView == _MainTableView)
    {
        return 75;
    }
    else
    {
        return 0;
    }
}
@end
