//
//  JSFamilyViewController.h
//  JS血压ipad
//
//  Created by han's mac on 11/21/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "JSAddFamilyViewController.h"
@interface JSFamilyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,reNewData>
{
    NSDictionary *familyMembers;
}
@property (nonatomic) NSDictionary *familyMembers;


@end
