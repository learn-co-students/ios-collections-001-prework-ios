//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


//arrayBySortingArrayAscending: that takes one NSArray argument and returns and NSArray.
-(NSArray *)arrayBySortingArrayAscending : (NSArray *)array;

//arrayBySortingArrayDescending: that takes one NSArray argument and returns an NSArray.
-(NSArray *)arrayBySortingArrayDescending : (NSArray *)array;

//arrayBySwappingFirstObjectWithLastObjectInArray: that takes one NSArray argument and returns an NSArray.
-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray : (NSArray *)array;

//arrayByReversingArray: that takes one NSArray argument and returns an NSArray.
-(NSArray *)arrayByReversingArray : (NSArray *)array;

//stringInBasicLeetFromString: that takes one NSString argument and returns an NSString.
-(NSString *)stringInBasicLeetFromString : (NSString *)string;

//splitArrayIntoNegativesAndPositives: that takes one NSArray argument and returns an NSArray.
-(NSArray *)splitArrayIntoNegativesAndPositives : (NSArray *)array;

//namesOfHobbitsInDictionary: that takes one NSDictionary argument and returns an NSArray.
-(NSArray *)namesOfHobbitsInDictionary : (NSDictionary *)dictionary;

//stringsBeginningWithAInArray: that takes one NSArray argument and returns an NSArray.
-(NSArray *)stringsBeginningWithAInArray : (NSArray *)array;

//sumOfIntegersInArray: that takes one NSArray argument and returns an NSInteger.
-(NSInteger)sumOfIntegersInArray : (NSArray *)array;

//arrayByPluralizingStringsInArray: that takes one NSArray argument and returns an NSArray.
-(NSArray *)arrayByPluralizingStringsInArray : (NSArray *)array;

//countsOfWordsInString: that takes one NSString argument and returns an NSDictionary.
-(NSDictionary *)countsOfWordsInString : (NSString *)string;

//songsGroupedByArtistFromArray: that takes one NSArray argument and returns an NSDictionary.
-(NSDictionary *)songsGroupedByArtistFromArray : (NSArray *)array;

@end
