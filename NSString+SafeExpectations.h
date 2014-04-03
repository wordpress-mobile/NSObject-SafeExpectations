//
//  NSString+SafeExpectations.h
//  NSObject+SafeExpectationsTests
//
//  Created by Jorge Bernal on 03/04/14.
//
//

#import <Foundation/Foundation.h>

/**
 Additions to NSString
 */
@interface NSString (SafeExpectations)

/**
 Returns the passed object if it's a string

 If obj is a number it will be converted to a string and returned

 @param obj the object to return
 @return obj if it's a string or can be converted to one, otherwise it return nil
 */
+ (instancetype)se_stringWithObject:obj;

@end
