//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

// return objects from submitted array from low to high
- (NSArray *)arrayBySortingArrayAscending:(NSArray *)arrayPreSort{
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *arrayAsc = [arrayPreSort sortedArrayUsingDescriptors:@[sortByNilAsc]];
    
    return arrayAsc;
}

// return objects from submitted array from high to low
- (NSArray *)arrayBySortingArrayDescending:(NSArray *)arrayPreSort{
    NSSortDescriptor *sortByNilDesc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *arrayDesc = [arrayPreSort sortedArrayUsingDescriptors:@[sortByNilDesc]];
    
    return arrayDesc;
}

// return array with the first and last objects swapped
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)arrayPreSwap{
    NSMutableArray *arrayPostSwap = [arrayPreSwap mutableCopy];
    arrayPostSwap[0] = arrayPreSwap[[arrayPreSwap count] - 1];
    arrayPostSwap[[arrayPreSwap count] - 1] = arrayPreSwap[0];
    
    return arrayPostSwap;
}

// return array that is reverse of submitted array
- (NSArray *)arrayByReversingArray:(NSArray *)arrayPreReverse{
    NSMutableArray *arrayPostSwap = [arrayPreReverse mutableCopy];
    
    for (NSUInteger i = 0; i < [arrayPostSwap count]; i++) {
        arrayPostSwap[i] = arrayPreReverse[[arrayPostSwap count] - i - 1];
    }
    
    return arrayPostSwap;
}

// convert substrings as follows: "a" to "4", "s" to "5", "i" to "1", "l" to "1", "e" to "3", "t" to "7"
- (NSString *)stringInBasicLeetFromString:(NSString *)initialString{
    
    NSString *search1 = [initialString stringByReplacingOccurrencesOfString:@"a" withString:@"4"];
    NSString *search2 = [search1 stringByReplacingOccurrencesOfString:@"s" withString:@"5"];
    NSString *search3 = [search2 stringByReplacingOccurrencesOfString:@"i" withString:@"1"];
    NSString *search4 = [search3 stringByReplacingOccurrencesOfString:@"l" withString:@"1"];
    NSString *search5 = [search4 stringByReplacingOccurrencesOfString:@"e" withString:@"3"];
    NSString *search6 = [search5 stringByReplacingOccurrencesOfString:@"t" withString:@"7"];
    
    return search6;
}

// return an array into two subarrays; the first should consist of negatives and the second of non-negatives
- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)preSplitArray{
    NSPredicate *negativePredicate = [NSPredicate predicateWithFormat:@"self < 0"];
    NSArray *negativeArray = [preSplitArray filteredArrayUsingPredicate:negativePredicate];
    
    NSPredicate *nonNegativePredicate = [NSPredicate predicateWithFormat:@"self >= 0"];
    NSArray *nonNegativeArray = [preSplitArray filteredArrayUsingPredicate:nonNegativePredicate];
    
    NSArray *splitArray = @[negativeArray,nonNegativeArray];
    
    return splitArray;
}

// return array containing character names (keys) from the hobbit dictionary
- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbitList{
    NSMutableArray *hobbitArray = [[NSMutableArray alloc] init];
    
    for (NSString *character in hobbitList){
        if([hobbitList[character] isEqualToString:@"hobbit"]){
            [hobbitArray addObject:character];
        }
    }
    
    return hobbitArray;
}
// return array containing strings beginning with letter "a"
- (NSArray *)stringsBeginningWithAInArray:(NSArray *)initialArray{
    NSPredicate *letterAPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *letterAArray = [initialArray filteredArrayUsingPredicate:letterAPredicate];
    
    return letterAArray;
}

// add together all numbers in submitted array and return the sum
- (NSInteger)sumOfIntegersInArray:(NSArray *)integerArray{
    NSInteger sumOfArray = 0;
    
    for (NSNumber *numberAsObject in integerArray){
        sumOfArray = sumOfArray + [numberAsObject integerValue];
    }
    
    return sumOfArray;
}

// pluralize strings in an array (hand, foot, knee, table, box, ox, axle, radius, trivium)
- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)initialArray{
    NSMutableArray *pluralStrings = [initialArray mutableCopy];
    
    for (NSUInteger i = 0; i < [initialArray count]; i++) {
        if ([initialArray[i] isEqualToString:@"foot"]) {
            pluralStrings[i] = @"feet";
        } else if ([initialArray[i] isEqualToString:@"box"]){
            pluralStrings[i] = @"boxes";
        } else if ([initialArray[i] isEqualToString:@"ox"]){
            pluralStrings[i] = @"oxen";
        } else if ([initialArray[i] isEqualToString:@"radius"]){
            pluralStrings[i] = @"radii";
        } else if ([initialArray[i] isEqualToString:@"trivium"]){
            pluralStrings[i] = @"trivia";
        } else {
            pluralStrings[i] = [initialArray[i] stringByAppendingString:@"s"];
        }
    }
    return pluralStrings;
}

// return dictionary where key is word from submitted string and value is word count from string
- (NSDictionary *)countsOfWordsInString:(NSString *)wordToCount{
    NSMutableCharacterSet *excludedCharacters = [NSMutableCharacterSet characterSetWithCharactersInString:@".;,- "];
    NSArray *adjustedWordToCount = [[wordToCount lowercaseString] componentsSeparatedByCharactersInSet:excludedCharacters];
    NSMutableArray *excludeSpacesWords = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < [adjustedWordToCount count]; i++) {
        if (![adjustedWordToCount[i] isEqualToString:@""]) {
            [excludeSpacesWords addObject:adjustedWordToCount[i]];
        }
    }
    
    NSMutableArray *wordArray = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < [excludeSpacesWords count]; i++) {
        if (![wordArray containsObject:excludeSpacesWords[i]]) {
            [wordArray addObject:excludeSpacesWords[i]];
        }
    }
    
    NSMutableDictionary *wordAndCountDictionary = [[NSMutableDictionary alloc] init];

    for (NSUInteger i = 0; i < [wordArray count]; i++) {
        NSInteger counter = 0;
        for (NSUInteger j = 0; j < [excludeSpacesWords count]; j++) {
            if ([excludeSpacesWords[j] isEqual:wordArray[i]]) {
                counter++;
            }
        }
        NSNumber *counterAsString = @(counter);
        [wordAndCountDictionary addEntriesFromDictionary:@{wordArray[i] : counterAsString}];
    }

    return wordAndCountDictionary;
}

// takes array of strings in form 'Artist - Title' and returns a dictionary containing a key for each artist, and an array
// of alphabetized string values containing songs by artist
- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)artistArray{
    
    // create new array with [artist, song] pair elements
    NSMutableArray *artistSongArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < [artistArray count]; i++) {
        NSArray *artistSongPair = [artistArray[i] componentsSeparatedByString:@" - "];
        [artistSongArray addObject:artistSongPair];
    }
    
    // create dictionary entries
    NSMutableArray *consolidatedArtistArray = [[NSMutableArray alloc] init];
    NSMutableDictionary *artistSongDictionary = [[NSMutableDictionary alloc] init];
    
    for (NSUInteger i = 0; i < [artistSongArray count]; i++) {
        NSMutableArray *songArray = [[NSMutableArray alloc] init];
        NSString *currentArtist = artistSongArray[i][0];
        
        // create new dictionary entry based on new artist
        if (![consolidatedArtistArray containsObject:currentArtist]) {
            [consolidatedArtistArray addObject:currentArtist];

            // create new song array with all the artists' songs
            for (NSUInteger j = i; j < [artistSongArray count]; j++) {
                if ([currentArtist isEqualToString:artistSongArray[j][0]]) {
                    [songArray addObject:artistSongArray[j][1]];
                }
            }
            
            // sort the song array alphabetically and then add the new dictionary entry
            NSSortDescriptor *sortBySongName = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
            NSArray *sortedSongArray = [songArray sortedArrayUsingDescriptors:@[sortBySongName]];
            [artistSongDictionary addEntriesFromDictionary:@{currentArtist : sortedSongArray}];
        }
    }
    
    return artistSongDictionary;
}

@end
