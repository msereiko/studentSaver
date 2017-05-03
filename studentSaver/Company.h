//
//  Company.h
//  studentSaver
//
//  Created by Michael Sereiko on 5/2/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Company : NSObject

@property NSString *name; 
@property NSString *ticker;
@property NSString *priceChange;
@property NSString *currentPrice;
@property double dayHigh;
@property double dayLow;


-(id) init;

-(id) initWithTicker: (NSString *)ticker;

@end
