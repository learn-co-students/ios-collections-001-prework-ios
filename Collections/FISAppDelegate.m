//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *leet = @"leet sauce baby";
    [self stringInBasicLeetFromString:leet];

    return YES;
}

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    NSSortDescriptor *sortByAscend = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *ascenndingArray = [array sortedArrayUsingDescriptors:@[sortByAscend]];
    return ascenndingArray;
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    NSSortDescriptor *sortByDescend = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *descendingArray = [array sortedArrayUsingDescriptors:@[sortByDescend]];
    return descendingArray;
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
    NSMutableArray *arrayWithSwappedFirstAndLastObjects = [NSMutableArray arrayWithArray:array];
    NSUInteger lastObjectInArrayIndex = [array count] - 1;
    NSString *firstObject = array[0];
    NSString *lastObject = array[lastObjectInArrayIndex];
    [arrayWithSwappedFirstAndLastObjects replaceObjectAtIndex:0 withObject:lastObject];
    [arrayWithSwappedFirstAndLastObjects replaceObjectAtIndex:lastObjectInArrayIndex withObject:firstObject];
    return arrayWithSwappedFirstAndLastObjects;
    //would this work with NSNumbers mixed in with strings?
}

-(NSArray *)arrayByReversingArray:(NSArray *)array {
    NSMutableArray *revesedArray = [[NSMutableArray alloc]init];
    NSInteger arrayLastIndex = [array count] - 1;
    for (NSInteger i = arrayLastIndex ; i >= 0; i--) {
        NSString *objectToAdd = array[i];
        [revesedArray addObject:objectToAdd];
    }
    return revesedArray;
}

-(NSString *)stringInBasicLeetFromString:(NSString *)string {
    NSDictionary *oneThreeThreeSeven = @{@"a" : @"4",
                                         @"s" : @"5",
                                         @"i" : @"1",
                                         @"l" : @"1",
                                         @"e" : @"3",
                                         @"t" : @"7",};
    
    NSMutableArray *arrayOfStringChars = [[NSMutableArray alloc]init];
    for (NSUInteger i = 0; i < [string length]; i++) {
        unichar c = [string characterAtIndex:i];
        NSString *charInString = [NSString stringWithFormat:@"%c", c];
        [arrayOfStringChars addObject:charInString];
    }
    
    NSArray *leetKeys = [oneThreeThreeSeven allKeys];
    
    NSString *leetString = @"";
    for (NSString *letter in arrayOfStringChars) {
        NSPredicate *checkForLetterPredicate = [NSPredicate predicateWithFormat:@"self CONTAINS[c] %@", letter];
        BOOL letterCanBeLeet = [leetKeys filteredArrayUsingPredicate:checkForLetterPredicate].count;
        
        if (letterCanBeLeet) {
            leetString = [leetString stringByAppendingString:oneThreeThreeSeven[letter]];
        }else if (!letterCanBeLeet) {
            leetString = [leetString stringByAppendingString:letter];
        }
    }
    
    return leetString;
   
    
}

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    NSSortDescriptor *numbersAscending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *ascendingNumbers = [array sortedArrayUsingDescriptors:@[numbersAscending]];
    return ascendingNumbers;
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary {
    return nil;
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    return nil;
}

-(NSInteger)sumOfIntegersInArray:(NSArray *)array {
    return 0;
}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    return nil;
}

-(NSDictionary *)countsOfWordsInString:(NSString *)string {
    return nil;
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    return nil;
}

@end
