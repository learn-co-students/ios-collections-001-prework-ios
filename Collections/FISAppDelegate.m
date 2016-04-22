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

// should return the objects in the submitted array arranged from low to high.
- (NSArray *)arrayBySortingArrayAscending:(NSArray *)argument {
    
    NSSortDescriptor *sortByAscending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *returnArray = [argument sortedArrayUsingDescriptors:@[sortByAscending]];
    return returnArray;
    
}

//should return the objects in the submitted array arranged from high to low.
- (NSArray *)arrayBySortingArrayDescending:(NSArray *)argument {
    
    NSSortDescriptor *sortByDescending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *returnArray = [argument sortedArrayUsingDescriptors:@[sortByDescending]];
    return returnArray;
}

// should return an array that's like the submitted array, but with first and last objects switched with each other.
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)argument {
    
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger i=0; i<[argument count]; i++) {
        
        NSNumber *parameters = argument[i];
        [returnArray addObject:parameters];
        
        if ((argument[i] == [argument lastObject])) {
            [returnArray exchangeObjectAtIndex:0 withObjectAtIndex:[returnArray count]-1];
        }
    }
    
    return returnArray;
}

// should return an array that is the reverse of the submitted array. Hint: Try swapping objects moving in from the beginning and the end.
- (NSArray *)arrayByReversingArray:(NSArray *)argument {
    
    NSArray *returnArray = [[argument reverseObjectEnumerator] allObjects];
    
    return returnArray;
}

// should convert the following substrings in the submitted string:
- (NSString *)stringInBasicLeetFromString:(NSString *)argument {
    
    NSString *returnString = argument;
    NSDictionary *parameters = @{@"a":@"4", @"s":@"5", @"i":@"1", @"l":@"1",@"e":@"3", @"t":@"7"};
    
    for (NSString *key in parameters) {
        returnString = [returnString stringByReplacingOccurrencesOfString:key withString:parameters[key]];
    }
    
    return returnString;
}

// should return an array with two sub-arrays, the first with all the negative numbers in the argument array, and the second with all the non-negative (zero and positive) numbers.
- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)argument {
    
    NSMutableArray *negativeArray = [[NSMutableArray alloc] init];
    NSMutableArray *positiveArray = [[NSMutableArray alloc] init];
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger i=0; i<[argument count]; i++) {
        NSNumber *parameter = argument[i];
        NSInteger parameterInt = [parameter integerValue];
        if (parameterInt >= 0) {
            [positiveArray addObject:parameter];
        } else {
            [negativeArray addObject:parameter];
        }
    }
    returnArray[0] = negativeArray;
    returnArray[1] = positiveArray;
    
    return returnArray;
}

// should return an array containing the keys (i.e., character names) from the given dictionary whose value is "hobbit".
- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)argument {
    
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];
    
    for (NSString *key in argument) {
        if ([[argument valueForKey:key]  isEqual: @"hobbit"]) {
            [returnArray addObject:key];
        }
    }
    
    return returnArray;
}

// should return an array containing the strings from the given array begin with the letter "a".
- (NSArray *)stringsBeginningWithAInArray:(NSArray *)argument {
    
    NSPredicate *hasLetterA = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSMutableArray *returnArray = [[argument filteredArrayUsingPredicate:hasLetterA] mutableCopy];
    return returnArray;
 
}

// should add together all of the numbers in the submitted array and return the sum.
- (NSInteger)sumOfIntegersInArray:(NSArray *)argument {
    
    NSInteger sum = 0;
    
    for (NSUInteger i=0; i<[argument count]; i++) {
        NSNumber *parameter = argument[i];
        NSInteger parameterInt = [parameter integerValue];
        sum +=parameterInt;
    }
    
    return sum;
}

// should convert the different strings into their correct plural forms. This is more complex than just adding an "s"; you'll have to run checks on the strings so be sure look at the test arrays so that you know the expected plural forms.
- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)argument {
   
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger i=0; i<[argument count]; i++) {
        NSString *parameter = argument[i];
        BOOL isD = [parameter hasSuffix:@"d"];
        BOOL isE = [parameter hasSuffix:@"e"];
        BOOL isBOX = [parameter hasSuffix:@"box"];
        BOOL isOX = [parameter hasPrefix:@"ox"];
        BOOL isUS = [parameter hasSuffix:@"us"];
        BOOL isUM = [parameter hasSuffix:@"um"];
        BOOL isOT = [parameter hasSuffix:@"ot"];
        
        if (isD || isE) {
            parameter = [parameter stringByAppendingString:@"s"];
            [returnArray addObject:parameter];
        }
        if (isBOX) {
            parameter = [parameter stringByReplacingOccurrencesOfString:@"box" withString:@"boxes"];
            [returnArray addObject:parameter];
        }
        if (isUS) {
            parameter = [parameter stringByReplacingOccurrencesOfString:@"radius" withString:@"radii"];
            [returnArray addObject:parameter];
        }
        if (isUM) {
            parameter = [parameter stringByReplacingOccurrencesOfString:@"trivium" withString:@"trivia"];
            [returnArray addObject:parameter];
        }
        if (isOT) {
            parameter = [parameter stringByReplacingOccurrencesOfString:@"foot" withString:@"feet"];
            [returnArray addObject:parameter];
        }
        if (isOX) {
            parameter = [parameter stringByReplacingOccurrencesOfString:@"ox" withString:@"oxen"];
            [returnArray addObject:parameter];
        }
    }
    
    return returnArray;
}

// should return a dictionary that has a key for each word in the submitted string, whose associated value is the count of how many times that word appears in the argument string. Be sure to remove the punctuation (.,-;) and ignore capitalization.
// For example, if given the string "I think, I thought; I think I.", the method should return @{ @"i": @4, @"think": @2, @"thought": @1 }.

- (NSDictionary *)countsOfWordsInString:(NSString *)argument {
    
    
    NSMutableDictionary *returnDictionary = [[NSMutableDictionary alloc] init];
    NSArray *punctuations = @[@".",@",",@"-",@";"];
    NSString *withoutPunctuation = [argument copy];
    NSMutableArray *wordArray = [[NSMutableArray alloc] init];
    NSUInteger counter = 0;
    BOOL hasSpaces = @" ";
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];
    
    // Remove punctuation
    for (NSUInteger i=0; i<[punctuations count]; i++) {
        NSString *punctuation = punctuations[i];
        [punctuation lowercaseString];
        withoutPunctuation = [withoutPunctuation stringByReplacingOccurrencesOfString:punctuation withString:@""];
    }

    for (NSUInteger i=0; i<[withoutPunctuation length]; i++) {
        if (hasSpaces) {
            [returnArray setObject:withoutPunctuation atIndexedSubscript:i];
        }
    }
    
    
    [wordArray addObject:withoutPunctuation];

    
    NSPredicate *wordPredicate = [NSPredicate predicateWithFormat:@"self LIKE '?*?'"];
    NSArray *word = [wordArray filteredArrayUsingPredicate:wordPredicate];
    

        for (NSString *wordToCount in word) {
            if (wordToCount > 0) {
                counter++;
                [returnDictionary setValue:[NSNumber numberWithUnsignedInteger:counter] forKey:[wordToCount lowercaseString]];
            }
            [returnDictionary setValue:@1 forKey:[wordToCount lowercaseString]];
        }
    
    /*
    for (NSUInteger i=0; i<[word count]; i++) {
        NSString *words = word[i];
        for (NSString *wordToCount in wordArray) {
            if ([words isEqualToString:wordToCount]) {
                counter++;
                [returnDictionary setValue:[NSNumber numberWithUnsignedInteger:counter] forKey:words];
            }
            //[returnDictionary setValue:@1 forKey:wordToCount];
        }
        [returnDictionary setValue:@1 forKey:words];
        //[returnDictionary setObject:[NSNumber numberWithUnsignedInteger:counter] forKey:[words lowercaseString]];
        //counter = 0;
    }
    */
    
    
    /*
    for (NSString *parameter in word) {
        NSUInteger wordLengthInt = [parameter length];
        NSNumber *wordLength = @(wordLengthInt);
        [returnDictionary setObject:wordLength forKey:parameter];
    }
    */
    return returnDictionary;
    
    
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)argument {
    
    NSMutableDictionary *returnDictionary = [[NSMutableDictionary alloc] init];


    /*
    for (NSUInteger i=0; i<[argument count]; i++) {
        NSString *songList = argument[i];
        BOOL isColdplay = [songList hasPrefix:@"Colplay"];
        BOOL isJohnny = [songList hasPrefix:@"Johnny"];
        BOOL isSigur = [songList hasPrefix:@"Sigur"];
        BOOL isRyan = [songList hasPrefix:@"Ryan"];
    
        if (isColdplay) {
            NSMutableArray *playlist = [[NSMutableArray alloc] init];
            [playlist setObject:@"Strawberry Swing" atIndexedSubscript:i];
            [returnDictionary setValue:@"Strawberry Swing" forKey:@"Coldplay"];
            [returnDictionary setValue:@"Clocks" forKey:@"Coldplay"];
            [returnDictionary setValue:@"Viva la Vida" forKey:@"Coldplay"];
        }
        if (isJohnny) {
            [returnDictionary setValue:@"In April" forKey:@"Johnny Flynn"];
            [returnDictionary setValue:@"Gold Bread" forKey:@"Johnny Flynn"];
        }
        if (isSigur) {
            [returnDictionary setValue:@"Andvari" forKey:@"Sigur Rós"];
            [returnDictionary setValue:@"Glósóli" forKey:@"Sigur Rós"];
        }
        if (isRyan) {
            [returnDictionary setValue:@"When The Stars Go Blue" forKey:@"Ryan Adams"];
            [returnDictionary setValue:@"La Cienega Just Smiled" forKey:@"Ryan Adams"];
        }
        
    }
     */
    return returnDictionary;
}

@end
