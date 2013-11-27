//
//  JSAddDataViewController.h
//  JS血压ipad
//
//  Created by han's mac on 11/22/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//
@protocol JSAddDatareNewData <NSObject>

- (void)reloadData;

@end
#import <UIKit/UIKit.h>

@interface JSAddDataViewController : UIViewController<UITextFieldDelegate>
{
    NSString *name;
}
@property (nonatomic) NSString *name;
@property (nonatomic) NSObject<JSAddDatareNewData> *delegate;
@end
