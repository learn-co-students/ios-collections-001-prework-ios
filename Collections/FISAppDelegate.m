//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)ascending {
    //NSArray *ascendingPrimes = @[ @2, @3, @5, @7, @11, @13, @17, @19, @23 ];
    //expect([appDelegate arrayBySortingArrayAscending:chaoticPrimes]).to.equal(ascendingPrimes);
    NSSortDescriptor *sortNumberByAscending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:true];
    return [ascending sortedArrayUsingDescriptors:@[sortNumberByAscending]];
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)descending {
    // NSArray *descendingPrimes = @[ @23, @19, @17, @13, @11, @7, @5, @3, @2];
    //expect([appDelegate arrayBySortingArrayDescending:chaoticPrimes]).to.equal(descendingPrimes);
    NSSortDescriptor *sortNumberByDescending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:false];
    return [descending sortedArrayUsingDescriptors:@[sortNumberByDescending]];
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)swapFirstForLast {
    //expect([appDelegate arrayBySwappingFirstObjectWithLastObjectInArray:chaoticPrimes]).to.beKindOf([NSArray class]);
    NSMutableArray *nowMutableArray = [swapFirstForLast mutableCopy];
    NSUInteger lastInArray = nowMutableArray.count -1;
    [nowMutableArray exchangeObjectAtIndex:0 withObjectAtIndex:lastInArray];
    return nowMutableArray;
}

-(NSArray *)arrayByReversingArray:(NSArray *)reversedArray {
    //expect([appDelegate arrayByReversingArray:chaoticPrimes]).to.beKindOf([NSArray class]);
    NSMutableArray *mutableArray = [reversedArray mutableCopy];
    
    for (NSUInteger i = 0 ; i < (mutableArray.count / 2); i++) {
        NSUInteger j = mutableArray.count - 1 - i;
        [mutableArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    
    return [NSArray arrayWithArray:mutableArray];
    }

//NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name"
//                                                                ascending:YES
//                                                                 selector:@selector(caseInsensitiveCompare:) ];
//
//##THEN APPLY THE DESCRIPTOR (sortbynameasc) TO THE DATA SET
//
//NSArray *alphabetizedMiddleEarthers = [middleEarthers sortedArrayUsingDescriptors:@[sortByNameAsc]];
//
//for (NSDictionary *character in alphabetizedMiddleEarthers) {
//    NSLog(@"%@", character[@"name"]);
//}
//#### now by descending age
//
//NSSortDescriptor *sortByAgeDesc = [NSSortDescriptor sortDescriptorWithKey:@"age"
//                                                                ascending:NO];


-(NSString *)stringInBasicLeetFromString:(NSString *)basicLeetString {
    // returns a string in b451c l337 based on the submitted string",^{
//    NSString *basicLeet = @"basic leet";
//    
//    expect([appDelegate stringInBasicLeetFromString:basicLeet]).to.equal(@"b451c 1337");
    NSDictionary *lettersToNumbers = @{ @"a" : @"4" ,
                                        @"s" : @"5" ,
                                        @"i" : @"1" ,
                                        @"l" : @"1" ,
                                        @"e" : @"3" ,
                                        @"t" : @"7" };
    NSString *leetString = basicLeetString;
    
    for (NSString *key in lettersToNumbers) {
        leetString = [leetString stringByReplacingOccurrencesOfString:key withString:lettersToNumbers[key]];
    }
    
    return leetString;
}


-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)negativePositiveSplitArray {
    //return an array with two sub-arrays, the first with all the negative numbers in the argument array, and the second with all the non-negative (zero and positive) numbers
    NSMutableArray *negatives = [[NSMutableArray alloc] init];
    NSMutableArray *postitives = [[NSMutableArray alloc] init];
    for (NSNumber *number in negativePositiveSplitArray) {
        if ([number floatValue] >= 0) {
            [postitives addObject:number];
        } else if ([number floatValue] < 0) {
            [negatives addObject:number];
        }
    }
    return @[negatives,postitives];
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbits {
    //return an array containing the keys (i.e., character names) from the given dictionary whose value is "hobbit"
    //NSPredicate *namePredicate = [NSPredicate
    NSMutableArray *hobbitNames = [[NSMutableArray alloc] init];
    for (NSString *key in hobbits) {
        if ([hobbits[key] isEqualToString:@"hobbit"]) {
            [hobbitNames addObject:key];
        }
    }
    return hobbitNames;
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)arrayOfStringsBeginningWithA {
    //should return an array containing the strings from the given array begin with the letter "a"
    NSPredicate *beginsWithAPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH [cd] 'a'"];
    NSArray *beginsWithA = [arrayOfStringsBeginningWithA filteredArrayUsingPredicate:beginsWithAPredicate];
    return beginsWithA;
}



-(NSInteger) sumOfIntegersInArray:(NSArray *)arrayOfIntegers {
    //should add together all of the numbers in the submitted array and return the sum.
    NSInteger sum = 0;
    for (NSUInteger i = 0; i<arrayOfIntegers.count; i++) {
        NSInteger currentNumber = [arrayOfIntegers[i] integerValue];
        sum = sum + currentNumber;
    }
    return sum;}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)stringsInArray {
    //should convert the different strings into their correct plural forms. This is more complex than just adding an "s"; you'll have to run checks on the strings so be sure look at the test arrays so that you know the expected plural forms.
    NSMutableArray *plurals = [[NSMutableArray alloc] init];
    
    for (NSString *singular in stringsInArray) {
        NSString *plural = @"";
        if ([singular containsString:@"oo"]) {
            plural = [singular stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
        } else if ([singular containsString:@"ox"]) {
            if ([singular hasPrefix:@"b"]) {
                plural = [singular stringByAppendingString:@"es"];
            } else {
                plural = [singular stringByAppendingString:@"en"];
            }
        } else if ([singular hasSuffix:@"us"]) {
            plural = [singular stringByReplacingOccurrencesOfString:@"us" withString:@"i"];
        } else if ([singular hasSuffix:@"um"]) {
            plural = [singular stringByReplacingOccurrencesOfString:@"um" withString:@"a"];
        } else {
            plural = [singular stringByAppendingString:@"s"];
        }
        [plurals addObject:plural];
    }
    
    return [NSArray arrayWithArray:plurals];
}

-(NSDictionary *)countsOfWordsInString:(NSString *)wordsInString {
    //should return a dictionary that has a key for each word in the submitted string, whose associated value is the count of how many times that word appears in the argument string. Be sure to remove the punctuation (.,-;) and ignore capitalization. For example, if given the string "I think, I thought; I think I.", the method should return @{ @"i": @4, @"think": @2, @"thought": @1 }
    NSArray *punctuationStrings = @[@".", @",", @";", @"-"];
    
    NSString *noPunctuation = wordsInString;
    
    for (NSString *punctuation in punctuationStrings) {
        noPunctuation = [noPunctuation stringByReplacingOccurrencesOfString:punctuation withString:@""];
    }
    
    NSString *lowercaseNoPunctuation = [noPunctuation lowercaseString];
    
    NSArray *arrayOfWords = [lowercaseNoPunctuation componentsSeparatedByString:@" "];
    
    NSMutableDictionary *countsOfWords = [[NSMutableDictionary alloc] init];
    
    for (NSString *word in arrayOfWords) {
        if ([countsOfWords[word] integerValue] > 0) {
            NSInteger newCount = [countsOfWords[word] integerValue] + 1;
            countsOfWords[word] = @(newCount);
        } else {
            countsOfWords[word] = @1;
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:countsOfWords];
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)arrayOfSongs {
     //takes an array of strings of the form "Artist - Title" and should return a dictionary containing a key for each artist, whose value is an array of strings containing song names by that artist. You'll have to split each string and arrange its information into the correct place in the nested data structure. Be sure to alphabetize the arrays of songs before returning the dictionary. If you're using mutable arrays inside the dictionary, you can use the sortUsingDescriptors: method.
    NSMutableDictionary *artistsWithSongs = [[NSMutableDictionary alloc] init];
    
    for (NSString *string in arrayOfSongs) {
        NSArray *artistAndSong = [string componentsSeparatedByString:@" - "];
        NSString *artist = artistAndSong[0];
        NSString *song = artistAndSong[1];
        
        if ([[artistsWithSongs allKeys] containsObject:artist]) {
            [artistsWithSongs[artist] addObject:song];
        } else {
            artistsWithSongs[artist] = [ @[song] mutableCopy];
        }
    }
    
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    for (NSString *artist in artistsWithSongs) {
        [artistsWithSongs[artist] sortUsingDescriptors:@[sortByNilAsc]];
    }
    
    return [NSDictionary dictionaryWithDictionary:artistsWithSongs];
}

@end
