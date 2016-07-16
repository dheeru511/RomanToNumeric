//
//  Model.h
//  RomanToNumeric
//
//  Created by Dheeraj Singh on 10/1/15.
//  Copyright © 2015 Dheeraj Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject


// init method to instantiate roman dictionary which is used in instance method "numericValueforRomanString"

-(BOOL)isRomanStringValid:(NSString *)string;

// accepts roman string and returns equivalent numeric values

-(NSNumber *)numericValueforRomanString:(NSString *)romanString;

// method to validate if the roman string is valid

-(instancetype)initWithRomanDict;


@end
