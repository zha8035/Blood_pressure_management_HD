//
//  JSPointViewController.m
//  JS血压ipad
//
//  Created by han's mac on 11/25/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import "JSPointViewController.h"
#import "JSStartPageViewController.h"
@interface JSPointViewController ()

@end

@implementation JSPointViewController

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
    JSStartPageViewController *startVC = [[JSStartPageViewController alloc] init];
    [self presentViewController:startVC animated:NO completion:nil];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
