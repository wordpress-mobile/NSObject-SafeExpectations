//
//  NSObject_SafeExpectationsTest_OSX.m
//  NSObject+SafeExpectationsTest_OSX
//
//  Created by Jorge Bernal on 2/6/13.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSObject+SafeExpectations.h"

@interface NSDictionary_SafeExpectations_Test : SenTestCase

@end

@implementation NSDictionary_SafeExpectations_Test

- (void)setUp
{
    [super setUp];

    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.

    // Fixes weird bug where Xcode would complain that tests didn't finish
    // because they actually finished too fast
    NSLog(@"done");

    [super tearDown];
}

- (void)testDictionary
{
    NSDictionary *dict = [self sampleDictionary];
    STAssertNil([dict se_stringForKey:@"undefined"], nil);
}

- (void)testDictionaryStringForKey
{
    NSDictionary *dict = [self sampleDictionary];

    STAssertNotNil([dict se_stringForKey:@"string"], nil);
    STAssertNotNil([dict se_stringForKey:@"numString"], nil);
    STAssertNotNil([dict se_stringForKey:@"num"], nil);
    STAssertNil([dict se_stringForKey:@"array"], nil);
    STAssertNil([dict se_stringForKey:@"dict"], nil);

    STAssertEqualObjects([dict se_stringForKey:@"string"], @"test string", nil);
    STAssertEqualObjects([dict se_stringForKey:@"numString"], @"123", nil);
    STAssertEqualObjects([dict se_stringForKey:@"num"], @"123", nil);
}

- (void)testDictionaryNumberForKey
{
    NSDictionary *dict = [self sampleDictionary];

    STAssertNil([dict se_numberForKey:@"string"], nil);
    STAssertNotNil([dict se_numberForKey:@"numString"], nil);
    STAssertNotNil([dict se_numberForKey:@"doubleString"], nil);
    STAssertNotNil([dict se_numberForKey:@"num"], nil);
    STAssertNil([dict se_numberForKey:@"array"], nil);
    STAssertNil([dict se_numberForKey:@"dict"], nil);

    STAssertEqualObjects([dict se_numberForKey:@"numString"], @123, nil);
    STAssertEqualObjects([dict se_numberForKey:@"doubleString"], @123.456789012345, nil);
    STAssertEqualObjects([dict se_numberForKey:@"num"], @123, nil);
}

- (void)testDictionaryArrayForKey
{
    NSDictionary *dict = [self sampleDictionary];

    STAssertNil([dict se_arrayForKey:@"string"], nil);
    STAssertNil([dict se_arrayForKey:@"numString"], nil);
    STAssertNil([dict se_arrayForKey:@"doubleString"], nil);
    STAssertNil([dict se_arrayForKey:@"num"], nil);
    STAssertNotNil([dict se_arrayForKey:@"array"], nil);
    STAssertNil([dict se_arrayForKey:@"dict"], nil);
    STAssertEquals([[dict se_arrayForKey:@"array"] count], (NSUInteger)3, nil);
}

- (void)testDictionaryDictionaryForKey
{
    NSDictionary *dict = [self sampleDictionary];

    STAssertNil([dict se_dictionaryForKey:@"string"], nil);
    STAssertNil([dict se_dictionaryForKey:@"numString"], nil);
    STAssertNil([dict se_dictionaryForKey:@"doubleString"], nil);
    STAssertNil([dict se_dictionaryForKey:@"num"], nil);
    STAssertNil([dict se_dictionaryForKey:@"array"], nil);
    STAssertNotNil([dict se_dictionaryForKey:@"dict"], nil);
    STAssertEquals([[dict se_dictionaryForKey:@"dict"] count], (NSUInteger)2, nil);
}

- (void)testDictionaryObjectForKeyPath
{
    NSDictionary *dict = [self sampleDictionaryForKeyPath];

    STAssertNotNil([dict se_objectForKeyPath:@"level1"], nil);
    STAssertNotNil([dict se_objectForKeyPath:@"level1.level2"], nil);
    STAssertNotNil([dict se_objectForKeyPath:@"level1.level2.string"], nil);
    STAssertNil([dict se_objectForKeyPath:@"level1.level2.level3"], nil);
    STAssertNil([dict se_objectForKeyPath:@"level1.level2.string.missing"], nil);
}

- (void)testDictionaryStringForKeyPath
{
    NSDictionary *dict = [self sampleDictionaryForKeyPath];

    STAssertNotNil([dict se_stringForKeyPath:@"level1.string"], nil);
    STAssertNotNil([dict se_stringForKeyPath:@"level1.numString"], nil);
    STAssertNotNil([dict se_stringForKeyPath:@"level1.num"], nil);
    STAssertNil([dict se_stringForKeyPath:@"level1.array"], nil);
    STAssertNil([dict se_stringForKeyPath:@"level1.dict"], nil);

    STAssertEqualObjects([dict se_stringForKeyPath:@"level1.string"], @"test string", nil);
    STAssertEqualObjects([dict se_stringForKeyPath:@"level1.numString"], @"123", nil);
    STAssertEqualObjects([dict se_stringForKeyPath:@"level1.num"], @"123", nil);
}

- (void)testDictionaryNumberForKeyPath
{
    NSDictionary *dict = [self sampleDictionaryForKeyPath];

    STAssertNil([dict se_numberForKeyPath:@"level1.string"], nil);
    STAssertNotNil([dict se_numberForKeyPath:@"level1.numString"], nil);
    STAssertNotNil([dict se_numberForKeyPath:@"level1.doubleString"], nil);
    STAssertNotNil([dict se_numberForKeyPath:@"level1.num"], nil);
    STAssertNil([dict se_numberForKeyPath:@"level1.array"], nil);
    STAssertNil([dict se_numberForKeyPath:@"level1.dict"], nil);

    STAssertEqualObjects([dict se_numberForKeyPath:@"level1.numString"], @123, nil);
    STAssertEqualObjects([dict se_numberForKeyPath:@"level1.doubleString"], @123.456789012345, nil);
    STAssertEqualObjects([dict se_numberForKeyPath:@"level1.num"], @123, nil);
}

- (void)testDictionaryArrayForKeyPath
{
    NSDictionary *dict = [self sampleDictionaryForKeyPath];

    STAssertNil([dict se_arrayForKeyPath:@"level1.string"], nil);
    STAssertNil([dict se_arrayForKeyPath:@"level1.numString"], nil);
    STAssertNil([dict se_arrayForKeyPath:@"level1.doubleString"], nil);
    STAssertNil([dict se_arrayForKeyPath:@"level1.num"], nil);
    STAssertNotNil([dict se_arrayForKeyPath:@"level1.array"], nil);
    STAssertNil([dict se_arrayForKeyPath:@"level1.dict"], nil);
    STAssertEquals([[dict se_arrayForKeyPath:@"level1.array"] count], (NSUInteger)3, nil);
}

- (void)testDictionaryDictionaryForKeyPath
{
    NSDictionary *dict = [self sampleDictionaryForKeyPath];

    STAssertNil([dict se_dictionaryForKeyPath:@"level1.string"], nil);
    STAssertNil([dict se_dictionaryForKeyPath:@"level1.numString"], nil);
    STAssertNil([dict se_dictionaryForKeyPath:@"level1.doubleString"], nil);
    STAssertNil([dict se_dictionaryForKeyPath:@"level1.num"], nil);
    STAssertNil([dict se_dictionaryForKeyPath:@"level1.array"], nil);
    STAssertNotNil([dict se_dictionaryForKeyPath:@"level1.dict"], nil);
    STAssertEquals([[dict se_dictionaryForKeyPath:@"level1.dict"] count], (NSUInteger)2, nil);
}

- (NSDictionary *)sampleDictionary {
    return @{
             @"string": @"test string",
             @"numString": @"123",
             @"doubleString": @"123.456789012345",
             @"num": @123,
             @"array": @[@1,@2,@3],
             @"dict": @{@"test1": @100, @"test2": @200}
             };
}

- (NSDictionary *)sampleDictionaryForKeyPath {
    return @{@"level1": @{
                     @"level2": @{
                             @"string": @"test string",
                             @"numString": @"123",
                             @"doubleString": @"123.456789012345",
                             @"num": @123,
                             @"array": @[@1,@2,@3],
                             @"dict": @{@"test1": @100, @"test2": @200}
                             },
                     @"string": @"test string",
                     @"doubleString": @"123.456789012345",
                     @"numString": @"123",
                     @"num": @123,
                     @"array": @[@1,@2,@3],
                     @"dict": @{@"test1": @100, @"test2": @200}
                     },
             @"string": @"test string",
             @"doubleString": @"123.456789012345",
             @"numString": @"123",
             @"num": @123,
             @"array": @[@1,@2,@3],
             @"dict": @{@"test1": @100, @"test2": @200}
             };

}

@end
