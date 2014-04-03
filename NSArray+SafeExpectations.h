//
//  NSArray+SafeExpectations.h
//  NSObject+SafeExpectationsTests
//
//  Created by Jorge Bernal on 03/04/14.
//
//

#import <Foundation/Foundation.h>

/**
 Additions to NSArray
 */
@interface NSArray (SafeExpectations)

/**
 Returns the passed object if it's an array

 @param obj the object to return
 @return obj if it's an array, otherwise it return nil
 */
+ (instancetype)se_arrayWithObject:obj;

@end
