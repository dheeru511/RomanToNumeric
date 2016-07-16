//
//  ViewController.m
//  RomanToNumeric
//
//  Created by Dheeraj Singh on 10/1/15.
//  Copyright © 2015 Dheeraj Singh. All rights reserved.
//

#import "ViewController.h"
#include "Model.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *romanString;

@end

@implementation ViewController

// when clicked on button, triggers roman string to numeric value conversion
- (IBAction)convert:(id)sender {
    
    Model * model=[[Model alloc]initWithRomanDict];
    NSString * romanString=self.romanString.text;
    NSUInteger stringLength=[romanString length];
    
    if (stringLength) {
        if ([model isRomanStringValid:romanString]) {
            NSNumber * numericValue=[model numericValueforRomanString:romanString];
            [self postAlertWithMessage:[NSString stringWithFormat:@"Numeric Value: %@",numericValue]];
        }else{
            [self postAlertWithMessage:@"Roman String Entered is Not Valid"];
        }
    }else{
        
        [self postAlertWithMessage:@"Roman String cannot be empty"];
        
    }
    
}


// helper method. displays popup on UI with provided message
-(void)postAlertWithMessage:(NSString *)message
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Message"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* display = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {
                                                         
                                                         
                                                     }];
    [alert addAction:display];
    [self presentViewController:alert animated:YES completion:nil];
}



@end
