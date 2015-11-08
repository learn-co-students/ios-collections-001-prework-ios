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

- (NSArray *)arrayBySortingArrayAscending:(NSArray *) array {
    NSSortDescriptor *sortArrayAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortArrayAsc]];
    return sortedArray;
}
- (NSArray *)arrayBySortingArrayDescending:(NSArray *) array {
    NSSortDescriptor *sortArrayDes = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortArrayDes]];
    return sortedArray;
}
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *) array {
    NSMutableArray *swappedArray = [array mutableCopy];
    swappedArray[0] = array[array.count - 1];
    swappedArray[swappedArray.count - 1] = array[0];
    return swappedArray;
}
- (NSArray *)arrayByReversingArray:(NSArray *) array {
    NSMutableArray *reversedArray = [[NSMutableArray alloc] init];
    for (NSInteger i = (array.count - 1); i > -1; i--) {
        [reversedArray addObject:array[i]];
    }
    return reversedArray;
}
- (NSString *)stringInBasicLeetFromString:(NSString *) string {
    NSArray *leetChar = @[@"a", @"s", @"i", @"l", @"e", @"t"];
    NSArray *toLeetNum = @[@"4", @"5", @"1", @"1", @"3", @"7"];
    NSString *leetString = [string copy];
    for (NSUInteger i = 0; i < leetChar.count; i++) {
        leetString = [leetString stringByReplacingOccurrencesOfString:leetChar[i] withString:toLeetNum[i]];
    }
    return leetString;
}
- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *) array {
    NSMutableArray *negatives = [[NSMutableArray alloc] init];
    NSMutableArray *positives = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < array.count; i++) {
        if ([array[i] integerValue] < 0) {
            [negatives addObject:array[i]];
        } else {
            [positives addObject:array[i]];
        }
    }
    NSArray *negativesAndPositives = @[negatives,positives];
    return negativesAndPositives;
}
- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *) dictionary {
    NSMutableArray *hobbitsInDictionary = [[NSMutableArray alloc] init];
    for (NSString *key in [dictionary allKeys]) {
        if ([dictionary[key] isEqualToString:@"hobbit"]) {
            [hobbitsInDictionary addObject:key];
        }
    }
    return hobbitsInDictionary;
}
- (NSArray *)stringsBeginningWithAInArray:(NSArray *) array {
    NSPredicate *beginsWithAPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'A'"];
    NSArray *stringsBeginningWithA = [array filteredArrayUsingPredicate:beginsWithAPredicate];
    return stringsBeginningWithA;
}
- (NSInteger)sumOfIntegersInArray:(NSArray *) array {
    NSInteger sumOfIntegers = 0;
    for (NSUInteger i = 0; i < array.count; i++) {
        sumOfIntegers += [array[i] integerValue];
    }
    return sumOfIntegers;
}
- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *) array {
    NSMutableArray *pluralizedStrings = [[NSMutableArray alloc] init];
    NSArray *oddWords = @[@"foot", @"box", @"ox", @"radius", @"trivium"];
    NSArray *oddWordsPlural = @[@"feet", @"boxes", @"oxen", @"radii", @"trivia"];
    for (NSUInteger i = 0; i < array.count; i++) {
        NSMutableString *pluralizedString = [[NSMutableString alloc] init];
        if ([oddWords containsObject:array[i]]) {
            NSInteger oddWordIndex = [oddWords indexOfObject:array[i]];
            [pluralizedString appendFormat:@"%@", oddWordsPlural[oddWordIndex]];
        } else {
            [pluralizedString appendFormat:@"%@%@", array[i], @"s"];
        }
        [pluralizedStrings addObject:pluralizedString];
    }
    return pluralizedStrings;
}
- (NSDictionary *)countsOfWordsInString:(NSString *) string {
    NSString *lowercased =[string lowercaseString];
    NSArray *punctuation = @[@".", @",", @"-", @";"];
    NSString *noPunctuation = [[NSString alloc] initWithString:lowercased];
    for (NSUInteger i = 0; i < punctuation.count; i++) {
        noPunctuation = [noPunctuation stringByReplacingOccurrencesOfString:punctuation[i] withString:@""];
    }
    NSArray *stringsAsArray = [noPunctuation componentsSeparatedByString:@" "];
    NSMutableDictionary *wordCountInString = [[NSMutableDictionary alloc] init];
    for (NSUInteger i = 0; i < stringsAsArray.count; i++) {
        NSInteger count = 0;
        for (NSUInteger j = 0; j < stringsAsArray.count; j++) {
            if ([stringsAsArray[j] isEqualToString:stringsAsArray[i]]) {
                count++;
            }
        }
        NSNumber *wordCount = @(count);
        wordCountInString[stringsAsArray[i]] = wordCount;
    }
    return wordCountInString;
}
- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *) array {
    NSMutableDictionary *songsByArtist = [[NSMutableDictionary alloc] init];
    NSMutableArray *arrayWithNoDash = [[NSMutableArray alloc] init];
    NSMutableArray *artistsArray = [[NSMutableArray alloc] init];
    for (NSString *artistAndTitle in array) {
        NSArray *removedDash = [artistAndTitle componentsSeparatedByString:@" - "];
        [arrayWithNoDash addObject:removedDash];
        if (![artistsArray containsObject:removedDash[0]]) {
            [artistsArray addObject:removedDash[0]];
        }
    }
    NSMutableArray *songsBySameArtistArray = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < artistsArray.count; i++) {
        NSMutableArray *songsBySameArtist = [[NSMutableArray alloc] init];
        for (NSUInteger j = 0; j < arrayWithNoDash.count; j++) {
            if ([arrayWithNoDash[j] containsObject:artistsArray[i]]) {
                [songsBySameArtist addObject:arrayWithNoDash[j][1]];
            }
        }
        NSSortDescriptor *sortByABC = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
        NSArray *sortedSongsBySameArtist = [songsBySameArtist sortedArrayUsingDescriptors:@[sortByABC]];
        [songsBySameArtistArray addObject:sortedSongsBySameArtist];
    }
    for (NSUInteger i = 0; i < artistsArray.count; i++) {
        songsByArtist[artistsArray[i]] = songsBySameArtistArray[i];
    }
    return songsByArtist;
}

@end
