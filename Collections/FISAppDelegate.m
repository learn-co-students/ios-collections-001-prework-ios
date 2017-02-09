//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/**
 
 * Define your methods here.
 
 */

// 1.
-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    NSSortDescriptor *sortByNilAscending = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                         ascending:YES];
    NSArray *ascendingArray = [array sortedArrayUsingDescriptors:@[sortByNilAscending]];
    return ascendingArray;
}


// 2.
-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    NSSortDescriptor *sortByNilDescending = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                          ascending:NO];
    NSArray *descendingArray = [array sortedArrayUsingDescriptors:@[sortByNilDescending]];
    return descendingArray;
}


// 3.
-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
    NSUInteger lastObjectIndex = array.count - 1;
    NSMutableArray *swapArray = [array mutableCopy];
    [swapArray exchangeObjectAtIndex:0 withObjectAtIndex:lastObjectIndex];
    return swapArray;
}


// 4.
-(NSArray *)arrayByReversingArray:(NSArray *)array {
    NSUInteger lengthOfArray = [array count];
    NSMutableArray *reverseArray = [array mutableCopy];
    NSUInteger numberOfElementsToSwap = lengthOfArray / 2;
    for (NSUInteger i = 0; i < numberOfElementsToSwap; i++) {
        NSUInteger swapIndex = lengthOfArray - i - 1;
        [reverseArray exchangeObjectAtIndex:i withObjectAtIndex:swapIndex];
    }
    return reverseArray;
}


// 5.
-(NSString *)stringInBasicLeetFromString:(NSString *)string {
    NSDictionary *leetCode = @{ @"a" : @"4"  ,
                                @"s" : @"5"  ,
                                @"i" : @"1"  ,
                                @"l" : @"1"  ,
                                @"e" : @"3"  ,
                                @"t" : @"7" };
    
    NSMutableString *stringInLeet = [string mutableCopy];
    for (NSString *substring in leetCode) {
        [stringInLeet replaceOccurrencesOfString:substring
                                      withString:leetCode[substring]
                                         options:0
                                           range:NSMakeRange(0, [string length])];
    }
    return stringInLeet;
}


// 6.
-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    NSPredicate *negativePredicate = [NSPredicate predicateWithFormat:@"self < 0"];
    NSArray *negativeArray = [array filteredArrayUsingPredicate:negativePredicate];
    
    NSPredicate *positivePredicate = [NSPredicate predicateWithFormat:@"self >= 0"];
    NSArray *positiveArray = [array filteredArrayUsingPredicate:positivePredicate];
    
    NSArray *splitArray = @[negativeArray, positiveArray];
    return splitArray;
}


// 7.
-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary {
    NSMutableArray *hobbitNames = [[NSMutableArray alloc] init];
    for (NSString *name in dictionary) {
        if ([dictionary[name] isEqualToString:@"hobbit"]) {
            [hobbitNames addObject:name];
        }
    }
    return hobbitNames;
}


// 8.
-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    NSPredicate *beginsWithAPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *stringsBeginningWithA = [array filteredArrayUsingPredicate:beginsWithAPredicate];
    return stringsBeginningWithA;
}


// 9.
-(NSInteger)sumOfIntegersInArray:(NSArray *)array {
    NSInteger sum = 0;
    for (NSNumber *number in array) {
        sum += [number integerValue];
    }
    return sum;
}


// 10.
-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    // some irregular nouns
    NSDictionary *irregularNouns = @{ @"woman" : @"women", @"man"  : @"men", @"child": @"children",
                                      @"tooth" : @"teeth", @"foot" : @"feet",  @"ox" : @"oxen"   };
    NSMutableArray *pluralStrings = [[NSMutableArray alloc] init];  // pluralized array of words
    
    for (NSString *word in array) {
        // irregular nouns
        if ( [ [irregularNouns allKeys] containsObject:word] ) {
            [pluralStrings addObject:irregularNouns[word] ];
        }
        // Latin and Greek words
        else if ( [word hasSuffix:@"us"] ) {
            NSRange range = NSMakeRange( [word length] - 2, 2 );
            [pluralStrings addObject:[word stringByReplacingCharactersInRange:range withString:@"i"] ];
        }
        else if ( [word hasSuffix:@"um"] || [word hasSuffix:@"on"] ) {
            NSRange range = NSMakeRange( [word length] - 2, 2 );
            [pluralStrings addObject:[word stringByReplacingCharactersInRange:range withString:@"a"] ];
        }
        // sss sounds
        else if ( [word hasSuffix:@"ch"] || [word hasSuffix:@"x"] || [word hasSuffix:@"s"] ) {
            [pluralStrings addObject:[word stringByAppendingString:@"es"] ];
        }
        // regular cases
        else {
            [pluralStrings addObject:[word stringByAppendingString:@"s"] ];
        }
    }
    // NSLog(@"%@", pluralStrings);
    return pluralStrings;
}


// 11.
-(NSDictionary *)countsOfWordsInString:(NSString *)string {
    // remove punctuations
    NSArray *punctuations = @[ @".", @",", @"-", @";" ];
    NSString *withoutPunctuation = [string copy];
    for (NSString *punctuation in punctuations) {
        withoutPunctuation = [withoutPunctuation stringByReplacingOccurrencesOfString:punctuation withString:@""];
    }
    // into lowercase
    NSString *lowercase = [withoutPunctuation lowercaseString];
    
    NSArray *words = [lowercase componentsSeparatedByString:@" "];
    NSMutableDictionary *wordCount = [[NSMutableDictionary alloc] init];
    for (NSString *word in words) {
        if ( [ [ wordCount allKeys ] containsObject:word] ) {
            wordCount[word] = @( [ wordCount[word] integerValue] + 1 );
        }
        else {
            wordCount[word] = @1;
        }
    }
    return wordCount;
}


// 12.
-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    NSMutableDictionary *songsByArtist = [[NSMutableDictionary alloc] init];
    for (NSString* string in array) {
        // parse artist - song string
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
    // sort songs
    NSSortDescriptor *sortByNilAscending = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                         ascending:YES];
    for (NSString *artist in [songsByArtist allKeys]) {
        [songsByArtist[artist] sortUsingDescriptors:@[sortByNilAscending]];
    }
    return songsByArtist;
}

@end
