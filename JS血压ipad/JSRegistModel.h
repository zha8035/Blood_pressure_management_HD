//
//  JSRegistModel.h
//  JS血压ipad
//
//  Created by han's mac on 11/18/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSRegistModel : NSObject
{
    NSString *usernameStr;
    NSString *passwordStr;
    NSString *emailStr;
    
}

@property (nonatomic) NSString *usernameStr;
@property (nonatomic) NSString *passwordStr;
@property (nonatomic)  NSString *emailStr;

- (BOOL)asiHttpRequestRegist;
@end
