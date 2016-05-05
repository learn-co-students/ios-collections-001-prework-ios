//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 * Declare your methods here.
 
 */

-(NSArray *)arrayBySortingArrayAscending: (NSArray *)ascendingPrimes;

-(NSArray *)arrayBySortingArrayDescending: (NSArray *)descendingPrimes;

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray: (NSArray *)givenStrings;

-(NSArray *)arrayByReversingArray: (NSArray *)reverseArray;

-(NSString *)stringInBasicLeetFromString: (NSString *)subStrings;

-(NSArray *)splitArrayIntoNegativesAndPositives: (NSArray *)negPosArray;

-(NSArray *)namesOfHobbitsInDictionary: (NSDictionary *)middleEarth;

-(NSArray *)stringsBeginningWithAInArray: (NSArray *)aStrings;

-(NSInteger)sumOfIntegersInArray: (NSArray *)integersArray;

-(NSArray *)arrayByPluralizingStringsInArray: (NSArray *)stringsArray;

-(NSDictionary *)countsOfWordsInString: (NSString *)wordsString;

-(NSDictionary *)songsGroupedByArtistFromArray: (NSArray *)artistArray;


@end
