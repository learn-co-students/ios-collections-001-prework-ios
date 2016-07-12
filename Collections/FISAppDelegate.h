//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 * Declare your methods here.
 
 */

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)arrayInput;

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)arrayInput;

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)arrayInput;

- (NSArray *)arrayByReversingArray:(NSArray *)arrayInput;

- (NSString *)stringInBasicLeetFromString:(NSString *)stringInput;

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)arrayInput;

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)database;

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)arrayInput;

- (NSInteger)sumOfIntegersInArray:(NSArray *)arrayInput;

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)arrayInput;

- (NSDictionary *)countsOfWordsInString:(NSString *)stringInput;

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)arrayInput;


@end
