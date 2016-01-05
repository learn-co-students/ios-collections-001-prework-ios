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

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    NSSortDescriptor *sortAlphabetically = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortAlphabetically]];
    return sortedArray;
}


-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    NSSortDescriptor *sortAlphabetically = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortAlphabetically]];
    return sortedArray;
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
    id obj = array[0];
    NSMutableArray *newArray = [array mutableCopy];
    
    NSUInteger lastIndex = [newArray count] - 1;
    
    [newArray replaceObjectAtIndex:0 withObject:newArray[lastIndex]];
    [newArray replaceObjectAtIndex:lastIndex withObject:obj];
    
    return newArray;
}

-(NSArray *)arrayByReversingArray:(NSArray *)array {
    NSMutableArray *reversedArray = [@[] mutableCopy];
    for (NSInteger i = [array count] - 1; i >= 0; i--) {
        [reversedArray addObject:array[i]];
    }
    
    return reversedArray;
}

-(NSString *)stringInBasicLeetFromString:(NSString *)string {
    NSMutableString *leetString = [string mutableCopy];
    
    NSDictionary *leetSpeak = @{@"a" : @"4",
                                @"s" : @"5",
                                @"i" : @"1",
                                @"l" : @"1",
                                @"e" : @"3",
                                @"t" : @"7",};
    
    for (NSString *key in leetSpeak) {
        [leetString replaceOccurrencesOfString:key withString:leetSpeak[key] options:0 range:NSMakeRange(0, [leetString length])];
        [leetString replaceOccurrencesOfString:[key uppercaseString] withString:leetSpeak[key] options:0 range:NSMakeRange(0, [leetString length])];
    }
    
    return leetString;
}

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    NSPredicate *positivePredicate = [NSPredicate predicateWithFormat:@"self >= 0"];
    NSPredicate *negativePredicate = [NSPredicate predicateWithFormat:@"self < 0"];
    NSArray *positiveArray = [array filteredArrayUsingPredicate:positivePredicate];
    NSArray *negativeArray = [array filteredArrayUsingPredicate:negativePredicate];
    return @[negativeArray, positiveArray];
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary {
    NSMutableArray *names = [[NSMutableArray alloc] init];
    
    for (NSString *key in dictionary) {
        if([dictionary[key] isEqualToString:@"hobbit"]) {
            [names addObject:key];
        }
    }
    
    return names;
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    NSPredicate *aPredicate = [NSPredicate predicateWithFormat:@" self BEGINSWITH[cd] 'a' "];
    NSArray *aWords = [array filteredArrayUsingPredicate:aPredicate];
    return aWords;
}

-(NSInteger)sumOfIntegersInArray:(NSArray *)array {
    NSInteger sum = 0;
    
    for (NSNumber *num in array) {
        sum += [num integerValue];
    }
    
    return sum;
}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    NSMutableArray *pluralizedArray = [@[] mutableCopy];
    
    for (NSString *word in array) {
        NSString *pluralized;
        
        if ([word containsString:@"oo"]) {
            pluralized = [word stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
        } else if ([word isEqualToString:@"ox"]) {
            pluralized = @"oxen";
        } else if ([word hasSuffix:@"x"]) {
            pluralized = [word stringByAppendingString:@"es"];
        } else if ([word hasSuffix:@"us"]) {
            pluralized = [word stringByReplacingOccurrencesOfString:@"ius" withString:@"ii"];
        } else if ([word hasSuffix:@"ium"   ]) {
            pluralized = [word stringByReplacingOccurrencesOfString:@"ium" withString:@"ia"];
        } else {
            pluralized = [word stringByAppendingString:@"s"];
        }
        
        [pluralizedArray addObject:pluralized];
    }
    return pluralizedArray;
}

-(NSDictionary *)countsOfWordsInString:(NSString *)string {
    NSString *downcase = [string lowercaseString];
    
    NSArray *punctuation = @[ @".", @",", @"-", @";" ];
    
    for (NSString *punc in punctuation) {
        downcase = [downcase stringByReplacingOccurrencesOfString:punc withString:@""];
    }
    
    NSArray *words = [downcase componentsSeparatedByString:@" "];
    NSMutableDictionary *count = [@{} mutableCopy];
    
    
    NSCountedSet *set = [[NSCountedSet alloc] initWithArray:words];
    
    for (NSString *word in words) {
        if ( count[word] == nil ) {
            NSNumber *num = @([set countForObject:word]);
            
            [count setObject:num forKey:word];
        }
    }
    return count;
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    
    // Sort Descriptor for artist and title
    NSSortDescriptor *alphabeticalSort = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES selector:@selector(caseInsensitiveCompare:)];
    
    // Dictionary of artists and songs
    NSMutableDictionary *sortedSongs = [[NSMutableDictionary alloc] init];
    
    // Make dictionary
    for (NSString *word in array) {
        NSArray *song = [word componentsSeparatedByString:@" - "];
        NSString *artist = song[0];
        NSString *title = song[1];
        
        if (![sortedSongs objectForKey:artist]) {
            sortedSongs[artist] = [@[] mutableCopy];
        }
        
        [sortedSongs[artist] addObject:title];
        
    }
    
    for (NSString *key in [sortedSongs allKeys]) {
        NSMutableArray *songs = sortedSongs[key];
        // Sorting in place
        [songs sortUsingDescriptors:@[alphabeticalSort]];
    }
    
    
    return sortedSongs;
}


@end

























