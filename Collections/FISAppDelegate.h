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
//1
- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array;
//2
- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array;
//3
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array;
//4
- (NSArray *)arrayByReversingArray:(NSArray *)array;
//5
- (NSString *)stringInBasicLeetFromString:(NSString *)string;
//6
- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array;
//7
- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary;
//8
- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array;
//9
- (NSInteger)sumOfIntegersInArray:(NSArray *)array;
//10
- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array;
//11
- (NSDictionary *)countsOfWordsInString:(NSString *)string;
//12
- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array;

@end
