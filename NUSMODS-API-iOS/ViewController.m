//
//  ViewController.m
//  NUSMODS-API-iOS
//
//  Created by Jiang Sheng on 30/11/14.
//  Copyright (c) 2014 Jiang Sheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NUSMEngine * engine = [NUSMEngine sharedEngine];
    
    [engine getModuleForAcadYear:@"2014-2015" Semester:1 WithCode:@"CS2102" success:^(id response) {
        NSLog(@"%@", response);
    } failure:^(NSError * error) {
        NSLog(@"%@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
