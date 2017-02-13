//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 * Declare your methods here.
 
 */

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array;
-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array;
-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array;
-(NSArray *)arrayByReversingArray:(NSArray *)array;

-(NSString *)stringInBasicLeetFromString:(NSString *)string;
-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array;
-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary;
-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array;

-(NSInteger)sumOfIntegersInArray:(NSArray *)array;
-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array;
-(NSDictionary *)countsOfWordsInString:(NSString *)string;
-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array;

@end
