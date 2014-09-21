//
//  NSArray+SafeExpectations.m
//  NSObject+SafeExpectationsTests
//
//  Created by Jorge Bernal on 03/04/14.
//
//

#import "NSArray+SafeExpectations.h"

@implementation NSArray (SafeExpectations)

+ (instancetype)se_arrayWithObject:(id)obj {
    NSArray *array = obj;

    if (![array isKindOfClass:[NSArray class]]) {
        array = nil;
    }

    return array;
}

@end
