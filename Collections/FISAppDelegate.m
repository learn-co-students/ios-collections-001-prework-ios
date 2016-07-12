//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)arrayToSort {
    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *ascendingArray = [arrayToSort sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortByNameAsc]];
    
    return ascendingArray;
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)arrayToSort {
    NSSortDescriptor *sortByNameDes = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *descendingArray = [arrayToSort sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortByNameDes]];
    
    return descendingArray;
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)arrayToSwap {
    
    
    NSMutableArray *returnArray = [arrayToSwap mutableCopy];
    id firstObject = returnArray[0];
    id lastObject = [returnArray lastObject];
    
    [returnArray replaceObjectAtIndex:0 withObject:lastObject];
    [returnArray replaceObjectAtIndex:[returnArray count]-1 withObject:firstObject];
    return returnArray;
}

-(NSArray *)arrayByReversingArray:(NSArray *)arrayToReverse {
    return [[arrayToReverse reverseObjectEnumerator] allObjects];
    
    //    NSMutableArray *reverseArray = [@[] mutableCopy];
    //    NSUInteger lastIndex = [arrayToReverse count];
    //    for (NSUInteger i = lastIndex; i > 0; i--) {
    //        [reverseArray addObject:arrayToReverse[i-1]];
    //    }
    //    return reverseArray;
}

-(NSString *)stringInBasicLeetFromString:(NSString *)leetString {
    leetString = [leetString stringByReplacingOccurrencesOfString:@"a" withString:@"4"];
    leetString = [leetString stringByReplacingOccurrencesOfString:@"s" withString:@"5"];
    leetString = [leetString stringByReplacingOccurrencesOfString:@"i" withString:@"1"];
    leetString = [leetString stringByReplacingOccurrencesOfString:@"l" withString:@"1"];
    leetString = [leetString stringByReplacingOccurrencesOfString:@"e" withString:@"3"];
    leetString = [leetString stringByReplacingOccurrencesOfString:@"t" withString:@"7"];
    
    return leetString;
}

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)negativeAndPositiveArray {
    NSMutableArray *positiveNumbers = [@[] mutableCopy];
    NSMutableArray *negativeNumbers = [@[] mutableCopy];
    NSMutableArray *returnArray = [@[] mutableCopy];
    
    for (NSUInteger i = 0; i < [negativeAndPositiveArray count]; i++) {
        NSInteger n = [negativeAndPositiveArray[i] integerValue];
        if (n >= 0) {
            [positiveNumbers addObject:negativeAndPositiveArray[i]];
        } else {
            [negativeNumbers addObject:negativeAndPositiveArray[i]];
        }
             
    }
    
    [returnArray addObject:negativeNumbers];
    [returnArray addObject:positiveNumbers];
    
    return returnArray;
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbitDictionary {
    return [hobbitDictionary allKeysForObject:@"hobbit"];
    //    NSMutableArray *hobbits = [@[]mutableCopy];
    //
    //    for (NSString *name in [hobbitDictionary allKeys]) {
    //        if ([hobbitDictionary[name] isEqualToString:@"hobbit"]) {
    //            [hobbits addObject:name];
    //        }
    //    }
    
    //return hobbits;
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)arrayOfStrings {
    NSPredicate *namesWithPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    return [arrayOfStrings filteredArrayUsingPredicate:namesWithPredicate];
}

-(NSInteger)sumOfIntegersInArray:(NSArray *)integerArray {
    NSInteger sumOfIntegers = 0;
    
    for (NSNumber *integer in integerArray) {
        sumOfIntegers += [integer integerValue];
    }
    
    return sumOfIntegers;
}

-(NSString *)pluralForString:(NSString *)string {
    NSDictionary *plurals = @{
                              @"hand" : @"hands",
                              @"foot" : @"feet",
                              @"knee" : @"knees",
                              @"table" : @"tables",
                              @"box" : @"boxes",
                              @"ox" : @"oxen",
                              @"axle" : @"axles",
                              @"radius" : @"radii",
                              @"trivium" : @"trivia"
                              };
    return plurals[string] ? plurals[string] : @"";
}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)stringArray {
    NSMutableArray *pluralizedArray = [@[] mutableCopy];
    for (NSString *object in stringArray) {
        [pluralizedArray addObject:[self pluralForString:object]] ;
    }
    return pluralizedArray;
}

-(NSDictionary *)countsOfWordsInString:(NSString *)string {
    string = [string stringByReplacingOccurrencesOfString:@"." withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"," withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"-" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@";" withString:@""];
    string = [string lowercaseString];
    
    NSArray *substrings = [string componentsSeparatedByString:@" "];
    NSMutableDictionary *stringCountDict = [[NSMutableDictionary alloc] init];
    
    for (NSString *word in substrings) {
        NSUInteger counter = 0;
        
        for (NSString *words in substrings) {
            counter += [word isEqualToString:words];
        }
        
        [stringCountDict setValue:[NSNumber numberWithInteger:counter] forKey:word];
    }
    
    return stringCountDict;
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)songsArray {
    NSMutableDictionary *artistSongDict = [[NSMutableDictionary alloc] init];
    
    for (NSString *artistTitle in songsArray) {
        NSArray *artistSongTitleSplit = [artistTitle componentsSeparatedByString:@" - "];
        NSString *artist = [artistSongTitleSplit firstObject];
        NSString *songTitle = [artistSongTitleSplit lastObject];
        
        if ([[artistSongDict allKeys] containsObject:artist]) {
            [artistSongDict[artist] addObject:songTitle];
        } else {
            artistSongDict[artist] = [@[songTitle] mutableCopy];
        }
        
        NSSortDescriptor *songTitleAscending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
        
        for (NSString *artist in artistSongDict) {
            [artistSongDict[artist] sortUsingDescriptors:@[songTitleAscending]];
        }
    }

    
    return artistSongDict;
}

//[artistTitleSplit addObject:[artistTitle componentsSeparatedByString:@" - "]];

@end
