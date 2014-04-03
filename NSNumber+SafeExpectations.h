//
//  NSNumber+SafeExpectations.h
//  NSObject+SafeExpectationsTests
//
//  Created by Jorge Bernal on 03/04/14.
//
//

#import <Foundation/Foundation.h>

/**
 Additions to NSNumber
 */
@interface NSNumber (SafeExpectations)

/**
 Returns the passed object if it's a number

 If obj is a string that can be parsed as a number, it will be converted and returned

 @param obj the object to return
 @return obj if it's a number or can be converted to one, otherwise it return nil
 */
+ (instancetype)se_numberWithObject:obj;

@end
