#import "NSDictionary+SafeExpectations.h"

@interface NSDictionary (SafeExpectations_Private)
- (NSString *)stringWithObject:(id)obj;
- (NSNumber *)numberWithObject:(id)obj;
- (NSArray *)arrayWithObject:(id)obj;
- (NSDictionary *)dictionaryWithObject:(id)obj;
@end

@implementation NSDictionary (SafeExpectations)

- (NSString *)stringForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    return [self stringWithObject:obj];
}

- (NSNumber *)numberForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    return [self numberWithObject:obj];
}

- (NSArray *)arrayForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    return [self arrayWithObject:obj];
}

- (NSDictionary *)dictionaryForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    return [self dictionaryWithObject:obj];
}

- (id)safeObjectForKey:(id)key {
    NSAssert(key != nil, @"nil key");
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
    return [self stringWithObject:obj];

}

- (NSNumber *)numberForKeyPath:(id)keyPath {
    id obj = [self objectForKeyPath:keyPath];
    return [self numberWithObject:obj];
}

- (NSArray *)arrayForKeyPath:(id)keyPath {
    id obj = [self objectForKeyPath:keyPath];
    return [self arrayWithObject:obj];
}

- (NSDictionary *)dictionaryForKeyPath:(id)keyPath {
    id obj = [self objectForKeyPath:keyPath];
    return [self dictionaryWithObject:obj];
}

@end

@implementation NSDictionary (SafeExpectations_Private)

- (NSString *)stringWithObject:(id)obj {
    NSString *string = obj;

    if (![string isKindOfClass:[NSString class]] && [string respondsToSelector:@selector(stringValue)])
        string = [string performSelector:@selector(stringValue)];

    if (![string isKindOfClass:[NSString class]])
        string = nil;

    return string;
}

- (NSNumber *)numberWithObject:(id)obj {

    if ([obj isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)obj;
    }

    if ([obj isKindOfClass:[NSString class]]) {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
        NSNumber *number = [formatter numberFromString:(NSString *)obj];
        return number;
    }

    return nil;
}

- (NSArray *)arrayWithObject:(id)obj {
    NSArray *array = obj;

    if (![array isKindOfClass:[NSArray class]]) {
        array = nil;
    }

    return array;
}

- (NSDictionary *)dictionaryWithObject:(id)obj {
    NSDictionary *dictionary = obj;

    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        dictionary = nil;
    }

    return dictionary;
}

@end
