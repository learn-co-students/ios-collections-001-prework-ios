//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)unsortedArray;
- (NSArray *)arrayBySortingArrayDescending:(NSArray *)unsortedArray;
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)unswappedArray;
- (NSArray *)arrayByReversingArray:(NSArray *)unreversedArray;
- (NSString *)stringInBasicLeetFromString:(NSString *)string;
- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)arrayToBisect;
- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)adventurerDictionary;
- (NSArray *)stringsBeginningWithAInArray:(NSArray *)stringArray;
- (NSInteger)sumOfIntegersInArray:(NSArray *)integerArray;
- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)singularArray;
- (NSDictionary *)countsOfWordsInString:(NSString *)statement;
- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)songArray;

@end
