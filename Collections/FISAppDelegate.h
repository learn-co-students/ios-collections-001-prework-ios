//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//Return new array equal to the original array sorted in ascending order
- (NSArray *)arrayBySortingArrayAscending:(NSArray *)a;

//Return new array equal to the original array sorted in descending order
- (NSArray *)arrayBySortingArrayDescending:(NSArray *)a;

//Return new array with first and last objects of original array swapped
//Leave empty array unchanged
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)a;

//Return new array equal to original array reversed
- (NSArray *)arrayByReversingArray:(NSArray *)a;

//Replace certain letters with numbers according to hard-coded mapping and return new string
- (NSString *)stringInBasicLeetFromString:(NSString *)str;

//Return an array with two sub-arrays, the first with all the negative numbers in the argument array, and the second with all the non-negative (zero and positive) numbers.
- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)a;

//Return array containing keys (names) from dict where value is "hobbit"
- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dict;

//Return array containing members of array that begin with 'a', ignoring case and diacritical marks
- (NSArray *)stringsBeginningWithAInArray:(NSArray *)a;

//Return sum of integers in array
- (NSInteger)sumOfIntegersInArray:(NSArray *)a;

//Return array of words converted into their correct plural forms:
//  * If word is "ox", plural is "oxen"
//  * Else if word is "goose" or "foot", replace 'oo' with 'ee'
//  * Else if word ends in 'um', plural ends in 'a'
//  * Else if word ends in 'ius', plural ends in 'ii'
//  * Else if singular ends in y, plural is -ies
//  * Else if singular ends in s, plural adds -es
//  * Default: add -s
- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)a;

//Return a dictionary that has a key for each word in the submitted string, whose associated value is the count of how many times that word appears in the argument string. Remove punctuation and ignore capitalization.
//Note: my implementation doesn't strip apostrophes or other punctuation that appears in the middle of a word
- (NSDictionary *)countsOfWordsInString:(NSString *)str;

//Takes an array of strings of the form "Artist - Title" and should return a dictionary containing a key for each artist, whose value is an array of strings containing song names by that artist. 
- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)a;

@end
