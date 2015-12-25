//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSArray*)arrayBySortingArrayAscending:(NSArray*)array {
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:nil
                                                              ascending:YES];
    return [array sortedArrayUsingDescriptors:@[sortAsc]];
}

-(NSArray*)arrayBySortingArrayDescending:(NSArray*)array {
    NSSortDescriptor *sortDec = [NSSortDescriptor sortDescriptorWithKey:nil
                                                              ascending:NO];
    return [array sortedArrayUsingDescriptors:@[sortDec]];
}

-(NSArray*)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray*)array {
    NSMutableArray *outputArray = [array mutableCopy];
    
    NSInteger lastIndex = [array count] - 1;
    outputArray[0] = [array lastObject];
    outputArray[lastIndex] = array[0];
    
    return outputArray;
}

-(NSArray*)arrayByReversingArray:(NSArray*)array {
    NSMutableArray *reverseArray = [[NSMutableArray alloc] init];
    for (NSInteger i = [array count]-1; i >= 0; i--) {
        [reverseArray addObject:array[i]];
    }
    return reverseArray;
}

-(NSString*)stringInBasicLeetFromString:(NSString*)string {
    NSDictionary *leetDictionary = @{
                                     @"a" : @"4",
                                     @"s" : @"5",
                                     @"i" : @"1",
                                     @"l" : @"1",
                                     @"e" : @"3",
                                     @"t" : @"7"
                                     };
    NSMutableString *basicLeetString = [[NSMutableString alloc] init];
    
    for (NSUInteger i = 0; i < [string length]; i++) {
        unichar c = [string characterAtIndex:i];
        NSString *letter = [NSString stringWithFormat:@"%C",c];
        if (leetDictionary[letter]) {
            letter = leetDictionary[letter];
        }
        [basicLeetString appendString:letter];
    }
    
    return basicLeetString;
}

-(NSArray*)splitArrayIntoNegativesAndPositives:(NSArray*)array {
    NSArray *negativeAndPositive = @[
                                     [[NSMutableArray alloc] init],
                                     [[NSMutableArray alloc] init]
                                     ];
    
    for (NSUInteger i = 0; i < [array count]; i++) {
        NSNumber *currentNum = array[i];
        if ([currentNum integerValue] < 0) {
            [negativeAndPositive[0] addObject:currentNum];
        } else {
            [negativeAndPositive[1] addObject:currentNum];
        }
    }
    
    return negativeAndPositive;
}

-(NSArray*)namesOfHobbitsInDictionary:(NSDictionary*)dictionary {
    NSMutableArray *namesOfHobbits = [[NSMutableArray alloc] init];
    for (NSString *name in dictionary) {
        if ([dictionary[name] isEqualToString:@"hobbit"]) {
            [namesOfHobbits addObject:name];
        }
    }
    
    return namesOfHobbits;
}

-(NSArray*)stringsBeginningWithAInArray:(NSArray*)array {
    NSPredicate *beginWithA = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    return [array filteredArrayUsingPredicate:beginWithA];
}

-(NSInteger)sumOfIntegersInArray:(NSArray*)array {
    NSInteger sum = 0;
    NSUInteger i = 0;
    while (i < [array count]) {
        sum += [array[i] integerValue];
        i++;
    }
    return sum;
}

-(NSArray*)arrayByPluralizingStringsInArray:(NSArray*)array {
    //foot ox radius trivium
    NSDictionary *irregularPlurals = @{
                                       @"foot"      :   @"feet",
                                       @"ox"        :   @"oxen",
                                       @"box"       :   @"boxes",
                                       @"radius"    :   @"radii",
                                       @"trivium"   :   @"trivia"
                                       };
    
    NSMutableArray *pluralWords = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < [array count]; i++) {
        NSString *word = array[i];
        if (irregularPlurals[word]) {
            [pluralWords addObject:irregularPlurals[word]];
        } else {
            [pluralWords addObject:[NSString stringWithFormat:@"%@s",word]];
        }
    }
    
    return pluralWords;
}

-(NSDictionary*)countsOfWordsInString:(NSString*)string {
    NSString *correctedString = [string mutableCopy];
    correctedString = [correctedString lowercaseString];
    correctedString = [correctedString stringByReplacingOccurrencesOfString:@"." withString:@""];
    correctedString = [correctedString stringByReplacingOccurrencesOfString:@"," withString:@""];
    correctedString = [correctedString stringByReplacingOccurrencesOfString:@"-" withString:@""];
    correctedString = [correctedString stringByReplacingOccurrencesOfString:@";" withString:@""];
    
    NSArray *arrayOfWords = [correctedString componentsSeparatedByString:@" "];
    
    NSMutableDictionary *wordCount = [[NSMutableDictionary alloc] init];
    
    for (NSUInteger i = 0; i < [arrayOfWords count]; i++) {
        NSString *word = arrayOfWords[i];
        if (wordCount[word]) {
            wordCount[word] = @([wordCount[word] integerValue] + 1);
        } else {
            wordCount[word] = @1;
        }
    }
    
    return wordCount;
}

-(NSDictionary*)songsGroupedByArtistFromArray:(NSArray*)array {
    
    NSMutableDictionary *artistAndSongsDictionary = [[NSMutableDictionary alloc] init];
    
    NSArray *artistAndSongArray;
    NSString *artist;
    NSString *song;
    
    for (NSUInteger i = 0; i < [array count]; i++) {
        artistAndSongArray = [array[i] componentsSeparatedByString:@" - "];
        artist = artistAndSongArray[0];
        song = artistAndSongArray[1];
        
        if (artistAndSongsDictionary[artist]) {
            [artistAndSongsDictionary[artist] addObject:song];
        } else {
            artistAndSongsDictionary[artist] = [[NSMutableArray alloc] init];
        }
    }
    
    NSSortDescriptor *sortSongsAlphabetically = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    
    for (NSString *key in artistAndSongsDictionary) {
        NSMutableArray *songList = artistAndSongsDictionary[key];
        [songList sortUsingDescriptors:@[sortSongsAlphabetically]];
    }
    
    return artistAndSongsDictionary;
}






@end
