//
//  FISAppDelegate.h
//  Collections
//
//  Created by Chris Gonzales on 5/30/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 * Declare your methods here.
 
 */

-(NSArray *)arrayByAscendingSortingArray:(NSArray *)array;
-(NSArray *)arrayByDescendingSortingArray:(NSArray *)array;
-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array;
-(NSArray *)arrayByReversingArray:(NSArray *)array;

-(NSString *)stringInBasicLeetFromString:(NSString *)string;
-(NSArray *)bisectArrayAt0:(NSArray *)array;
-(NSArray *)arrayByFilteringHobbitsFromDictionary:(NSDictionary *)dictionary;
-(NSArray *)arrayByFilteringStringsBeginningWithA:(NSArray *)array;

-(NSInteger)sumOfIntegerNumbersInArray:(NSArray *)array;
-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array;
-(NSDictionary *)countsOfWordsInString:(NSString *)string;
-(NSDictionary *)dictionaryOfSongsByArtistFromArray:(NSArray *)array;


@end
