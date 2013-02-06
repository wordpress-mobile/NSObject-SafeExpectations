//
//  NSDictionary+SafeExpectations.h
//  NSObject-SafeExpectationsTests
//
//  Created by Jorge Bernal on 2/6/13.
//
//

#import "NSObject+SafeExpectations.h"

@interface NSDictionary (SafeExpectations)

/**
 Returns a NSNumber value for the specified key. If the result is not a NSNumber and can't converted to one, it returns nil
 */
- (NSString *)stringForKey:(id)key;

/**
 Returns a NSString value for the specified key. If the result is not a NSString and can't converted to one, it returns nil
 */
- (NSNumber *)numberForKey:(id)key;

- (NSArray *)arrayForKey:(id)key;
- (NSDictionary *)dictionaryForKey:(id)key;

- (id)objectForKeyPath:(NSString *)keyPath;

- (NSString *)stringForKeyPath:(id)keyPath;
- (NSNumber *)numberForKeyPath:(id)keyPath;
- (NSArray *)arrayForKeyPath:(id)keyPath;
- (NSDictionary *)dictionaryForKeyPath:(id)keyPath;


@end
