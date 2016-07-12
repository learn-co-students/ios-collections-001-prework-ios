//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)arrayToSortAsc;
- (NSArray *)arrayBySortingArrayDescending:(NSArray *)arrayToSortDesc;
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)arrayToSwapObjs;
- (NSArray *)arrayByReversingArray:(NSArray *)arrayToReverse;
- (NSString *)stringInBasicLeetFromString:(NSString *)basicLeetString;
- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)arrayToSplit;
- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbitDictonary;
- (NSArray *)stringsBeginningWithAInArray:(NSArray *)arrayWithLetterAs;
- (NSInteger)sumOfIntegersInArray:(NSArray *)arrayForSum;
- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)arrayWithStrToPluralize;
- (NSDictionary *)countsOfWordsInString:(NSString *)stringForWordCount;
- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)arrayWithSongsToBeGrouped;

@end
