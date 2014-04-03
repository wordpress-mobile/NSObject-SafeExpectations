#import "NSObject+SafeExpectations.h"

static NSNumberFormatter *SENumberFormatter;

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

@implementation NSArray (SafeExpectations)

+ (instancetype)se_arrayWithObject:(id)obj {
    NSArray *array = obj;

    if (![array isKindOfClass:[NSArray class]]) {
        array = nil;
    }

    return array;
}

@end