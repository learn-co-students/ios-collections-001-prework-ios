//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(NSArray *)arrayBySortingArrayAscending:(NSArray*)arrayToSort;

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)arrayToSort;

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)arrayToSwap;

-(NSArray *)arrayByReversingArray:(NSArray *)arrayToReverse;

-(NSString *)stringInBasicLeetFromString:(NSString *)leetString;

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)negativeAndPositiveArray;

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbitDictionary;

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)arrayOfStrings;

-(NSInteger)sumOfIntegersInArray:(NSArray *)integerArray;

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)stringArray;

-(NSDictionary *)countsOfWordsInString:(NSString *)string;

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)songsArray;




@end
