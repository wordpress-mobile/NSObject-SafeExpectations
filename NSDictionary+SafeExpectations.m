//
//  NSDictionary+SafeExpectations.m
//  NSObject-SafeExpectationsTests
//
//  Created by Jorge Bernal on 2/6/13.
//
//

#import "NSDictionary+SafeExpectations.h"
#import "NSObject+SafeExpectations.h"

@implementation NSDictionary (SafeExpectations)

- (NSString *)stringForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    return [NSString se_stringWithObject:obj];
}

- (NSNumber *)numberForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    return [NSNumber se_numberWithObject:obj];
}

- (NSArray *)arrayForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    return [NSArray se_arrayWithObject:obj];
}

- (NSDictionary *)dictionaryForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    return [NSDictionary se_dictionaryWithObject:obj];
}

- (id)safeObjectForKey:(id)key {
    NSSEAssert(key != nil, @"nil key");
    return [self objectForKey:key];
}

- (id)objectForKeyPath:(NSString *)keyPath {
    id object = self;
    NSArray *keyPaths = [keyPath componentsSeparatedByString:@"."];
    for (NSString *currentKeyPath in keyPaths) {
        if (![object isKindOfClass:[NSDictionary class]])
            object = nil;

        object = [object objectForKey:currentKeyPath];

        if (object == nil)
            break;
    }
    return object;
}

- (NSString *)stringForKeyPath:(id)keyPath {
    id obj = [self objectForKeyPath:keyPath];
    return [NSString se_stringWithObject:obj];

}

- (NSNumber *)numberForKeyPath:(id)keyPath {
    id obj = [self objectForKeyPath:keyPath];
    return [NSNumber se_numberWithObject:obj];
}

- (NSArray *)arrayForKeyPath:(id)keyPath {
    id obj = [self objectForKeyPath:keyPath];
    return [NSArray se_arrayWithObject:obj];
}

- (NSDictionary *)dictionaryForKeyPath:(id)keyPath {
    id obj = [self objectForKeyPath:keyPath];
    return [NSDictionary se_dictionaryWithObject:obj];
}

+ (instancetype)se_dictionaryWithObject:(id)obj {
    NSDictionary *dictionary = obj;

    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        dictionary = nil;
    }

    return dictionary;
}

@end
