//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}
// 1 - return the objects in the submitted array arranged from low to high.
- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    
    NSSortDescriptor *sortedAscendingDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                                ascending:YES];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortedAscendingDescriptor]];
                            
    return sortedArray;
}
// 2 - return the objects in the submitted array arranged from high to low.
- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    
    NSSortDescriptor *sortedAscendingDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                                ascending:NO];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortedAscendingDescriptor]];
    
    return sortedArray;
}
// 3 - return an array that's like the submitted array, but with first and last objects switched with each other.
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
   
    NSMutableArray *newArray = [array mutableCopy];
    newArray[0] = array[[array count] - 1];
    newArray[[newArray count] - 1 ] = array[0];
    
    return newArray;
}
// 4 - return an array that is the reverse of the submitted array. Hint: Try swapping objects moving in from the beginning and the end.
- (NSArray *)arrayByReversingArray:(NSArray *)array {
    
    NSMutableArray *reversedArray = [[NSMutableArray alloc] init];
    for (NSInteger i = [array count] - 1; i >= 0; i--) {
        [reversedArray addObject:array[i]];
    }
    return reversedArray;
}
// 5 - convert the substrings in the submitted string:

- (NSString *)stringInBasicLeetFromString:(NSString *)string {
    
    NSDictionary *newStrings = @{
                                  @"a" : @"4",
                                  @"s" : @"5",
                                  @"i" : @"1",
                                  @"l" : @"1",
                                  @"e" : @"3",
                                  @"t" : @"7"
                                  };
    
    for (NSString *key in newStrings) {
        string = [string stringByReplacingOccurrencesOfString:key withString:newStrings[key]];
    }
    return string;
}
// 6 - return an array with two sub-arrays, the first with all the negative numbers in the argument array, and the second with all the non-negative (zero and positive) numbers.
- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    
    NSMutableArray *positives = [[NSMutableArray alloc] init];
    NSMutableArray *negatives = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < array.count; i++) {
        if ([array[i] integerValue] < 0) {
            [negatives addObject:array[i]];
        } else {
            [positives addObject:array[i]];
        }
    }
    NSArray *negativesAndPositives = @[negatives,positives];
    return negativesAndPositives;
}

// 7 - return an array containing the keys (i.e., character names) from the given dictionary whose value is "hobbit".
- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary {
    NSMutableArray *hobbitsInDictionary = [[NSMutableArray alloc] init];
    for (NSString *name in dictionary) {
        if ([dictionary[name] isEqualToString:@"hobbit"]) {
            [hobbitsInDictionary addObject:name];
        }
    }
    return hobbitsInDictionary;
}
// 8 - return an array containing the strings from the given array begin with the letter "a".
- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    
    NSPredicate *aPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *stringsBeginWithA = [array filteredArrayUsingPredicate:aPredicate];
    return stringsBeginWithA;
}
// 9 - add together all of the numbers in the submitted array and return the sum.
- (NSInteger)sumOfIntegersInArray:(NSArray *)array {
    NSInteger total = 0;
    for (NSNumber *item in array) {
        total += [item integerValue];
    }
    return total;
}

// 10 - convert the different strings into their correct plural forms. This is more complex than just adding an "s"; you'll have to run checks on the strings so be sure look at the test arrays so that you know the expected plural forms.
- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    
    NSDictionary *specialWords = @{@"radius"    :@"radii",
                                   @"foot"      :@"feet",
                                   @"trivium"   :@"trivia",
                                   @"ox"        :@"oxen"  };
    NSMutableArray *pluralStrings = [array mutableCopy];;
    
    for (NSInteger i = 0; i < array.count; i++) {
        if ([[specialWords allKeys]containsObject:pluralStrings[i]]) {
            pluralStrings[i] = specialWords[pluralStrings[i]];
        } else {
            if ([pluralStrings[i] hasSuffix:@"x"]){
                pluralStrings[i] = [pluralStrings[i] stringByAppendingString:@"es"];
            } else {
                pluralStrings[i] = [pluralStrings[i] stringByAppendingString:@"s"];
            }
        }
    }
    return pluralStrings;
}
// 11 - return a dictionary that has a key for each word in the submitted string, whose associated value is the count of how many times that word appears in the argument string. Be sure to remove the punctuation (.,-;) and ignore capitalization.
- (NSDictionary *)countsOfWordsInString:(NSString *)string {
    
    NSMutableArray *myStrings = [[NSMutableArray alloc]init];
    myStrings = [[[string lowercaseString] componentsSeparatedByCharactersInSet:
                [NSCharacterSet characterSetWithCharactersInString:@".-,; "]]mutableCopy];
    
    NSMutableArray *counts = [[NSMutableArray alloc]init];
    
    NSMutableDictionary *log = [[NSMutableDictionary alloc]init];
    
    for (NSUInteger i = 0; i < [myStrings count]; i++) {
        NSPredicate *punctuationPredicate = [NSPredicate predicateWithFormat:@"self == %@",myStrings[i]];
        counts[i] = [[myStrings filteredArrayUsingPredicate:punctuationPredicate ]mutableCopy];
        log[myStrings[i]] = @([counts[i] count]);
    }
    [log removeObjectForKey:@""];
    return log;
}


// 12 - takes an array of strings of the form "Artist - Title" and should return a dictionary containing a key for each artist, whose value is an array of strings containing song names by that artist. You'll have to split each string and arrange its information into the correct place in the nested data structure. Be sure to alphabetize the arrays of songs before returning the dictionary. If you're using mutable arrays inside the dictionary, you can use the sortUsingDescriptors: method.
- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    
    NSMutableDictionary *songsByArtist = [[NSMutableDictionary alloc] init];
    
    for (NSString *string in array) {
        NSArray *artistSong = [string componentsSeparatedByString:@" - "];
        NSArray *artist = artistSong[0];
        NSArray *song = artistSong[1];
        
        if ([[songsByArtist allKeys] containsObject:artist]) {
            [songsByArtist[artist] addObject:song];
        }
        else {
            songsByArtist[artist] = [[NSMutableArray alloc] init];
            [songsByArtist[artist] addObject:song];
        }
    }
    NSSortDescriptor *sortByNilAscending = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                         ascending:YES];
    for (NSString *artist in [songsByArtist allKeys]) {
        [songsByArtist[artist] sortUsingDescriptors:@[sortByNilAscending]];
    }
    return songsByArtist;
}

@end
