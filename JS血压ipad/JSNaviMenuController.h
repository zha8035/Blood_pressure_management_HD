//
//  JSNaviMenuController.h
//  JS血压ipad
//
//  Created by han's mac on 11/21/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "JSFamilyViewController.h"
#import "JSStartPageViewController.h"
@interface JSNaviMenuController : UINavigationController<UITableViewDelegate,UITableViewDataSource>
{
    NSDictionary *familyMembers;
}
@property (nonatomic) NSDictionary *familyMembers;

@end
