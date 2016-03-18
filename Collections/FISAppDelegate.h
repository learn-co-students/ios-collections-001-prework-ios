//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)ascArray;

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)descArray;

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)objectArray;

- (NSArray *)arrayByReversingArray:(NSArray *)reverseArray;

- (NSString *)stringInBasicLeetFromString:(NSString *)leetString;

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)splitArray;

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbitsDictionary;

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)aInArray;

- (NSInteger)sumOfIntegersInArray:(NSArray *)integersArray;

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)pluralsArray;

- (NSDictionary *)countsOfWordsInString:(NSString *)countsString;

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)songsArray;

@end
