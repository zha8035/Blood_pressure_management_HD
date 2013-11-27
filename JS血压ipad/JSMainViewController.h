//
//  JSMainViewController.h
//  JS血压ipad
//
//  Created by han's mac on 11/20/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSAddDataViewController.h"
@interface JSMainViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,JSAddDatareNewData>
{
    
    NSDictionary *familyMembers;
}
@property (nonatomic) NSDictionary *familyMembers;
@end
