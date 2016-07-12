//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)unsortedArray {
    
    NSSortDescriptor *ascending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray* sortedArray = [ unsortedArray sortedArrayUsingDescriptors:@[ascending] ];
    
    return sortedArray;
}

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)unsortedArray {
    
    NSSortDescriptor *descending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *sortedArray = [ unsortedArray sortedArrayUsingDescriptors:@[descending] ];
    
    return sortedArray;
}

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)unswappedArray {
    
    NSMutableArray *swappedArray = [unswappedArray mutableCopy];
    [swappedArray exchangeObjectAtIndex:0 withObjectAtIndex:[swappedArray count] - 1];
    
    return swappedArray;
}

- (NSArray *)arrayByReversingArray:(NSArray *)unreversedArray {
    
    return [[unreversedArray reverseObjectEnumerator] allObjects];
}

- (NSString *)stringInBasicLeetFromString:(NSString *)string {
    
    NSDictionary *leetDictionary = @{ @"a" : @"4",
                                      @"s" : @"5",
                                      @"i" : @"1",
                                      @"l" : @"1",
                                      @"e" : @"3",
                                      @"t" : @"7" };
    
    NSMutableString *leetString = [string mutableCopy];
    
    for (NSString *letter in leetDictionary) {
        [leetString replaceOccurrencesOfString:letter withString:leetDictionary[letter] options:0 range:NSMakeRange(0, [string length])];
    }
    
    return leetString;
}

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)arrayToBisect {
    
    NSPredicate *negative = [NSPredicate predicateWithFormat:@"self < 0"];
    NSPredicate *positive = [NSPredicate predicateWithFormat:@"self >= 0"];
    
    NSArray *combinedArray = @[ [arrayToBisect filteredArrayUsingPredicate:negative],
                                [arrayToBisect filteredArrayUsingPredicate:positive] ];
    
    return combinedArray;
}

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)adventurerDictionary {
    
    NSMutableArray *hobbitNames = [[NSMutableArray alloc] init];
    
    for (NSString *name in adventurerDictionary) {
        if ([adventurerDictionary[name] isEqualToString:@"hobbit"]) {
            [hobbitNames addObject:name];
        }
    }
    
    return hobbitNames;
}

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)stringArray {
    
    NSPredicate *beginsWithA = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *onlyStartsWithA = [stringArray filteredArrayUsingPredicate:beginsWithA];
    
    return onlyStartsWithA;
}

- (NSInteger)sumOfIntegersInArray:(NSArray *)integerArray {
    
    NSInteger sumOfArray = 0;
    
    for (NSNumber *num in integerArray) {
        sumOfArray += [num integerValue];
    }
    
    return sumOfArray;
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)singularArray {
    
    NSMutableArray *pluralArray = [[NSMutableArray alloc] init];
    
    for (NSString *word in singularArray) {
        if ([word isEqualToString:@"ox"]) {
            [pluralArray addObject:@"oxen"];
        } else if ([word hasSuffix:@"x"]) {
            [pluralArray addObject:[NSString stringWithFormat:@"%@es", word]];
        } else if ([word isEqualToString:@"foot"]) {
            [pluralArray addObject:@"feet"];
        } else if ([word hasSuffix:@"us"]) {
            [pluralArray addObject:[word stringByReplacingOccurrencesOfString:@"us" withString:@"i"]];
        } else if ([word hasSuffix:@"um"]) {
            [pluralArray addObject:[word stringByReplacingOccurrencesOfString:@"um" withString:@"a"]];
        } else {
            [pluralArray addObject:[NSString stringWithFormat:@"%@s", word]];
        }
    }
    
    return pluralArray;
}

- (NSDictionary *)countsOfWordsInString:(NSString *)statement {
    
    NSMutableString *cleanedStatement = [[[statement stringByReplacingOccurrencesOfString:@"." withString:@""] lowercaseString] mutableCopy];
    [cleanedStatement replaceOccurrencesOfString:@"-" withString:@"" options:0 range:NSMakeRange(0, [cleanedStatement length])];
    [cleanedStatement replaceOccurrencesOfString:@"," withString:@"" options:0 range:NSMakeRange(0, [cleanedStatement length])];
    [cleanedStatement replaceOccurrencesOfString:@";" withString:@"" options:0 range:NSMakeRange(0, [cleanedStatement length])];
    [cleanedStatement replaceOccurrencesOfString:@"?" withString:@"" options:0 range:NSMakeRange(0, [cleanedStatement length])];
    
    NSArray *wordsArray = [cleanedStatement componentsSeparatedByString:@" "];
    
    NSMutableDictionary *countOfWords = [[NSMutableDictionary alloc] init];
    
    for (NSString *word in wordsArray) {
        if ([[countOfWords allKeys] containsObject:word]) {
            countOfWords[word] = @([countOfWords[word] integerValue] + 1);
        } else {
            countOfWords[word] = @1;
        }
    }
    
    return countOfWords;
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)songArray {
    
    NSArray *artistAndSong = @[];
    NSMutableDictionary *groupedSongs = [[NSMutableDictionary alloc] init];
    NSSortDescriptor *sortByName = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    
    for (NSString *fullSong in songArray) {
        artistAndSong = [fullSong componentsSeparatedByString:@" - "];
        if ([[groupedSongs allKeys] containsObject:artistAndSong[0]]) {
            [groupedSongs[artistAndSong[0]] addObject:artistAndSong[1]];
        } else {
            groupedSongs[artistAndSong[0]] = [[NSMutableArray alloc] initWithObjects:artistAndSong[1], nil];
        }
        
        [groupedSongs[artistAndSong[0]] sortUsingDescriptors:@[sortByName]];
    }
    
    return groupedSongs;
}

@end
