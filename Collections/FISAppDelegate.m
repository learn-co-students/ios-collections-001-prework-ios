//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSArray *songList = @[ @"Coldplay - Strawberry Swing"        ,
                  @"Johnny Flynn - In April"            ,
                  @"Coldplay - Clocks"                  ,
                  @"Sigur Rós - Andvari"                ,
                  @"Ryan Adams - When The Stars Go Blue",
                  @"Coldplay - Viva la Vida"            ,
                  @"Johnny Flynn - Cold Bread"          ,
                  @"Sigur Rós - Glósóli"                ,
                  @"Ryan Adams - La Cienega Just Smiled"
                  ];
;
    [self songsGroupedByArtistFromArray:songList];
    
    

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
    
    NSArray *punctuations = @[@".", @",", @"!", @"?", @":", @";", @"-"];
    
    NSMutableArray *wordsInString = [[NSMutableArray alloc]init];
    NSString *wordInString = @"";
    
    //goes through each char in string to find spaces. The chars between spaces are built into a string and added to an array.
    for (NSUInteger i = 0; i < [string length]; i++) {
        unichar c = [string characterAtIndex:i];
        NSString *charAsString = [NSString stringWithFormat:@"%c", c];
        
        
        //prevents punctuation from being added onto word that will be added to array
        BOOL charIsPunctuation = NO;
        for (NSString *punc in punctuations) {
            if ([charAsString isEqualToString:punc]) {
                charIsPunctuation = YES;
            }
        }
        if (charIsPunctuation && i != [string length]-1) { 
            continue;
        }
        
        
        //detects a space to isolate the word and add it to array
        BOOL charIsASpace = [charAsString isEqualToString:@" "];
        if (charIsASpace) {
            [wordsInString addObject:wordInString];
            wordInString = @"";
        
        //adds last word to array if last char is punctuation.
        }else if (charIsPunctuation) {
            [wordsInString addObject:wordInString];
            
        //adds last word to the array if the statment does not end with a space.
        } else if (i == [string length]-1) {
            wordInString = [wordInString stringByAppendingFormat:@"%@", charAsString];
            [wordsInString addObject:wordInString];
        
        } else {
            wordInString = [wordInString stringByAppendingFormat:@"%@", charAsString];
        }
    }
    NSLog(@"wordsInStringArray: %@", wordsInString);
    
    //determines how many times the word comes up in the string and adds it to dictionary
    NSMutableDictionary *keyWordValueCount = [[NSMutableDictionary alloc]init];
    
    //prevents for loop from double counting words once they have been added to dictionary
    for (NSString *word in wordsInString) {
        for (NSString *key in keyWordValueCount) {
            if ([word isEqualToString:key]) {
                continue;
            }
        }
        
        NSPredicate *filterWordPredicate = [NSPredicate predicateWithFormat:@"self LIKE[c] %@", word];
        NSInteger numberOfOccurancesOfWordInString = [wordsInString filteredArrayUsingPredicate:filterWordPredicate].count;
        NSNumber *valueForWord = @(numberOfOccurancesOfWordInString);
        keyWordValueCount[[word lowercaseString]] = valueForWord; //lower case key is needed to pass test!
    }
    NSLog(@"%@", keyWordValueCount);
 

    
    return keyWordValueCount;
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    
    
    NSMutableDictionary *artistsAndSongs = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *songByArtistDictionary = [[NSMutableDictionary alloc]init];
    
    //finds each song and artist and adds them to a dictionary where song title is key and artist is the value
    for (NSString *string in array) {
        
        NSString *artist = @"";
        NSString *song = @"";
        BOOL artistWasFound = NO;
        
        for (NSUInteger i = 0; i < [string length]; i++) {
            unichar c = [string characterAtIndex:i];
            NSString *charAsString = [NSString stringWithFormat:@"%c", c];
            
            if ([charAsString isEqualToString:@"-" ] && !artistWasFound) {
                artist = [artist stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                artistsAndSongs[artist] = [[NSMutableArray alloc]init];
                artistWasFound = YES;
                
            } else if (!artistWasFound){
                artist = [artist stringByAppendingString:charAsString];
            }
            
            if (artistWasFound && i != [string length]-1) {
                song = [song stringByAppendingString:charAsString];
                
            } else if ([string length]-1 == i) {
                song = [song stringByAppendingString:charAsString];
                song = [song stringByReplacingOccurrencesOfString:@"-" withString:@""];
                song = [song stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                songByArtistDictionary[song] = artist;
            }
        }
    }
    
    //add song to array that is the artist value in artistsAndSongs
    for (NSString *key in songByArtistDictionary) {
        NSString *addToArtist = [NSString stringWithFormat:@"%@", songByArtistDictionary[key]];
        [artistsAndSongs[addToArtist] addObject:key];
    }
   
    //alphabatize song arrays
    for (NSString *key in artistsAndSongs) {
        [artistsAndSongs[key] sortUsingSelector:@selector(caseInsensitiveCompare:)];
    }
    
    NSLog(@"%@", artistsAndSongs);

    return artistsAndSongs;
}

@end
