//
//  NSDictionary+SafeExpectations.h
//  NSObject-SafeExpectationsTests
//
//  Created by Jorge Bernal on 2/6/13.
//
//

#import "NSObject+SafeExpectations.h"

/**
 Additions to NSDictionary
 */
@interface NSDictionary (SafeExpectations)

/**
 Returns a NSString value for the specified key.
 
 @param key The key for which to return the corresponding value
 @returns the resulting string. If the result is not a NSString and can't converted to one, it returns nil
 */
- (NSString *)se_stringForKey:(id)key;

/**
 Returns a NSNumber value for the specified key.
 
 @param key The key for which to return the corresponding value
 @returns the resulting number. If the result is not a NSNumber and can't converted to one, it returns nil
 */
- (NSNumber *)se_numberForKey:(id)key;

/**
 Returns a NSArray value for the specified key.
 
 @param key The key for which to return the corresponding value
 @returns the resulting array. If the result is not a NSArray, it returns nil
 */
- (NSArray *)se_arrayForKey:(id)key;

/**
 Returns a NSDictionary value for the specified key. 
 
 @param key The key for which to return the corresponding value
 @returns the resulting dictionary. If the result is not a NSDictionary, it returns nil
 */
- (NSDictionary *)se_dictionaryForKey:(id)key;

/**
 Returns an object for the specified keyPath

 @param keyPath A key path of the form relationship.property (with one or more relationships); for example “department.name” or “department.manager.lastName”
 @returns The value for the derived property identified by keyPath. If the keyPath is not valid, it returns nil
 */
- (id)se_objectForKeyPath:(NSString *)keyPath;

/**
 Returns an object for the specified keyPath

 @param keyPath A key path of the form relationship.property, see se_objectForKeyPath:
 @returns The value for the derived property identified by keyPath. If the keyPath is not valid or the result is not a NSString or can't be converted to one, it returns nil
 */
- (NSString *)se_stringForKeyPath:(id)keyPath;

/**
 Returns an object for the specified keyPath

 @param keyPath A key path of the form relationship.property, see se_objectForKeyPath:
 @returns The value for the derived property identified by keyPath. If the keyPath is not valid or the result is not a NSNumber or can't be converted to one, it returns nil
 */
- (NSNumber *)se_numberForKeyPath:(id)keyPath;

/**
 Returns an object for the specified keyPath

 @param keyPath A key path of the form relationship.property, see se_objectForKeyPath:
 @returns The value for the derived property identified by keyPath. If the keyPath is not valid or the result is not a NSArray, it returns nil
 */
- (NSArray *)se_arrayForKeyPath:(id)keyPath;

/**
 Returns an object for the specified keyPath

 @param keyPath A key path of the form relationship.property, see se_objectForKeyPath:
 @returns The value for the derived property identified by keyPath. If the keyPath is not valid or the result is not a NSDictionary, it returns nil
 */
- (NSDictionary *)se_dictionaryForKeyPath:(id)keyPath;

/**
 Returns the passed object if it's a dictionary

 @param obj the object to return
 @return obj if it's a dictionary, otherwise it return nil
 */
+ (instancetype)se_dictionaryWithObject:obj;

@end
