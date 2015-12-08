//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSArray *) arrayBySortingArrayAscending: (NSArray *) array {
NSSortDescriptor *ascend = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *sort = [array sortedArrayUsingDescriptors:@[ascend]];
    return sort;
}

-(NSArray *) arrayBySortingArrayDescending: (NSArray *) array {
    NSSortDescriptor *desce = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *de = [array sortedArrayUsingDescriptors:@[desce]];
    return de;
}

- (NSArray *) arrayBySwappingFirstObjectWithLastObjectInArray: (NSArray *) array {
    NSMutableArray *swap = [[NSMutableArray alloc]initWithArray:array];
    [swap exchangeObjectAtIndex: 0 withObjectAtIndex: ([swap count] - 1)];
   return swap;
}

- (NSArray *) arrayByReversingArray: (NSArray *) array {
    NSArray *reverse = [[array reverseObjectEnumerator] allObjects];
    return reverse;
}

- (NSString *) stringInBasicLeetFromString: (NSString *) string {
    /*basic leet = b451c 1337
     a = 4
     s = 5
     i = 1
     l = 1
     e = 3
     t = 7
     */
        string = [string stringByReplacingOccurrencesOfString:@"a" withString:@"4"];
        string = [string stringByReplacingOccurrencesOfString:@"s" withString:@"5"];
        string = [string stringByReplacingOccurrencesOfString:@"i" withString:@"1"];
        string = [string stringByReplacingOccurrencesOfString:@"l" withString:@"1"];
        string = [string stringByReplacingOccurrencesOfString:@"e" withString:@"3"];
        string = [string stringByReplacingOccurrencesOfString:@"t" withString:@"7"];
    return string;
}

- (NSArray *) splitArrayIntoNegativesAndPositives: (NSArray *) array {
    /* Create new array with two values
     the sub values will be one of all positives
     and one of all negatives
     */
    NSPredicate *positives = [NSPredicate predicateWithFormat:@"self < 0"];
    NSPredicate *negatives = [NSPredicate predicateWithFormat:@"self >= 0"];
    NSMutableArray *split = [[NSMutableArray alloc]init];
    split[0] = [array filteredArrayUsingPredicate:positives];
    split[1] = [array filteredArrayUsingPredicate:negatives];
    return split;
}

- (NSArray *) namesOfHobbitsInDictionary: (NSDictionary *) dictionary {
    NSArray *names = [dictionary allKeysForObject:@"hobbit"];
    return names;
}

- (NSArray *) stringsBeginningWithAInArray: (NSArray *) array {
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *aFilter = [array filteredArrayUsingPredicate:filter];
    return aFilter;
}

- (NSInteger) sumOfIntegersInArray: (NSArray *) array {
    NSInteger sum = 0;
    for (NSNumber *num in array) sum += [num intValue];
   return sum;
}
- (NSArray *) arrayByPluralizingStringsInArray: (NSArray *) array {
    NSArray *plurals = @[ @"hands" ,
                 @"feet"  ,
                 @"knees" ,
                 @"tables",
                 @"boxes" ,
                 @"oxen"  ,
                 @"axles" ,
                 @"radii" ,
                 @"trivia"];
    NSMutableArray *chan = [[NSMutableArray alloc]init];
    for (NSUInteger i = 0; i < [array count]; i++) [chan addObject:[array[i] stringByReplacingOccurrencesOfString:array[i] withString:plurals[i]]];
    return chan;
}

- (NSDictionary *) countsOfWordsInString: (NSString *) string {
    NSMutableArray *stringz = [[NSMutableArray alloc]init];
    
    stringz = [[[string lowercaseString] componentsSeparatedByCharactersInSet:
                        [NSCharacterSet characterSetWithCharactersInString:@"-,. "]]mutableCopy];
    
    NSMutableArray *counts = [[NSMutableArray alloc]init];
    
    NSMutableDictionary *log = [[NSMutableDictionary alloc]init];
    
    for (NSUInteger i = 0; i < [stringz count]; i++) {
    NSPredicate *filt = [NSPredicate predicateWithFormat:@"self == %@",stringz[i]];
        counts[i] = [[stringz filteredArrayUsingPredicate:filt]mutableCopy];
        log[stringz[i]] = @([counts[i] count]);
    }
     [log removeObjectForKey:@""];
    return log;
}

- (NSDictionary *) songsGroupedByArtistFromArray: (NSArray *) array {
    NSMutableDictionary *artistAndSong = [[NSMutableDictionary alloc]init];
    for (NSString *string in array) {
        NSArray *artistsWithSong = [string componentsSeparatedByString:@" - "];
        NSString *artist = artistsWithSong[0];
        NSString *song = artistsWithSong[1];
    
        if ([[artistAndSong allKeys] containsObject:artist]) {
            [artistAndSong[artist] addObject:song];
        }else{
            artistAndSong[artist] = [@[song]mutableCopy];
        }
    }
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    for (NSString *artist in artistAndSong) {
        [artistAndSong[artist] sortUsingDescriptors:@[sort]];
    }
    
    return artistAndSong;
}


@end
