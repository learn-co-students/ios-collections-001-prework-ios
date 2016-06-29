//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *arrayAsc = [array sortedArrayUsingDescriptors:@[sortAsc]];
    
    return arrayAsc;
}

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    
    NSSortDescriptor *sortDesc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *arrayDesc = [array sortedArrayUsingDescriptors:@[sortDesc]];
    
    return arrayDesc;
}

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
    
    NSMutableArray *swapArray = [array mutableCopy];
    
    [swapArray exchangeObjectAtIndex:0 withObjectAtIndex:[array count] - 1];
    
    return swapArray;
}

- (NSArray *)arrayByReversingArray:(NSArray *)array {
    
    NSMutableArray *revArray = [array mutableCopy];
    NSUInteger indexLow = 0;
    NSUInteger indexHigh = [revArray count] - 1;
    
    while (indexLow < indexHigh) {
        
        [revArray exchangeObjectAtIndex:indexLow withObjectAtIndex:indexHigh];
        
        indexLow++;
        indexHigh--;
    }
    
    return revArray;
}

- (NSString *)stringInBasicLeetFromString:(NSString *)string {
    
    NSString *leetString = [string copy];
    NSDictionary *leetConversions = @{@"a" : @"4",
                                      @"s" : @"5",
                                      @"i" : @"1",
                                      @"l" : @"1",
                                      @"e" : @"3",
                                      @"t" : @"7"};
    
    for (NSString *letter in leetConversions) {
        
        leetString = [leetString stringByReplacingOccurrencesOfString:letter withString:leetConversions[letter]];
    }
    
    return leetString;
}

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    
    NSPredicate *filterForNegatives = [NSPredicate predicateWithFormat:@"self < 0"];
    NSPredicate *filterForPositives = [NSPredicate predicateWithFormat:@"self >= 0"];
    
    NSArray *negativesAndPositives = @[[array filteredArrayUsingPredicate:filterForNegatives], [array filteredArrayUsingPredicate:filterForPositives]];
    
    return negativesAndPositives;
}

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dict {

    NSArray *hobbitNames = [dict allKeysForObject:@"hobbit"];
    
    return hobbitNames;
}

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    
    NSPredicate *filterForAStrings = [NSPredicate predicateWithFormat:@"self BEGINSWITH 'a' OR self BEGINSWITH 'A'"];
    NSArray *aStrings = [array filteredArrayUsingPredicate:filterForAStrings];
    
    return aStrings;
}

- (NSInteger)sumOfIntegersInArray:(NSArray *)array {
    
    NSInteger sum = 0;
    
    for (NSNumber *integerNumber in array) {
        
        sum += [integerNumber integerValue];
    }
    
    return sum;
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    
    NSMutableArray *pluralizedStrings = [array mutableCopy];
    NSDictionary *plurals = @{@"hand" : @"hands",
                              @"foot" : @"feet",
                              @"knee" : @"knees",
                              @"table" : @"tables",
                              @"box" : @"boxes",
                              @"ox" : @"oxen",
                              @"axle" : @"axles",
                              @"radius" : @"radii",
                              @"trivium" : @"trivia"};
    
    for (NSUInteger i = 0; i < [pluralizedStrings count]; i++) {
        
        NSString *singularString = pluralizedStrings[i];
        
        if (plurals[singularString]) {
            
            pluralizedStrings[i] = plurals[singularString];
        }
    }
    
    return pluralizedStrings;
}

- (NSDictionary *)countsOfWordsInString:(NSString *)string {
    
    NSString *withoutPunctuation = [string copy];
    NSArray *punctuations = @[@".", @",", @"-", @";"];
    
    for (NSString *punct in punctuations) {
        
        withoutPunctuation = [withoutPunctuation stringByReplacingOccurrencesOfString:punct withString:@""];
    }
    
    NSString *lowercaseWithoutPunctuation = [withoutPunctuation lowercaseString];
    
    NSMutableDictionary *wordCounts = [[NSMutableDictionary alloc] init];

    for (NSString *word in [lowercaseWithoutPunctuation componentsSeparatedByString:@" "]) {
        
        if (wordCounts[word]) {
            
            wordCounts[word] = @([wordCounts[word] integerValue] + 1);
            
        } else {
            
            wordCounts[word] = @1;
        }
    }
    
    return wordCounts;
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    
    NSMutableDictionary *songsByArtist = [[NSMutableDictionary alloc] init];
    
    for (NSString *artistAndTitle in array) {
        
        NSArray *separateArtistAndTitle = [artistAndTitle componentsSeparatedByString:@" - "];
        NSString *artist = separateArtistAndTitle[0];
        NSString *title = separateArtistAndTitle[1];
        
        if (songsByArtist[artist]) {
            
            [songsByArtist[artist] addObject:title];
            
        } else {
            
            songsByArtist[artist] = [NSMutableArray arrayWithObject:title];
        }
    }
    
    NSSortDescriptor *sortSongNamesAlphabetically = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    
    for (NSString *artist in [songsByArtist allKeys]) {
        
        songsByArtist[artist] = [songsByArtist[artist] sortedArrayUsingDescriptors:@[sortSongNamesAlphabetically]];
    }
    
    return songsByArtist;
}

@end
