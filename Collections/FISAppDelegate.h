//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 * Declare your methods here.
 
 */

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array;
- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array;
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array;
- (NSArray *)arrayByReversingArray:(NSArray *)array;
- (NSString *)stringInBasicLeetFromString:(NSString *)string;
- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array;
- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbits;
- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array;
- (NSInteger)sumOfIntegersInArray:(NSArray *)array;
- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array;
- (NSDictionary *)countsOfWordsInString:(NSString *)string;
- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)songs;

@end
