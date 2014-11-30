//
//  NUSMODS_API_iOSTests.m
//  NUSMODS-API-iOSTests
//
//  Created by Jiang Sheng on 30/11/14.
//  Copyright (c) 2014 Jiang Sheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NUSMEngine.h"

@interface NUSMODS_API_iOSTests : XCTestCase
@property (nonatomic) NUSMEngine * engine;
@end

@implementation NUSMODS_API_iOSTests

- (void)setUp {
    [super setUp];
    self.engine = [NUSMEngine sharedEngine];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

@end
