//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//__block FISAppDelegate *appDelegate;


-(NSArray *)arrayBySortingArrayAscending:(NSArray *) chaoticPrimes;
-(NSArray *)arrayBySortingArrayDescending:(NSArray *)chaoticPrimes;
-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array;
-(NSArray *)arrayByReversingArray:(NSArray *)array;
-(NSString *)stringInBasicLeetFromString:(NSString *)string;
-(NSInteger )sumOfIntegersInArray:(NSArray *)chaoticPrimes;
-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)numbersToBisect;
-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)fellowshipOfTheRing;
-(NSArray *)stringsBeginningWithAInArray:(NSArray *)foodsBeginningWithA;
-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)singularArray;
-(NSDictionary *)countsOfWordsInString:(NSString *)string;
-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)songsByArtist;



@end
