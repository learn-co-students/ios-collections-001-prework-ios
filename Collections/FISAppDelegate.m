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
    
    NSPredicate *aFilter = [NSPredicate predicateWithFormat:@"self BEGINSWITH 'a'"];
    return [array filteredArrayUsingPredicate:aFilter];
}

- (NSInteger)sumOfIntegersInArray:(NSArray *)array {
    
    return 0;
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    
    return nil;
}

- (NSDictionary *)countsOfWordsInString:(NSString *)string {
    
    return nil;
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    
    return nil;
}

@end
