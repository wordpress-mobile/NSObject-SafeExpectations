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

- (NSString *)se_stringForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    return [NSString se_stringWithObject:obj];
}

- (NSNumber *)se_numberForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    return [NSNumber se_numberWithObject:obj];
}

- (NSArray *)se_arrayForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    return [NSArray se_arrayWithObject:obj];
}

- (NSDictionary *)se_dictionaryForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    return [NSDictionary se_dictionaryWithObject:obj];
}

- (id)safeObjectForKey:(id)key {
    NSSEAssert(key != nil, @"nil key");
    return [self objectForKey:key];
}

- (id)se_objectForKeyPath:(NSString *)keyPath {
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

- (NSString *)se_stringForKeyPath:(id)keyPath {
    id obj = [self se_objectForKeyPath:keyPath];
    return [NSString se_stringWithObject:obj];

}

- (NSNumber *)se_numberForKeyPath:(id)keyPath {
    id obj = [self se_objectForKeyPath:keyPath];
    return [NSNumber se_numberWithObject:obj];
}

- (NSArray *)se_arrayForKeyPath:(id)keyPath {
    id obj = [self se_objectForKeyPath:keyPath];
    return [NSArray se_arrayWithObject:obj];
}

- (NSDictionary *)se_dictionaryForKeyPath:(id)keyPath {
    id obj = [self se_objectForKeyPath:keyPath];
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
