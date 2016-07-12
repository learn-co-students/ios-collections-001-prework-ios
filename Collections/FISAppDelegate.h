//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 * Declare your methods here.
 
 */

// should return the objects in the submitted array arranged from low to high.
- (NSArray *)arrayBySortingArrayAscending: (NSArray *)argument;

// should return the objects in the submitted array arranged from high to low.
- (NSArray *)arrayBySortingArrayDescending: (NSArray *)argument;

// should return an array that's like the submitted array, but with first and last objects switched with each other.
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray: (NSArray *)argument;

// should return an array that is the reverse of the submitted array. Hint: Try swapping objects moving in from the beginning and the end.
- (NSArray *)arrayByReversingArray: (NSArray *)argument;

// should convert the following substrings in the submitted string:
// "a" to "4",
// "s" to "5",
// "i" to "1",
// "l" to "1",
// "e" to "3", and
// "t" to "7".
- (NSString *)stringInBasicLeetFromString: (NSString *)argument;

//  should return an array with two sub-arrays, the first with all the negative numbers in the argument array, and the second with all the non-negative (zero and positive) numbers.
- (NSArray *)splitArrayIntoNegativesAndPositives: (NSArray *)argument;

//  should return an array containing the keys (i.e., character names) from the given dictionary whose value is "hobbit".
- (NSArray *)namesOfHobbitsInDictionary: (NSDictionary *)argument;

// should return an array containing the strings from the given array begin with the letter "a".
- (NSArray *)stringsBeginningWithAInArray: (NSArray *)argument;

// should add together all of the numbers in the submitted array and return the sum.
- (NSInteger)sumOfIntegersInArray: (NSArray *)argument;

// should convert the different strings into their correct plural forms. This is more complex than just adding an "s"; you'll have to run checks on the strings so be sure look at the test arrays so that you know the expected plural forms.
- (NSArray *)arrayByPluralizingStringsInArray: (NSArray *)argument;

// should return a dictionary that has a key for each word in the submitted string, whose associated value is the count of how many times that word appears in the argument string. Be sure to remove the punctuation (.,-;) and ignore capitalization. For example, if given the string "I think, I thought; I think I.", the method should return @{ @"i": @4, @"think": @2, @"thought": @1 }.
- (NSDictionary *)countsOfWordsInString: (NSString *)argument;

// takes an array of strings of the form "Artist - Title" and should return a dictionary containing a key for each artist, whose value is an array of strings containing song names by that artist. You'll have to split each string and arrange its information into the correct place in the nested data structure. Be sure to alphabetize the arrays of songs before returning the dictionary. If you're using mutable arrays inside the dictionary, you can use the sortUsingDescriptors: method.
- (NSDictionary *)songsGroupedByArtistFromArray: (NSArray *)argument;

@end
