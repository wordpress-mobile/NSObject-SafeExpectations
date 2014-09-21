//
//  NSNumber+SafeExpectations.m
//  NSObject+SafeExpectationsTests
//
//  Created by Jorge Bernal on 03/04/14.
//
//

#import "NSNumber+SafeExpectations.h"

static NSNumberFormatter *SENumberFormatter;

@implementation NSNumber (SafeExpectations)

+ (instancetype)se_numberWithObject:(id)obj {
    if ([obj isKindOfClass:[NSNumber class]]) {
        return obj;
    }

    NSNumber *number = obj;

    if ([number isKindOfClass:[NSString class]])
        number = [SENumberFormatter numberFromString:(NSString *)number];

    if (![number isKindOfClass:[NSNumber class]])
        number = nil;

    return number;
}

+ (void)load {
    SENumberFormatter = [[NSNumberFormatter alloc] init];
    [SENumberFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"C"]];
}

@end
