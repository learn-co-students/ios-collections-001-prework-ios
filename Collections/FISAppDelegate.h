//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 * Declare your methods here.
 
 */


-(NSArray *)arrayBySortingArrayAscending:(NSArray*)arrayA;
-(NSArray *)arrayBySortingArrayDescending:(NSArray*)arrayD;
-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray*)arraySwap;
-(NSArray *)arrayByReversingArray:(NSArray *)arrayRe;
-(NSString *)stringInBasicLeetFromString:(NSString *)stringBasic;
-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)arraySplit;
-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)nameD;
-(NSArray *)stringsBeginningWithAInArray:(NSArray *)arrayB;
-(NSInteger *)sumOfIntegersInArray:(NSArray *)array;
-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array;
-(NSDictionary *)countsOfWordsInString:(NSString *)string;
-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array;



@end
