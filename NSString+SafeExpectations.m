//
//  NSString+SafeExpectations.m
//  NSObject+SafeExpectationsTests
//
//  Created by Jorge Bernal on 03/04/14.
//
//

#import "NSString+SafeExpectations.h"

@implementation NSString (SafeExpectations)

+ (instancetype)se_stringWithObject:(id)obj {
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    }

    NSString *string = nil;

    if ([obj respondsToSelector:@selector(stringValue)])
        string = [obj performSelector:@selector(stringValue)];

    if (![string isKindOfClass:[NSString class]]) {
        string = nil;
    }

    return string;
}

@end
