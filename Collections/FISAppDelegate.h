//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)ascending;

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)descending;

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)swapFirstForLast;

-(NSArray *)arrayByReversingArray:(NSArray *)reversedArray;

-(NSString *)stringInBasicLeetFromString:(NSString *)basicLeetString;

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)negativePositiveSplitArray;

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbits;

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)arrayOfStringsBeginningWithA;

-(NSInteger)sumOfIntegersInArray:(NSArray *)arrayOfIntegers;

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)stringsInArray;

-(NSDictionary *)countsOfWordsInString:(NSString *)wordsInString;

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)arrayOfSongs;

@end
