//
//  FISCollectionsSpec.m
//  Collections
//
//  Created by Chris Gonzales on 5/30/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#import "FISCollections.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "KIF.h"
#import "Swizzlean.h"

SpecBegin(FISCollections)

describe(@"FISCollections", ^{
    __block FISCollections *collection;
    
    beforeAll(^{
        collection = [[FISCollections alloc] init];
    });
    
    it(@"", ^{

    });  
    
});

SpecEnd
