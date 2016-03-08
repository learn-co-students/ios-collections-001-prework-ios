//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSString *thisIsATest = @"T.his. is a test! That's cool, dude!  ";
    [self countsOfWordsInString:thisIsATest];
    
    

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
    
    NSPredicate *positiveNumbersPredicate = [NSPredicate predicateWithFormat:@"self >= 0"];
    NSPredicate *negativeNumbersPredicate = [NSPredicate predicateWithFormat:@"self < 0"];
    
    NSArray *positiveNumbersArray = [array filteredArrayUsingPredicate:positiveNumbersPredicate];
    NSArray *negativeNumbersArray = [array filteredArrayUsingPredicate:negativeNumbersPredicate];
    
    NSArray *arrayWithSubPosAndSubNegNumbers = @[negativeNumbersArray, positiveNumbersArray];
    
    return arrayWithSubPosAndSubNegNumbers;
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary {
    
    NSMutableArray *allHobits = [[NSMutableArray alloc]init];
    
    for (NSString *key in dictionary) {        
        if ([dictionary[key] isEqualToString:@"hobbit"]) {
            [allHobits addObject:key];
        }
    }
    
    return allHobits;
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    
    NSPredicate *stringBeginsWithAPredicate = [NSPredicate predicateWithFormat:@"self LIKE[c] 'a*'"];
    NSArray *stringsBeginningWithA = [array filteredArrayUsingPredicate:stringBeginsWithAPredicate];
    
    return stringsBeginningWithA;
}

-(NSInteger)sumOfIntegersInArray:(NSArray *)array {
    NSInteger sum = 0;
    for (NSNumber *number in array) {
        NSInteger x = [number integerValue];
        sum = sum + x;
    }
    return sum;
}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    
    NSDictionary *pluralForms = @{@"hand" : @"hands",
                                  @"foot" : @"feet",
                                  @"knee" : @"knees",
                                  @"table" : @"tables",
                                  @"box" : @"boxes",
                                  @"ox" : @"oxen",
                                  @"axle" : @"axles",
                                  @"radius" : @"radii",
                                  @"trivium" : @"trivia"};
    
    NSMutableArray *plurals = [[NSMutableArray alloc]init];
    for (NSString *string in array) {
        NSPredicate *isInDictionary = [NSPredicate predicateWithFormat:@"self CONTAINS[c] %@", string];
        BOOL havePluralForm = [[pluralForms allKeys] filteredArrayUsingPredicate:isInDictionary].count;
        if (havePluralForm ) {
            [plurals addObject:pluralForms[string]];
        } else {
            [plurals addObject:[NSString stringWithFormat:@"Plural form of \"%@\" is unknown.", string]];
        }
    }
    
    return plurals;
}

-(NSDictionary *)countsOfWordsInString:(NSString *)string {
    
    NSArray *punctuations = @[@".", @",", @"!", @"?", @"'", @":", @";"];
    
    NSMutableArray *wordsInString = [[NSMutableArray alloc]init];
    NSString *wordInString = @"";
    
    //goes through each char in string to find spaces. The chars between spaces are built into a string and added to an array.
    for (NSUInteger i = 0; i < [string length]; i++) {
        unichar c = [string characterAtIndex:i];
        NSString *charAsString = [NSString stringWithFormat:@"%c", c];
        
        //prevents punctuation from being added onto word
        BOOL charIsPunctuation = 0;
        for (NSString *punc in punctuations) {
            if ([charAsString isEqualToString:punc]) {
                charIsPunctuation = YES;
            }
        }
        if (charIsPunctuation) {
            continue;
        }
        
        //detects a space to isolate the word and add it to array
        BOOL charIsASpace = [charAsString isEqualToString:@" "];
        if (charIsASpace) {
            [wordsInString addObject:wordInString];
            wordInString = @"";
            
        //adds last word to the array if the statment does not end with a space.
        } else if (i == [string length] -1) {
            wordInString = [wordInString stringByAppendingFormat:@"%@", charAsString];
            [wordsInString addObject:wordInString];
        
        } else {
            wordInString = [wordInString stringByAppendingFormat:@"%@", charAsString];
        }
        
        NSLog(@"\n c: %c\n BoolCharIsASpaceBool: %d\n WordInString: %@", c, charIsASpace, wordInString);
        NSLog(@"wordsInStringArray: %@", wordsInString);
        
        
    }
 

    
    return nil;
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    
    //NSSortDescriptor *test = [NSSortDescriptor sortDescriptorWithKey:array[1] ascending:YES selector:@selector(caseInsensitiveCompare:)];
    //NSMutableDictionary *sortedByArtist = [[array self] sortedArrayUsingDescriptors:@[test]];
    //NSLog(@"sort by artist: %@", sortedByArtist);
    return nil;
}

@end
