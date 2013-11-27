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
#import "JSFamilyViewController.h"
#import "JSlocalSaveAndRead.h"
@interface JSMainViewController ()
{
    NSArray *titlesInSection0;
    NSArray *titlesInSection1;
    
    UINavigationController *navi;
    UITableViewController *tableViewController;
    
    NSArray *nameKeys;
    NSInteger numberOfMembers;
    
    
}



@property (weak,nonatomic) UITableView *tableView;
@end

@implementation JSMainViewController
@synthesize familyMembers;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"viewbg.png"]];
    
    tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    tableViewController.tableView.delegate = self;
    tableViewController.tableView.dataSource = self;
    
    tableViewController.tableView.backgroundColor =[UIColor clearColor];
    navi = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    navi.view.frame =CGRectMake(200, 0, 1024-200, 768);
    
    CALayer *whiteBlock = [[CALayer alloc] init];
    whiteBlock.backgroundColor =[UIColor whiteColor].CGColor;
    whiteBlock.frame = CGRectMake(0, 0, 1024, 64);
    [self.view.layer addSublayer:whiteBlock];
    [self addChildViewController:navi];
    
    [self.view addSubview:navi.view];

    if(!familyMembers)
    {
        JSFamilyViewController *familyController = [[JSFamilyViewController alloc] init];
        [self.navigationController pushViewController:familyController animated:YES];
    }
    else
    {
        nameKeys = [familyMembers allKeys];
        numberOfMembers = [nameKeys count];
        
        
    }
    
	// Do any additional setup after loading the view, typically from a nib.
    
}
- (void)reloadData
{
    JSlocalSaveAndRead *readModel = [[JSlocalSaveAndRead alloc] init];
    [readModel read];
    familyMembers = readModel.familyMembers;
    
    nameKeys = [familyMembers allKeys];
    numberOfMembers = [nameKeys count];
    [tableViewController.tableView reloadData];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    
    return numberOfMembers;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return 1;
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
            static NSString *CellIdentifier = @"JSBPCell";
        JSBPCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            cell = [[JSBPCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
        }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *classDict =[familyMembers objectForKey:[nameKeys objectAtIndex:indexPath.section]];
    NSDictionary *infoDict = [classDict objectForKey:@"data"];
    NSArray *dates = [infoDict allKeys];
    if([dates count]!=0)
    {
    NSDictionary *data = [infoDict objectForKey:[dates objectAtIndex:0]];
    cell.BPL_Label.text = [data objectForKey:@"BPL"];
    cell.BPH_Label.text = [data objectForKey:@"BPH"];
     cell.HR_Label.text = [data objectForKey:@"HR"];
    [cell drawChart:infoDict];
    }
        return cell;
    
}



- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 55;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if(editingStyle ==UITableViewCellEditingStyleDelete)
//    {
//        JSlocalSaveAndRead *deleteMemberModel = [[JSlocalSaveAndRead alloc] init];
//        [deleteMemberModel deleteMember:[nameKeys objectAtIndex:indexPath.section]];
//        [self reloadData];
//        
//    }
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return Nil;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [nameKeys objectAtIndex:section];
}
- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
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
    addButton.tag = section;
    [addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [footerView addSubview:addButton];
        return footerView;
    
}
- (float) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 75;
}
- (void)addButtonClick:(UIButton *)sender
{
    JSAddDataViewController *addDataController = [[JSAddDataViewController alloc] init];
    addDataController.name = [nameKeys objectAtIndex:sender.tag];
    addDataController.delegate = self;
    [navi pushViewController:addDataController animated:YES];
}
@end
