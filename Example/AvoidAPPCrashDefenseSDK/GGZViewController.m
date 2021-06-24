//
//  GGZViewController.m
//  AvoidAPPCrashDefenseSDK
//
//  Created by gegaozhao1126@gmail.com on 07/11/2020.
//  Copyright (c) 2020 gegaozhao1126@gmail.com. All rights reserved.
//

#import "GGZViewController.h"
#import "GGZTest.h"
@interface GGZViewController ()

@end

@implementation GGZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    GGZTest *test = [[GGZTest alloc] init];
    [test run];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
