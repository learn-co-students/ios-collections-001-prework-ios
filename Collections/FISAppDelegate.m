//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [array sortedArrayUsingDescriptors:@[sortDescriptor]];
}

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    return [array sortedArrayUsingDescriptors:@[sortDescriptor]];
}

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
    
    NSMutableArray *arrayCopy = [array mutableCopy];
    [arrayCopy replaceObjectAtIndex:0 withObject:array[[array count]-1]];
    [arrayCopy replaceObjectAtIndex:[array count]-1 withObject:array[0]];
    return arrayCopy;
}

- (NSArray *)arrayByReversingArray:(NSArray *)array {
    
    NSMutableArray *arrayCopy = [array mutableCopy];
    for (int i = 0; i < floorf([array count]/2.0f); i++) {
        [arrayCopy replaceObjectAtIndex:i withObject:array[[array count]-1-i]];
        [arrayCopy replaceObjectAtIndex:[array count]-1-i withObject:array[i]];
    }
    return arrayCopy;
}

- (NSString *)stringInBasicLeetFromString:(NSString *)string {
    
    NSMutableString *mutableString = [string mutableCopy];
    [mutableString replaceOccurrencesOfString:@"a" withString:@"4" options:NSDiacriticInsensitiveSearch range:NSMakeRange(0, [mutableString length])];
    [mutableString replaceOccurrencesOfString:@"s" withString:@"5" options:NSDiacriticInsensitiveSearch range:NSMakeRange(0, [mutableString length])];
    [mutableString replaceOccurrencesOfString:@"i" withString:@"1" options:NSDiacriticInsensitiveSearch range:NSMakeRange(0, [mutableString length])];
    [mutableString replaceOccurrencesOfString:@"l" withString:@"1" options:NSDiacriticInsensitiveSearch range:NSMakeRange(0, [mutableString length])];
    [mutableString replaceOccurrencesOfString:@"e" withString:@"3" options:NSDiacriticInsensitiveSearch range:NSMakeRange(0, [mutableString length])];
    [mutableString replaceOccurrencesOfString:@"t" withString:@"7" options:NSDiacriticInsensitiveSearch range:NSMakeRange(0, [mutableString length])];
    return mutableString;
}

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    
    NSPredicate *negativeFilter = [NSPredicate predicateWithFormat:@"self < 0"];
    NSPredicate *nonNegativeFilter = [NSPredicate predicateWithFormat:@"self >= 0"];;
    return @[[array filteredArrayUsingPredicate:negativeFilter], [array filteredArrayUsingPredicate:nonNegativeFilter]];
}

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary {
    
    NSMutableArray *hobbits = [NSMutableArray array];
    for (NSString *name in [dictionary allKeys]) {
        if ([dictionary[name] isEqualToString:@"hobbit"]) {
            [hobbits addObject:name];
        }
    }
    return hobbits;
}

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    
    NSPredicate *aFilter = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    return [array filteredArrayUsingPredicate:aFilter];
}

- (NSInteger)sumOfIntegersInArray:(NSArray *)array {
    
    NSInteger sum = 0;
    for (NSNumber *number in array) {
        sum += [number integerValue];
    }
    return sum;
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    
    NSMutableArray *pluralizedStrings = [NSMutableArray arrayWithCapacity:[array count]];
    NSString *singular, *plural;
    NSUInteger singularLength;
    for (int i = 0; i < [array count]; i++) {
        singular = array[i];
        singularLength = [singular length];
        if ([singular isEqualToString:@"foot"]) {
            plural = @"feet";
        }
        else if ([singular isEqualToString:@"ox"]) {
            plural = @"oxen";
        }
        else if ([singular characterAtIndex:singularLength-1] == 'x') {
            plural = [NSString stringWithFormat:@"%@es", singular];
        }
        else if ([[singular substringFromIndex:singularLength-2] isEqualToString:@"us"]) {
            plural = [NSString stringWithFormat:@"%@i", [singular substringToIndex:singularLength-2]];
        }
        else if ([[singular substringFromIndex:singularLength-2] isEqualToString:@"um"]) {
            plural = [NSString stringWithFormat:@"%@a", [singular substringToIndex:singularLength-2]];
        }
        else {
            plural = [NSString stringWithFormat:@"%@s", singular];
        }
        [pluralizedStrings addObject:plural];
    }
    return pluralizedStrings;
}

- (NSDictionary *)countsOfWordsInString:(NSString *)string {
    
    NSMutableCharacterSet *charactersToFilter = [[NSCharacterSet punctuationCharacterSet] mutableCopy];
    [charactersToFilter formUnionWithCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSMutableArray *words = [[[string lowercaseString] componentsSeparatedByCharactersInSet:charactersToFilter] mutableCopy];
    [words removeObject:@""];
    NSMutableDictionary *countsOfWords = [NSMutableDictionary dictionary];
    NSNumber *count;
    for (NSString *word in words) {
        count = countsOfWords[word];
        if (count) {
            countsOfWords[word] = @([count integerValue]+1);
        }
        else {
            countsOfWords[word] = @1;
        }
    }
    return countsOfWords;
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    
    NSMutableDictionary *songsGroupedByArtist = [NSMutableDictionary dictionary];
    NSString *artist, *title;
    NSArray *artistAndTitle;
    for (NSString *artistTitleString in array) {
        artistAndTitle = [artistTitleString componentsSeparatedByString:@" - "];
        artist = artistAndTitle[0];
        title = artistAndTitle[1]; // assume that split works perfectly and produces two substrings
        if ([[songsGroupedByArtist allKeys] containsObject:artist]) {
            [songsGroupedByArtist[artist] addObject:title];
        }
        else {
            [songsGroupedByArtist setObject:[NSMutableArray arrayWithObject:title] forKey:artist];
        }
    }
    NSSortDescriptor *sortAlphabetically = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    for (artist in [songsGroupedByArtist allKeys]) {
        [songsGroupedByArtist[artist] sortUsingDescriptors:@[sortAlphabetically]];
    }
    return songsGroupedByArtist;
}

@end
