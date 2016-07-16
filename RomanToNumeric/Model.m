//
//  Model.m
//  RomanToNumeric
//
//  Created by Dheeraj Singh on 10/1/15.
//  Copyright © 2015 Dheeraj Singh. All rights reserved.
//

#import "Model.h"

@interface Model()

@property (strong,nonatomic) NSDictionary * romanDict;

@end

@implementation Model

// init method to instantiate roman dictionary which is used in instance method "numericValueforRomanString"

-(instancetype)initWithRomanDict
{
    self=[super init];
    self.romanDict=@{@"I":@1,@"V":@5,@"X":@10,@"L":@50,@"C":@100,@"D":@500,@"M":@1000};
    return self;
}

// accepts roman string and returns equivalent numeric values

-(NSNumber *)numericValueforRomanString:(NSString *)romanString
{
    
    NSUInteger stringLength=[romanString length];
    
    NSNumber * numericValue=[self.romanDict objectForKey:[NSString stringWithFormat:@"%c", [romanString characterAtIndex:(stringLength-1)]]];
    
    for (NSUInteger i=1 ; i<=stringLength-1; i++) {
        NSNumber * first = [self.romanDict objectForKey:[NSString stringWithFormat:@"%c", [romanString characterAtIndex:(stringLength-i)]]];
        NSNumber * second = [self.romanDict objectForKey:[NSString stringWithFormat:@"%c", [romanString characterAtIndex:(stringLength-i-1)]]];
        if (first > second) {
            numericValue=@([numericValue intValue]-[second intValue]);
        }else{
            numericValue=@([numericValue intValue]+[second intValue]);
        }
    }
    
    return numericValue;
    
}

// method to validate if the roman string is valid

-(BOOL)isRomanStringValid:(NSString *)string
{
    NSMutableCharacterSet *set = [NSMutableCharacterSet characterSetWithCharactersInString:@"IVXLCDM"];
    if ([string rangeOfCharacterFromSet:[set invertedSet]].location == NSNotFound) {
        return YES;
    } else {
        return NO;
    }
    
}

@end
