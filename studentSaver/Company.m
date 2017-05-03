//
//  Company.m
//  studentSaver
//
//  Created by Michael Sereiko on 5/2/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "Company.h"

@implementation Company

-(id) init{
    self = [super init];
    return self;
}

-(id) initWithTicker:(NSString *)symbol{
    self = [super init];
    if(self){
        NSLog(@"Created");
        self.ticker = symbol;
        self.currentPrice = @"$143.28";
        self.dayHigh = 146.67;
        self.dayLow = 141.23;
        self.name = @"Apple Inc.";
        self.priceChange = @"+0.93 \t +0.63%";
    }
    return self;
}

@end
