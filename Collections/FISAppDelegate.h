//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//arrayBySortingArrayAscending: that takes one NSArray argument and returns and NSArray.
//arrayBySortingArrayDescending: that takes one NSArray argument and returns an NSArray.
//arrayBySwappingFirstObjectWithLastObjectInArray: that takes one NSArray argument and returns an NSArray.
//arrayByReversingArray: that takes one NSArray argument and returns an NSArray.
//stringInBasicLeetFromString: that takes one NSString argument and returns an NSString.
//splitArrayIntoNegativesAndPositives: that takes one NSArray argument and returns an NSArray.
//namesOfHobbitsInDictionary: that takes one NSDictionary argument and returns an NSArray.
//stringsBeginningWithAInArray: that takes one NSArray argument and returns an NSArray.
//sumOfIntegersInArray: that takes one NSArray argument and returns an NSInteger.
//arrayByPluralizingStringsInArray: that takes one NSArray argument and returns an NSArray.
//countsOfWordsInString: that takes one NSString argument and returns an NSDictionary.
//songsGroupedByArtistFromArray: that takes one NSArray argument and returns an NSDictionary.

- (NSArray *)arrayBySortingArrayAscending: (NSArray *)ascendingPrimes;
- (NSArray *)arrayBySortingArrayDescending: (NSArray *)descendingPrimes;
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray: (NSArray *)givenStrings;
- (NSArray *)arrayByReversingArray: (NSArray *)reverseArray;
- (NSString *)stringInBasicLeetFromString: (NSString *)subStrings;
- (NSArray *)splitArrayIntoNegativesAndPositives: (NSArray *)negPosArray;
- (NSArray *)namesOfHobbitsInDictionary: (NSDictionary *)middleEarth;
- (NSArray *)stringsBeginningWithAInArray: (NSArray *)aStrings;
- (NSInteger)sumOfIntegersInArray: (NSArray *)integersArray;
- (NSArray *)arrayByPluralizingStringsInArray: (NSArray *)stringsArray;
- (NSDictionary *)countsOfWordsInString: (NSString *)wordsString;
- (NSDictionary *)songsGroupedByArtistFromArray: (NSArray *)artistArray;





@end
