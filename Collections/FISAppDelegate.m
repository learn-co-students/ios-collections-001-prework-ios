//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}


-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array{
    
    NSSortDescriptor *arrayBySortingArrayByAscending = [NSSortDescriptor sortDescriptorWithKey:nil
                    ascending:YES];
    
    NSArray *ascendingArray = [array sortedArrayUsingDescriptors:@[arrayBySortingArrayByAscending]];
    
    return ascendingArray;
}


-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array{
    NSSortDescriptor *arrayBySortingArrayByDescending = [NSSortDescriptor sortDescriptorWithKey:nil
                    ascending:NO];
    
    NSArray *descendingArray = [array sortedArrayUsingDescriptors:@[arrayBySortingArrayByDescending]];
    return descendingArray;
}


-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array{
    
    NSMutableArray *ArrayCopy = [array mutableCopy];
    
    [ArrayCopy exchangeObjectAtIndex:0 withObjectAtIndex:ArrayCopy.count - 1];
    
    NSArray *nsarrayArray = [NSArray arrayWithArray:ArrayCopy];
    return nsarrayArray;
    
}

-(NSArray *)arrayByReversingArray:(NSArray *)array{
    
    NSArray* reversedArray = [[array reverseObjectEnumerator] allObjects];
    
    return reversedArray;

}


-(NSString *)stringInBasicLeetFromString:(NSString *)string{
    
    NSDictionary *leetConversions = @{ @"a" : @"4" ,
                                       @"s" : @"5" ,
                                       @"i" : @"1" ,
                                       @"l" : @"1" ,
                                       @"e" : @"3" ,
                                       @"t" : @"7" };
    NSString *leetString = string;
    
    for (NSString *key in leetConversions) {
        leetString= [leetString stringByReplacingOccurrencesOfString:key
                                              withString:leetConversions[key]];
    }
    
    return leetString;
}
-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array{
    
    NSPredicate *positiveNumbersPredicate = [NSPredicate predicateWithFormat:@"self >= 0.0"];
    NSArray *positiveArray = [array filteredArrayUsingPredicate:positiveNumbersPredicate];
    
    NSPredicate *negativeNumbersPredicate = [NSPredicate predicateWithFormat:@"self < 0.0"];
    NSArray *negativeArray = [array filteredArrayUsingPredicate:negativeNumbersPredicate];
    NSArray *combinedArray = @[negativeArray, positiveArray];
    
    return combinedArray;
}


-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary{
    NSMutableArray *namesOfHobbitsInDictionary = [NSMutableArray new];
    
    for (NSString *key in dictionary) {
        if ([dictionary[key] isEqualToString:@"hobbit"]) {
            [namesOfHobbitsInDictionary addObject:key];
        }
    }
    return namesOfHobbitsInDictionary;
    
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array{
    NSPredicate *stringBeginsWithAPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *beginsWihAArray = [array filteredArrayUsingPredicate:stringBeginsWithAPredicate];
    
    
    return beginsWihAArray;
}
-(NSInteger)sumOfIntegersInArray:(NSArray *)array{
    
    NSInteger total = 0;
    for (NSNumber *number in array) {
        total += [number integerValue];
        
    }
    return total;
}


-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array{

    NSMutableArray *pluralWords = [NSMutableArray new];
    
    for (NSString *word in array) {
        NSString *pluralWord = @"";
        
        if ([word containsString:@"oo"]) { //Foot to feet
           
            pluralWord = [word stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
        
        } else if ([word hasPrefix:@"ox"]) { //ox to oxen
        
            pluralWord = [word stringByAppendingString:@"en"];
        
        } else if ([word hasSuffix:@"ox"]) {//box to boxes
        
            pluralWord = [word stringByAppendingString:@"es"];
        
        } else if ([word hasSuffix:@"us"]) { //radius to radii
            
            pluralWord = [word stringByReplacingOccurrencesOfString:@"us" withString:@"i"];
        
        } else if ([word hasSuffix:@"ium"]) {//trivium to trivia
            
            pluralWord = [word stringByReplacingOccurrencesOfString:@"ium" withString:@"ia"];
        
        } else { //add s
            pluralWord = [word stringByAppendingString:@"s"];
        }
        [pluralWords addObject:pluralWord];
    }
    
    return pluralWords;
}


-(NSDictionary *)countsOfWordsInString:(NSString *)string{
    
    NSString *lowerCaseString = [string lowercaseString];
    
    NSArray *GivenPunctuations = @[@"." , @"," , @"-", @";"];
    
    NSString *caseInsesitiveNoPunctuation = lowerCaseString;
    
    for (NSString *punctuation in GivenPunctuations) {
        caseInsesitiveNoPunctuation = [caseInsesitiveNoPunctuation stringByReplacingOccurrencesOfString:punctuation withString:@""];
    }
    
    NSArray *stringsInArray = [caseInsesitiveNoPunctuation componentsSeparatedByString:@" "];
    
    NSMutableDictionary *countOfWordOccurence = [NSMutableDictionary new];
    
    for (NSString *string in stringsInArray) {
        if ([countOfWordOccurence[string] integerValue] > 0) {
            NSInteger count = [countOfWordOccurence[string] integerValue] + 1;
            countOfWordOccurence[string] = @(count);
            
        } else{
            countOfWordOccurence[string] = @1;
        }
    }
    
    return countOfWordOccurence;
}


-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array{
    
    //Result dicitonary
    NSMutableDictionary *songsGroupedByArtist = [NSMutableDictionary new];
    
    
    for (NSString *string in array) {
        NSMutableArray *artistAndSong = [[string componentsSeparatedByString:@" - "] mutableCopy]; //Split individual strings into array
        
        //Store artist and song
        NSString *artistOnly = artistAndSong[0];
        NSString *songOnly = artistAndSong[1];
        
        //Add song if artist already exists in dicionary
        if ([[songsGroupedByArtist allKeys] containsObject:artistOnly ]) {
            [songsGroupedByArtist[artistOnly] addObject:songOnly];
       
        } else {
            
            [songsGroupedByArtist setValue:songOnly
                                    forKey:artistOnly];
        }
        
        }
    
    NSSortDescriptor *sortedAscending = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                      ascending:YES];
    
    for (NSString *artistOnly in songsGroupedByArtist) {
        [songsGroupedByArtist[artistOnly] sortUsingDescriptors:@[sortedAscending]];

    }
    
    return [NSDictionary dictionaryWithDictionary:songsGroupedByArtist];
    
}

@end
