//
//  JSAddFamilyViewController.h
//  JS血压ipad
//
//  Created by han's mac on 11/21/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//
@protocol reNewData <NSObject>

- (void)reloadData;

@end
#import <UIKit/UIKit.h>

@interface JSAddFamilyViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
{
   
    
    NSString *headImageName;
    
    UIScrollView *headImagePickerView;
    
    
    
    NSDictionary *memberInfoDict;
    BOOL viewFrameChanged;
    BOOL headPickerShow;
}
@property (nonatomic,retain) UITextField *nameField,*genderField,*ageField,*heightField,*weightField;
@property (nonatomic,retain) UIButton *headImageButton;
@property (nonatomic) NSDictionary *memberInfoDict;
@property (nonatomic) NSObject<reNewData> *delegate;

- (void)makeChange;
@end
