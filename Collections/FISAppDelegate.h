//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(NSArray*)arrayBySortingArrayAscending:(NSArray*)argument;
-(NSArray*)arrayBySortingArrayDescending:(NSArray*)argument;
-(NSArray*)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray*)argument;
-(NSArray*)arrayByReversingArray:(NSArray*)argument;
-(NSString*)stringInBasicLeetFromString:(NSString*)argument;
-(NSArray*)splitArrayIntoNegativesAndPositives:(NSArray*)argument;
-(NSArray*)namesOfHobbitsInDictionary:(NSDictionary*)argument;
-(NSArray*)stringsBeginningWithAInArray:(NSArray*)argument;
-(NSInteger)sumOfIntegersInArray:(NSArray*)argument;
-(NSArray*)arrayByPluralizingStringsInArray:(NSArray*)argument;
-(NSDictionary*)countsOfWordsInString:(NSString*)argument;
-(NSDictionary*)songsGroupedByArtistFromArray:(NSArray*)argument;

/**
 
 * Declare your methods here.
 
 */

@end
