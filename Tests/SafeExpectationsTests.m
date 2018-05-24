@import XCTest;
#import <SafeExpectations/SafeExpectations.h>

@interface SafeExpectationsTests : XCTestCase

@end

@implementation SafeExpectationsTests

- (void)testDictionary
{
    NSDictionary *dict = @{
                           @"string": @"test string",
                           @"numString": @"123",
                           @"doubleString": @"123.456789012345",
                           @"doubleWithOtherLocaleString": @"123,456789012345",
                           @"num": @123,
                           @"array": @[@1,@2,@3],
                           @"dict": @{@"test1": @100, @"test2": @200}
                           };

    XCTAssertNil([dict stringForKey:@"undefined"]);

    // stringForKey:
    XCTAssertNotNil([dict stringForKey:@"string"]);
    XCTAssertNotNil([dict stringForKey:@"numString"]);
    XCTAssertNotNil([dict stringForKey:@"num"]);
    XCTAssertNil([dict stringForKey:@"array"]);
    XCTAssertNil([dict stringForKey:@"dict"]);

    XCTAssertEqualObjects([dict stringForKey:@"string"], @"test string");
    XCTAssertEqualObjects([dict stringForKey:@"numString"], @"123");
    XCTAssertEqualObjects([dict stringForKey:@"num"], @"123");

    // numberForKey:
    XCTAssertNil([dict numberForKey:@"string"]);
    XCTAssertNotNil([dict numberForKey:@"numString"]);
    XCTAssertNotNil([dict numberForKey:@"doubleString"]);
    XCTAssertNotNil([dict numberForKey:@"num"]);
    XCTAssertNil([dict numberForKey:@"array"]);
    XCTAssertNil([dict numberForKey:@"dict"]);

    XCTAssertEqualObjects([dict numberForKey:@"numString"], @123);
    XCTAssertEqualObjects([dict numberForKey:@"doubleString"], @123.456789012345);
    XCTAssertEqualObjects([dict numberForKey:@"doubleWithOtherLocaleString"], nil);
    NSNumberFormatter *frenchFormatter = [[NSNumberFormatter alloc] init];
    [frenchFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"fr-fr"]];
    XCTAssertEqualObjects([dict numberForKey:@"doubleWithOtherLocaleString" usingFormatter:frenchFormatter], @123.456789012345);
    XCTAssertEqualObjects([dict numberForKey:@"num"], @123);

    // arrayForKey:
    XCTAssertNil([dict arrayForKey:@"string"]);
    XCTAssertNil([dict arrayForKey:@"numString"]);
    XCTAssertNil([dict arrayForKey:@"doubleString"]);
    XCTAssertNil([dict arrayForKey:@"num"]);
    XCTAssertNotNil([dict arrayForKey:@"array"]);
    XCTAssertNil([dict arrayForKey:@"dict"]);
    XCTAssertEqual([[dict arrayForKey:@"array"] count], 3);

    // dictionaryForKey:
    XCTAssertNil([dict dictionaryForKey:@"string"]);
    XCTAssertNil([dict dictionaryForKey:@"numString"]);
    XCTAssertNil([dict dictionaryForKey:@"doubleString"]);
    XCTAssertNil([dict dictionaryForKey:@"num"]);
    XCTAssertNil([dict dictionaryForKey:@"array"]);
    XCTAssertNotNil([dict dictionaryForKey:@"dict"]);
    XCTAssertEqual([[dict dictionaryForKey:@"dict"] count], 2);
}

- (void)testDictionaryKeyPath
{
    NSDictionary *dict = @{@"level1": @{
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

    XCTAssertNotNil([dict objectForKeyPath:@"level1"]);
    XCTAssertNotNil([dict objectForKeyPath:@"level1.level2"]);
    XCTAssertNotNil([dict objectForKeyPath:@"level1.level2.string"]);
    XCTAssertNil([dict objectForKeyPath:@"level1.level2.level3"]);
    XCTAssertNil([dict objectForKeyPath:@"level1.level2.string.missing"]);

    // stringForKeyPath:
    XCTAssertNotNil([dict stringForKeyPath:@"level1.string"]);
    XCTAssertNotNil([dict stringForKeyPath:@"level1.numString"]);
    XCTAssertNotNil([dict stringForKeyPath:@"level1.num"]);
    XCTAssertNil([dict stringForKeyPath:@"level1.array"]);
    XCTAssertNil([dict stringForKeyPath:@"level1.dict"]);

    XCTAssertEqualObjects([dict stringForKeyPath:@"level1.string"], @"test string");
    XCTAssertEqualObjects([dict stringForKeyPath:@"level1.numString"], @"123");
    XCTAssertEqualObjects([dict stringForKeyPath:@"level1.num"], @"123");

    // numberForKeyPath:
    XCTAssertNil([dict numberForKeyPath:@"level1.string"]);
    XCTAssertNotNil([dict numberForKeyPath:@"level1.numString"]);
    XCTAssertNotNil([dict numberForKeyPath:@"level1.doubleString"]);
    XCTAssertNotNil([dict numberForKeyPath:@"level1.num"]);
    XCTAssertNil([dict numberForKeyPath:@"level1.array"]);
    XCTAssertNil([dict numberForKeyPath:@"level1.dict"]);

    XCTAssertEqualObjects([dict numberForKeyPath:@"level1.numString"], @123);
    XCTAssertEqualObjects([dict numberForKeyPath:@"level1.doubleString"], @123.456789012345);
    XCTAssertEqualObjects([dict numberForKeyPath:@"level1.num"], @123);

    // arrayForKeyPath:
    XCTAssertNil([dict arrayForKeyPath:@"level1.string"]);
    XCTAssertNil([dict arrayForKeyPath:@"level1.numString"]);
    XCTAssertNil([dict arrayForKeyPath:@"level1.doubleString"]);
    XCTAssertNil([dict arrayForKeyPath:@"level1.num"]);
    XCTAssertNotNil([dict arrayForKeyPath:@"level1.array"]);
    XCTAssertNil([dict arrayForKeyPath:@"level1.dict"]);
    XCTAssertEqual([[dict arrayForKeyPath:@"level1.array"] count], 3);

    // dictionaryForKeyPath:
    XCTAssertNil([dict dictionaryForKeyPath:@"level1.string"]);
    XCTAssertNil([dict dictionaryForKeyPath:@"level1.numString"]);
    XCTAssertNil([dict dictionaryForKeyPath:@"level1.doubleString"]);
    XCTAssertNil([dict dictionaryForKeyPath:@"level1.num"]);
    XCTAssertNil([dict dictionaryForKeyPath:@"level1.array"]);
    XCTAssertNotNil([dict dictionaryForKeyPath:@"level1.dict"]);
    XCTAssertEqual([[dict dictionaryForKeyPath:@"level1.dict"] count], 2);
}

@end
