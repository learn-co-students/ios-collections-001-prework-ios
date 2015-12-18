//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}
// 1
- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    
    NSSortDescriptor *sortedAscendingDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                                ascending:YES];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortedAscendingDescriptor]];
                            
    return sortedArray;
}
// 2
- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    
    NSSortDescriptor *sortedAscendingDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                                ascending:NO];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortedAscendingDescriptor]];
    
    return sortedArray;
}
// 3
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
   
    NSMutableArray *newArray = [array mutableCopy];
    newArray[0] = array[[array count] - 1];
    newArray[[newArray count] - 1 ] = array[0];
    
    return newArray;
}
// 4
- (NSArray *)arrayByReversingArray:(NSArray *)array {
    
    NSMutableArray *reversedArray = [[NSMutableArray alloc] init];
    for (NSInteger i = [array count] - 1; i >= 0; i--) {
        [reversedArray addObject:array[i]];
    }
    return reversedArray;
}
// 5
- (NSString *)stringInBasicLeetFromString:(NSString *)string {
    
    NSDictionary *newStrings = @{
                                  @"a" : @"4",
                                  @"s" : @"5",
                                  @"i" : @"1",
                                  @"l" : @"1",
                                  @"e" : @"3",
                                  @"t" : @"7"
                                  };
    
    for (NSString *key in newStrings) {
        string = [string stringByReplacingOccurrencesOfString:key withString:newStrings[key]];
    }
    return string;
}
// 6
- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    
    NSMutableArray *positives = [[NSMutableArray alloc] init];
    NSMutableArray *negatives = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < array.count; i++) {
        if ([array[i] integerValue] < 0) {
            [negatives addObject:array[i]];
        } else {
            [positives addObject:array[i]];
        }
    }
    NSArray *negativesAndPositives = @[negatives,positives];
    return negativesAndPositives;
}

// 7
- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary {
    NSMutableArray *hobbitsInDictionary = [[NSMutableArray alloc] init];
    for (NSString *name in dictionary) {
        if ([dictionary[name] isEqualToString:@"hobbit"]) {
            [hobbitsInDictionary addObject:name];
        }
    }
    return hobbitsInDictionary;
}
// 8
- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    
    NSPredicate *aPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *stringsBeginWithA = [array filteredArrayUsingPredicate:aPredicate];
    return stringsBeginWithA;
}
// 9
- (NSInteger)sumOfIntegersInArray:(NSArray *)array {
    NSInteger total = 0;
    for (NSNumber *item in array) {
        total += [item integerValue];
    }
    return total;
}


// 10
- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    
    NSDictionary *specialWords = @{@"radius"    :@"radii",
                                   @"foot"      :@"feet",
                                   @"trivium"   :@"trivia",
                                   @"ox"        :@"oxen"  };
    NSMutableArray *pluralStrings = [array mutableCopy];;
    
    for (NSInteger i = 0; i < array.count; i++) {
        if ([[specialWords allKeys]containsObject:pluralStrings[i]]) {
            pluralStrings[i] = specialWords[pluralStrings[i]];
        } else {
            if ([pluralStrings[i] hasSuffix:@"x"]){
                pluralStrings[i] = [pluralStrings[i] stringByAppendingString:@"es"];
            } else {
                pluralStrings[i] = [pluralStrings[i] stringByAppendingString:@"s"];
            }
        }
    }
    return pluralStrings;
}
// 11
- (NSDictionary *)countsOfWordsInString:(NSString *)string {
    
    NSMutableArray *myStrings = [[NSMutableArray alloc]init];
    myStrings = [[[string lowercaseString] componentsSeparatedByCharactersInSet:
                [NSCharacterSet characterSetWithCharactersInString:@".-,; "]]mutableCopy];
    
    NSMutableArray *counts = [[NSMutableArray alloc]init];
    
    NSMutableDictionary *log = [[NSMutableDictionary alloc]init];
    
    for (NSUInteger i = 0; i < [myStrings count]; i++) {
        NSPredicate *punctuationPredicate = [NSPredicate predicateWithFormat:@"self == %@",myStrings[i]];
        counts[i] = [[myStrings filteredArrayUsingPredicate:punctuationPredicate ]mutableCopy];
        log[myStrings[i]] = @([counts[i] count]);
    }
    [log removeObjectForKey:@""];
    return log;
}


//12
- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    
    NSMutableDictionary *songsByArtist = [[NSMutableDictionary alloc] init];
    
    for (NSString *string in array) {
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
    NSSortDescriptor *sortByNilAscending = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                         ascending:YES];
    for (NSString *artist in [songsByArtist allKeys]) {
        [songsByArtist[artist] sortUsingDescriptors:@[sortByNilAscending]];
    }
    return songsByArtist;
}

@end
