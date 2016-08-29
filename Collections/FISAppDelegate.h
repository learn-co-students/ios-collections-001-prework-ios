//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSArray *) arrayBySortingArrayAscending: (NSArray *) array1;
- (NSArray *) arrayBySortingArrayDescending: (NSArray *) array1;
- (NSArray *) arrayBySwappingFirstObjectWithLastObjectInArray: (NSArray *) array1;
- (NSArray *) arrayByReversingArray: (NSArray *) array1;
- (NSString *) stringInBasicLeetFromString: (NSString *) string1;
- (NSArray *) splitArrayIntoNegativesAndPositives: (NSArray *) array1;
- (NSArray *) namesOfHobbitsInDictionary: (NSDictionary *) dictionary1;
- (NSArray *) stringsBeginningWithAInArray: (NSArray *) array1;
- (NSInteger) sumOfIntegersInArray: (NSArray *) array1;
- (NSArray *) arrayByPluralizingStringsInArray: (NSArray *) array1;
- (NSDictionary *) countsOfWordsInString: (NSString *) string1;
- (NSDictionary *) songsGroupedByArtistFromArray: (NSArray *) array1;

@end
