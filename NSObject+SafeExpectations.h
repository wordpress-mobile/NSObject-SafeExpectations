//
//  NSObject_SafeExpectations.h
//  NSObject-SafeExpectationsTests
//
//  Created by Jorge Bernal on 2/6/13.
//
//

#import <Foundation/Foundation.h>
#import "NSDictionary+SafeExpectations.h"

#if !defined(NSSE_USE_ASSERTIONS)
#define NSSEAssert(cond,desc,...) NSAssert(cond,desc,##__VA_ARGS__)
#else
#define NSSEAssert(cond,desc,...) do {} while (0)
#endif // NSSE_USE_ASSERTIONS

@interface NSString (SafeExpectations)
/**
 Returns the passed object if it's a string

 If obj is a number it will be converted to a string and returned

 @param obj the object to return
 @return obj if it's a string or can be converted to one, otherwise it return nil
 */
+ (instancetype)se_stringWithObject:obj;
@end

@interface NSNumber (SafeExpectations)
/**
 Returns the passed object if it's a number

 If obj is a string that can be parsed as a number, it will be converted and returned

 @param obj the object to return
 @return obj if it's a number or can be converted to one, otherwise it return nil
 */
+ (instancetype)se_numberWithObject:obj;
@end

@interface NSArray (SafeExpectations)
/**
 Returns the passed object if it's an array

 @param obj the object to return
 @return obj if it's an array, otherwise it return nil
 */
+ (instancetype)se_arrayWithObject:obj;
@end
