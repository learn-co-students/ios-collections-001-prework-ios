//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSArray *)arrayBySortingArrayAscending:
    (NSArray *)arrayPreSort;

- (NSArray *)arrayBySortingArrayDescending:
    (NSArray *)arrayPreSort;

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:
    (NSArray *)arrayPreSwap;

- (NSArray *)arrayByReversingArray:
    (NSArray *)arrayPreReverse;

- (NSString *)stringInBasicLeetFromString:
    (NSString *)initialString;

- (NSArray *)splitArrayIntoNegativesAndPositives:
    (NSArray *)preSplitArray;

- (NSArray *)namesOfHobbitsInDictionary:
    (NSDictionary *)hobbitList;

- (NSArray *)stringsBeginningWithAInArray:
    (NSArray *)initialArray;

- (NSInteger)sumOfIntegersInArray:
    (NSArray *)integerArray;

- (NSArray *)arrayByPluralizingStringsInArray:
    (NSArray *)initialArray;

- (NSDictionary *)countsOfWordsInString:
    (NSString *)wordToCount;

- (NSDictionary *)songsGroupedByArtistFromArray:
    (NSArray *)artistArray;

@end
