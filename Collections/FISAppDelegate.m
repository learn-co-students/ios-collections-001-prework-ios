//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

// ascending array sort
- (NSArray *)arrayBySortingArrayAscending:(NSArray *)arrayToSortAsc {
    NSSortDescriptor *sortArrayAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *sortedArrayAsc = [arrayToSortAsc sortedArrayUsingDescriptors:@[sortArrayAsc]];
    return sortedArrayAsc;
}

//descending array sort
- (NSArray *)arrayBySortingArrayDescending:(NSArray *)arrayToSortDesc{
    NSSortDescriptor *sortArrayDesc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *sortedArrayDesc = [arrayToSortDesc sortedArrayUsingDescriptors:@[sortArrayDesc]];
    return sortedArrayDesc;
}

//swapping arrays first and last objects
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)arrayToSwapObjs{
    NSMutableArray *mArrayToSwapObjs = [arrayToSwapObjs mutableCopy];
    [mArrayToSwapObjs exchangeObjectAtIndex:0 withObjectAtIndex:([arrayToSwapObjs count] - 1)];
    return mArrayToSwapObjs;
}

// reversing an array
- (NSArray *)arrayByReversingArray:(NSArray *)arrayToBeReversed;{
    //create two  mutable copies of the array for the object swap
    NSMutableArray *mArrayToBeReversedFirstHalf = [arrayToBeReversed mutableCopy];
    NSMutableArray *mArrayToBeReversedSecondHalf = [arrayToBeReversed mutableCopy];
    //replace the first half objects of the first mutable copy with the second half of the second mutable copy
    for (NSUInteger i = 0; i <= [arrayToBeReversed count]/2; i++) {
        NSUInteger indexToSwapWithI = [arrayToBeReversed count] - 1 - i;
        [mArrayToBeReversedFirstHalf replaceObjectAtIndex:i withObject:mArrayToBeReversedSecondHalf[indexToSwapWithI]];
    }
    //replace the second half objects of the first mutable copy with the second half objects with the second mutable copy
    for (NSUInteger i = [arrayToBeReversed count]-1; i >= [arrayToBeReversed count]/2; i--) {
        NSUInteger indexToSwapWithI = [arrayToBeReversed count] - 1 - i;
        [mArrayToBeReversedFirstHalf replaceObjectAtIndex:i withObject:mArrayToBeReversedSecondHalf[indexToSwapWithI]];
    }
    
    // create an array to return just for the sake of readability
    NSMutableArray *arrayToReturn = [mArrayToBeReversedFirstHalf copy];
    
    //return the array
    return arrayToReturn;
    
    //below is a shorter way to do this. I commented it out so I can try doing the same thing without the below method
    //NSArray *newArrayToBeReversed = [[arrayToBeReversed reverseObjectEnumerator] allObjects];
    //return newArrayToBeReversed;
}


// basic leet method. two ways of doing it, i like neither of them actually. I should find a better way at some point.
- (NSString *)stringInBasicLeetFromString:(NSString *)basicLeetString{
    
    NSMutableString *mBasicLeetString = [basicLeetString mutableCopy];
    for (NSUInteger i = 0; i < [basicLeetString length]; i++) {
        NSRange indexRange = NSMakeRange(i,1);
        if ([basicLeetString characterAtIndex:i] == 'a') {
            [mBasicLeetString replaceCharactersInRange:indexRange withString:@"4"];
        }
        if ([basicLeetString characterAtIndex:i] == 's') {
            [mBasicLeetString replaceCharactersInRange:indexRange withString:@"5"];
        }
        if ([basicLeetString characterAtIndex:i] == 'e') {
            [mBasicLeetString replaceCharactersInRange:indexRange withString:@"3"];
        }
        if (([basicLeetString characterAtIndex:i] == 'i') || ([basicLeetString characterAtIndex:i] == 'l')) {
            [mBasicLeetString replaceCharactersInRange:indexRange withString:@"1"];
        }
        if ([basicLeetString characterAtIndex:i] == 't') {
            [mBasicLeetString replaceCharactersInRange:indexRange withString:@"7"];
        }
    }
    return mBasicLeetString;
    
    /*
    basicLeetString = [basicLeetString stringByReplacingOccurrencesOfString:@"a" withString:@"4"];
    basicLeetString = [basicLeetString stringByReplacingOccurrencesOfString:@"e" withString:@"3"];
    basicLeetString = [basicLeetString stringByReplacingOccurrencesOfString:@"s" withString:@"5"];
    basicLeetString = [basicLeetString stringByReplacingOccurrencesOfString:@"i" withString:@"1"];
    basicLeetString = [basicLeetString stringByReplacingOccurrencesOfString:@"l" withString:@"1"];
    basicLeetString = [basicLeetString stringByReplacingOccurrencesOfString:@"t" withString:@"7"];
    return basicLeetString;
    */
}

//splitting an array into two sub-arrays: one with all the negative objects and the other with all the positive objects including zero
- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)arrayToSplit{
    NSMutableArray *arrayWithNegatives = [[NSMutableArray alloc] init];
    NSMutableArray * arrayWithPositives = [[NSMutableArray alloc] init];
    
    for (NSUInteger i=0; i < [arrayToSplit count]; i++) {
        if ([arrayToSplit[i] integerValue] < 0) {
            [arrayWithNegatives addObject:arrayToSplit[i]];
        }
        else {
            [arrayWithPositives addObject:arrayToSplit[i]];
        }
    }
    
    NSArray *arrayToReturn = [NSArray arrayWithObjects:arrayWithNegatives,arrayWithPositives,nil];
    return arrayToReturn;
}


//finding hobbit names in a dictonary and returning an array that includes those names
- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbitDictonary{
    NSMutableArray *mHobbitNames = [[NSMutableArray alloc] init];
    for (NSString *hobbits in hobbitDictonary) {
        if ([hobbitDictonary[hobbits] isEqualToString:@"hobbit"]) {
            [mHobbitNames addObject:hobbits];
        }
    }
    return mHobbitNames;
}


//finding strings that start with the letter a in an array and returning them in an array
- (NSArray *)stringsBeginningWithAInArray:(NSArray *)arrayWithStrings{
    NSMutableArray *arrayOfStringsThatStartWithA = [[NSMutableArray alloc] init];
    for (NSUInteger i =0; i < [arrayWithStrings count]; i++) {
        if ([arrayWithStrings[i] characterAtIndex:0] == 'a' || [arrayWithStrings[i] characterAtIndex:0] == 'A') {
            [arrayOfStringsThatStartWithA addObject:arrayWithStrings[i]];
        }
    }
    return arrayOfStringsThatStartWithA;
}


//sum of integers in an array
- (NSInteger)sumOfIntegersInArray:(NSArray *)arrayForSum{
    NSUInteger sumOfIntegers = 0;
    for (NSUInteger i = 0; i < [arrayForSum count]; i++) {
        sumOfIntegers += [arrayForSum[i] integerValue];
    }
    return sumOfIntegers;
}

// assuming that the strings in the array are all lowercase
- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)arrayWithStrToPluralize;{
    NSMutableArray *arrayWithPluralStrings = [[NSMutableArray alloc] init];
    for (NSString *stringToCheck in arrayWithStrToPluralize) {
        if ([stringToCheck isEqualToString:@"ox"]) {
            [arrayWithPluralStrings addObject:@"oxen"];
        }
        else if ([stringToCheck isEqualToString:@"foot"]) {
            [arrayWithPluralStrings addObject:@"feet"];
        }
        else if ([stringToCheck isEqualToString:@"radius"]) {
            [arrayWithPluralStrings addObject:@"radii"];
        }
        else if ([stringToCheck isEqualToString:@"trivium"]) {
            [arrayWithPluralStrings addObject:@"trivia"];
        }
        else if ([stringToCheck isEqualToString:@"ox"]) {
            [arrayWithPluralStrings addObject:@"oxen"];
        }
        else if ([stringToCheck characterAtIndex:([stringToCheck length]-1)] == 'x') {
            NSString *stringToAdd = [stringToCheck stringByAppendingString:@"es"];
            [arrayWithPluralStrings addObject:stringToAdd];
        }
        else {
            NSString *stringToAddEverythingElse = [stringToCheck stringByAppendingString:@"s"];
            [arrayWithPluralStrings addObject:stringToAddEverythingElse];
        }
    }
    return arrayWithPluralStrings;
}

// a method to counts words in a string and returns a dictionary with the words and the counts of each word
- (NSDictionary *)countsOfWordsInString:(NSString *)stringForWordCount{
    NSArray *wordsSeparatedFromStringWithEmptyStrings = [stringForWordCount componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@",.-; "]];
    
    // I found empty strings in the array which needed to be cleaned, so, here we go:
    NSMutableArray *wordsSeparatedFromString = [[NSMutableArray alloc] init];
    for (NSString *eliminateEmptyStrings in wordsSeparatedFromStringWithEmptyStrings) {
        if ([eliminateEmptyStrings length]) {
            [wordsSeparatedFromString addObject:eliminateEmptyStrings];
        }
    }
    
    // now use the clean array, no emty strings in it, just words... create a second copy so we can have the nested for loops:
    NSMutableArray *arrayToUseForWordSearch = [wordsSeparatedFromString copy];
    
    NSMutableDictionary *wordCountDictionary = [[NSMutableDictionary alloc] init];
    NSUInteger wordCount = 0;
    
    for (NSString *wordToSearch in arrayToUseForWordSearch) {
        for (NSString *wordToCount in wordsSeparatedFromString) {
            if ([wordToCount isEqualToString:wordToSearch]) {
                wordCount++;
            }
        }
        [wordCountDictionary setObject:[NSNumber numberWithUnsignedInteger:wordCount] forKey:[wordToSearch lowercaseString]];
        wordCount = 0;
    }
    return wordCountDictionary;
}

/////////////////////////////////////////////////////////////////////////////////
// LAST METHOD: This one creates a dictionary with artist names and their songs//
/////////////////////////////////////////////////////////////////////////////////

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)arrayWithSongsToBeGrouped;{
    NSMutableArray *allArtistsAndSongs = [[NSMutableArray alloc]init];
    NSMutableDictionary *songsOfArtistsDictionary = [[NSMutableDictionary alloc] init];
    NSArray *eachArtistEachSong = @[];
    NSMutableArray *mEachArtistEachSong = [[NSMutableArray alloc] init];
    
    //separate the singer name and the song name in to two separate strings and put them in an array
    for (NSString *artistAndSong in arrayWithSongsToBeGrouped) {
        eachArtistEachSong = [artistAndSong componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"-"]];
        mEachArtistEachSong = [eachArtistEachSong mutableCopy];
        [allArtistsAndSongs addObjectsFromArray:mEachArtistEachSong];
        [mEachArtistEachSong removeAllObjects];
    }
    //strings still have spaces to be trimmed so lets trim the strings
        for (NSUInteger i =0; i < [allArtistsAndSongs count]; i++)
            allArtistsAndSongs[i] = [allArtistsAndSongs[i] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]];
    
    //let's create (yet) another array to keep the artist names so we can iterate in the previous array to find what songs belong to them and put those songs into a separate array
    NSMutableArray *allArtistNamesWithDuplicates = [[NSMutableArray alloc]init];
    
    //create an array with artist names. but there are duplicates
    for (NSUInteger i = 0; i < [allArtistsAndSongs count]; i+=2) {
        [allArtistNamesWithDuplicates addObject:allArtistsAndSongs[i]];
    }
    
    //cleaning duplicate artist names from the array
    NSOrderedSet *setForArtistNames = [NSOrderedSet orderedSetWithArray:allArtistNamesWithDuplicates];
    NSArray *allArtistNames = [setForArtistNames array];
    
    //can we put the song names into an array and add the artist-song match into the dictionary?
    for (NSString *eachArtist in allArtistNames) {
        // initialize the nsMutableArray here so it is empty with each iteration.
        //(if you do removeAll in the end of the loop then the dictionary becomes empty, too. We definitely do not want that!!!)
        NSMutableArray *songsForTheArtist = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < [allArtistsAndSongs count]-1; i++) {
            if ([eachArtist isEqualToString:allArtistsAndSongs[i]]) {
                [songsForTheArtist addObject:allArtistsAndSongs[i+1]];
            }
        }
        // add to the dictionary here
        [songsOfArtistsDictionary setObject:songsForTheArtist forKey:eachArtist];
    }
    return songsOfArtistsDictionary;
}


@end
































