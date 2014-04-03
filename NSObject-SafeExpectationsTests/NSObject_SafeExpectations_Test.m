//
//  NSObject_SafeExpectations_Test.m
//  NSObject+SafeExpectationsTests
//
//  Created by Jorge Bernal on 03/04/14.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSObject+SafeExpectations.h"

@interface NSObject_SafeExpectations_Test : SenTestCase

@end

@implementation NSObject_SafeExpectations_Test {
    NSString *_string;
    NSString *_stringNumber;
    NSNumber *_number;
    NSArray *_array;
    NSDictionary *_dictionary;
}

- (void)setUp {
    [super setUp];
    _string = @"test";
    _stringNumber = @"123.45";
    _number = @123.45;
    _array = @[@1, @2, @3];
    _dictionary = @{@1: @2, @3: @4};
}

- (void)tearDown {
    [super tearDown];
}

- (void)testStringWithObject {
    STAssertNotNil([NSString se_stringWithObject:_string], nil);
    STAssertEquals([NSString se_stringWithObject:_string], _string, nil);

    STAssertNotNil([NSString se_stringWithObject:_number], nil);
    STAssertEqualObjects([NSString se_stringWithObject:_number], _stringNumber, nil);

    STAssertNil([NSString se_stringWithObject:_array], nil);
    STAssertNil([NSString se_stringWithObject:_dictionary], nil);
}

- (void)testNumberWithObject {
    STAssertNil([NSNumber se_numberWithObject:_string], nil);
    STAssertNotNil([NSNumber se_numberWithObject:_stringNumber], nil);
    STAssertEqualObjects([NSNumber se_numberWithObject:_stringNumber], _number, nil);

    STAssertNotNil([NSNumber se_numberWithObject:_number], nil);
    STAssertEquals([NSNumber se_numberWithObject:_number], _number, nil);

    STAssertNil([NSNumber se_numberWithObject:_array], nil);
    STAssertNil([NSNumber se_numberWithObject:_dictionary], nil);
}

- (void)testArrayWithObject {
    STAssertNil([NSArray se_arrayWithObject:_string], nil);
    STAssertNil([NSArray se_arrayWithObject:_number], nil);

    STAssertNotNil([NSArray se_arrayWithObject:_array], nil);
    STAssertEquals([NSArray se_arrayWithObject:_array], _array, nil);

    STAssertNil([NSArray se_arrayWithObject:_dictionary], nil);
}

- (void)testDictionaryWithObject {
    STAssertNil([NSDictionary se_dictionaryWithObject:_string], nil);
    STAssertNil([NSDictionary se_dictionaryWithObject:_number], nil);
    STAssertNil([NSDictionary se_dictionaryWithObject:_array], nil);

    STAssertNotNil([NSDictionary se_dictionaryWithObject:_dictionary], nil);
    STAssertEquals([NSDictionary se_dictionaryWithObject:_dictionary], _dictionary, nil);
}

@end
