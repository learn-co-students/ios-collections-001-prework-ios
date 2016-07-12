//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}
-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [array sortedArrayUsingDescriptors:@[sortAsc]];
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    NSSortDescriptor *sortDesc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    return [array sortedArrayUsingDescriptors:@[sortDesc]];
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
    
    NSMutableArray *mutableArray = [array mutableCopy];
    [mutableArray exchangeObjectAtIndex:0 withObjectAtIndex:[array count] - 1];
    
    return mutableArray;
    
}

-(NSArray *)arrayByReversingArray:(NSArray *)array {
    NSArray *reversed = [[array reverseObjectEnumerator] allObjects];
    return reversed;
}

-(NSString *)stringInBasicLeetFromString:(NSString *)string {
    
    // Create dict of values
    NSDictionary *leetCode = @{
                               @"a": @"4",
                               @"s": @"5",
                               @"i": @"1",
                               @"l": @"1",
                               @"e": @"3",
                               @"t": @"7",
                               };
    
    // Loop through
    for (NSString *letter in leetCode) {
        string = [string stringByReplacingOccurrencesOfString:letter withString:leetCode[letter]];
    }
    
    return string;
    
}

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    
    // Create buckets
    NSPredicate *positivesOnly = [NSPredicate predicateWithFormat:@"self >= 0"];
    NSPredicate *negativesOnly = [NSPredicate predicateWithFormat:@"self < 0"];
    
    NSArray *positives = [array filteredArrayUsingPredicate:positivesOnly];
    NSArray *negatives = [array filteredArrayUsingPredicate:negativesOnly];
    
    // Construct from two arrays
    NSArray *splitArray = [NSArray arrayWithObjects:negatives, positives, nil];
    
    return splitArray;
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary {
    
    return [dictionary allKeysForObject:@"hobbit"];
    
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    NSPredicate *stringPrefix = [NSPredicate predicateWithFormat:@"self BEGINSWITH[cd] 'A'"];
    NSArray *strings = [array filteredArrayUsingPredicate:stringPrefix];
    return strings;
}

-(NSInteger)sumOfIntegersInArray:(NSArray *)array {
    
    NSInteger total = 0;
    
    for (NSNumber *i in array) {
        total += [i integerValue];
    }
    
    return total;
    
}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    
    NSMutableArray *newPlurals = [[NSMutableArray alloc]init];
    
    for (NSString *string in array) {
        
        if ([string isEqualToString:@"foot"]) {
            [newPlurals addObject:@"feet"];
        } else if ([string isEqualToString:@"box"]) {
            [newPlurals addObject:@"boxes"];
        } else if ([string isEqualToString:@"ox"]) {
            [newPlurals addObject:@"oxen"];
        } else if ([string isEqualToString:@"radius"]) {
            [newPlurals addObject:@"radii"];
        } else if ([string isEqualToString:@"trivium"]) {
            [newPlurals addObject:@"trivia"];
        } else {
            NSString * pluralized = [NSString stringWithFormat:@"%@s", string];
            [newPlurals addObject:pluralized];
        }
        
    }
    
    return newPlurals;
}

-(NSDictionary *)countsOfWordsInString:(NSString *)string {
    
    // Sanitize the string for irregularities
    NSString *sanitized = [[[string stringByReplacingOccurrencesOfString:@"," withString:@""] stringByReplacingOccurrencesOfString:@"." withString:@""] stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    // Lowercase string & splice up
    NSArray *words = [[sanitized lowercaseString] componentsSeparatedByString:@" "];
    NSMutableDictionary *wordCount = [[NSMutableDictionary alloc]init];
    
    for (NSString *word in words) {
        
        NSUInteger count = [wordCount[word] unsignedIntegerValue];
        wordCount[word] = @(count + 1);
        
    }
    
    return wordCount;
    
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    
    
    NSMutableDictionary *songs = [[NSMutableDictionary alloc] init];
    
    // Splice up into track & artist info
    for (NSString *track in array) {
        NSArray *subStrings = [track componentsSeparatedByString:@" - "];
        NSString *artist = subStrings[0];
        NSString *title = subStrings[1];
        
        // If no info exists, create
        if (![[songs allKeys] containsObject:artist]) {
            songs[artist] = [@[] mutableCopy];
        }
        
        // Add track
        [songs[artist] addObject:title];
        
    }
    
    NSSortDescriptor *sortingAlpha = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    for (NSString *artist in songs) {
        [songs[artist] sortUsingDescriptors:@[sortingAlpha]];
    }
    
    return songs;
    
}

@end
