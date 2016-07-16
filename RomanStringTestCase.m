//
//  RomanStringTestCase.m
//  RomanToNumeric
//
//  Created by Dheeraj Singh on 10/1/15.
//  Copyright © 2015 Dheeraj Singh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Model.h"

@interface RomanStringTestCase : XCTestCase

@end

@implementation RomanStringTestCase



- (void)testReturnYesWhenValidRomanStringEntered {
    NSString * validRomanString=@"XCVDM";
    Model * model=[[Model alloc]init];
    bool result=[model isRomanStringValid:validRomanString];
    XCTAssertEqual(result, YES, @"Roman String validation failed");
}

- (void)testReturnNoWhenInValidRomanStringEntered {
    NSString * inValidRomanString=@"XC213VDM";
    Model * model=[[Model alloc]init];
    bool result=[model isRomanStringValid:inValidRomanString];
    XCTAssertEqual(result, NO, @"Roman String validation failed");
}

- (void)testNumericValueforRomanStringWithSingleChar {
    NSString * romanString=@"M";
    Model * model=[[Model alloc]initWithRomanDict];
    NSNumber * result=[model numericValueforRomanString:romanString];
    XCTAssertEqual(result, @1000, @"Numeric conversion failed for single character roman string");
}

- (void)testNumericValueforRomanStringWithMultiChar {
    NSString * romanString=@"DMCVVVX";
    Model * model=[[Model alloc]initWithRomanDict];
    NSNumber * result=[model numericValueforRomanString:romanString];
    XCTAssertEqual(result, @615, @"Numeric conversion failed for multi character roman string");
}

@end
