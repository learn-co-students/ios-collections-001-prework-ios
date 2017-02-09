//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    
    NSSortDescriptor *sortArrayAscending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    
    NSArray *returnArray = [array sortedArrayUsingDescriptors:@[ sortArrayAscending ]];
    
    return returnArray;
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    
    NSSortDescriptor *sortArrayDescending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    
    NSArray *returnArray = [array sortedArrayUsingDescriptors:@[sortArrayDescending]];
    
    return returnArray;
}

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {

    NSString *lastNumber = [array lastObject];
    NSString *firstNumber = [array firstObject];
    NSMutableArray *mArray = [array mutableCopy];
    NSInteger lastIndexNumber = mArray.count - 1;
    
//    NSLog(@"%@", lastNumber);
//    NSLog(@"%@", firstNumber);
    
    [mArray replaceObjectAtIndex:0 withObject:lastNumber];
    [mArray replaceObjectAtIndex:lastIndexNumber withObject:firstNumber];
    
//    NSLog(@"%@", mArray);
    
    NSArray *returnArray = [NSArray arrayWithArray:mArray];

    return returnArray;
}

- (NSArray *)arrayByReversingArray:(NSArray *)array {
    

    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger startIndex = 0; startIndex < array.count; startIndex++) {
        
        [mArray addObject:[array objectAtIndex:(array.count - 1) - startIndex]];
        
    }
//    NSLog(@"New Array is.\n%@", mArray);
    
    NSArray *returnArray = [NSArray arrayWithArray:mArray];
    
    return returnArray;
}

- (NSString *)stringInBasicLeetFromString:(NSString *)string {

    NSDictionary *leetDictionary = @{
        @"a" : @4,
        @"s" : @5,
        @"i" : @1,
        @"l" : @1,
        @"e" : @3,
        @"t" : @7
    };
    
    NSMutableString *mString = [[NSMutableString alloc] init];
    NSInteger stringLength = string.length;
    
//    NSLog(@"The New String is:\n%@", string);
    
    
    for (NSUInteger i = 0; i < stringLength; i++) {
        
        char characterAtIndex = [string characterAtIndex:i];
        NSString *newString = [NSString stringWithFormat:@"%c", characterAtIndex];
        
//        NSLog(@"%@", newString);
        
        if ([leetDictionary valueForKey:newString]) {
            
            NSString *insertString = [NSString stringWithFormat:@"%@", [leetDictionary objectForKey:newString]];
            
            [mString insertString:insertString atIndex:i];
        } else {
            
            [mString insertString:newString atIndex:i];
        }
        
    }
    
//    NSLog(@"The New String is:\n%@", mString);
    
    NSString *returnString = [NSString stringWithString:mString];
    
    
    return returnString;
}

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    
    NSPredicate *negativeFilter = [NSPredicate predicateWithFormat:@"self < 0"];
    NSPredicate *positiveFilter = [NSPredicate predicateWithFormat:@"self >= 0"];
    
    NSArray *negRegArray = [array filteredArrayUsingPredicate:negativeFilter];
    NSArray *posRegArray = [array filteredArrayUsingPredicate:positiveFilter];
    
//    NSLog(@"%@", negRegArray);
//    NSLog(@"%@", posRegArray);
    
    NSArray *returnArray = @[negRegArray, posRegArray];
    
//    NSLog(@"This is the resultant array:\n%@", returnArray);
    
    return returnArray;
    
    
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary {

    NSMutableArray *hobbitNames = [[NSMutableArray alloc] init];
    
    for (NSString *key in dictionary) {
        NSString *typeOfPerson = [dictionary valueForKey:key];
        
        if ([typeOfPerson isEqualToString:@"hobbit"]) {
            [hobbitNames addObject:key];
        }
        
    }
    
    NSArray *returnArray = [NSArray arrayWithArray:hobbitNames];
    
    return returnArray;
}

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array {

    NSPredicate *aFilter = [NSPredicate predicateWithFormat:@"self like[c] 'a*'"];
    
    NSArray *testArray = [array filteredArrayUsingPredicate:aFilter];
    
    return testArray;
}

- (NSInteger)sumOfIntegersInArray:(NSArray *)array {
    
//    NSPredicate *positiveFilter = [NSPredicate predicateWithFormat:@"self > 0"];
    
//    NSArray *filteredArray = [array filteredArrayUsingPredicate:positiveFilter];
    
    NSInteger returnNumber = 0;
    
    for (NSNumber *number in array) {
        
        returnNumber = returnNumber + [number integerValue];
    }
    
    return returnNumber;
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    
    NSDictionary *weirdPlurals = @ {
        @"foot" : @"feet" ,
        @"box" : @"boxes",
            @"ox" : @"oxen",
        @"radius" : @"radii",
        @"trivium" : @"trivia"
    };
    
    
    
    NSMutableArray *mReturnArray = [[NSMutableArray alloc] init];
    
    for (NSString *word in array) {
        NSMutableString *wordToPluralize = [[NSMutableString alloc] init];
        
        if (weirdPlurals[word]) {
            [mReturnArray addObject:weirdPlurals[word]];
        } else {
            [wordToPluralize appendFormat:@"%@s", word];
            
            [mReturnArray addObject:wordToPluralize];
        }
        
    }
    
    NSArray *returnArary = [NSArray arrayWithArray:mReturnArray];
    
    return returnArary;
}

-(NSDictionary *)countsOfWordsInString:(NSString *)string {


    
    NSPredicate *punctuationPredicate = [NSPredicate predicateWithFormat:
                                         @"NOT (self CONTAINS '.') AND NOT (self CONTAINS ';') AND NOT (self CONTAINS ',') AND NOT (self CONTAINS '-')"];
    
    NSDictionary *punctuationDict = @{
        @";" : @"",
        @"-" : @"",
        @"," : @"",
        @"." : @""
    };
    
    NSArray *splitArray = [string componentsSeparatedByString:@" "];
    NSMutableArray *mSplitArray = [splitArray mutableCopy];
    
    for (NSUInteger i = 0; i < mSplitArray.count; i++) {
        NSString *wordInString = [mSplitArray objectAtIndex:i];
        NSString *endOfString = [wordInString substringFromIndex:wordInString.length -1];
//        NSLog(@"%@", endOfString);
        if (punctuationDict[endOfString]) {
            [mSplitArray replaceObjectAtIndex:i withObject:[wordInString substringToIndex:wordInString.length - 1]];
            // remove suffix
            // replace object at index

        } else {
            // do nothing
        }
    
    
    }
    
//    NSLog(@"%@", mSplitArray);

    
    NSMutableDictionary *returnDictionary = [[NSMutableDictionary alloc] init];
    
    for (NSString *word in mSplitArray) {
        if (returnDictionary[word]) {
            // do nothing if word already exists
        } else {
            
            
            // create filter for that word
            NSPredicate *wordToFilterOut = [NSPredicate predicateWithFormat:@"self like[c] %@", word];
            NSArray *countOfWordArray = [mSplitArray filteredArrayUsingPredicate:wordToFilterOut];
            // get filtered array count
//            NSLog(@"%@", countOfWordArray);
            NSUInteger totalWords = countOfWordArray.count;
            // add that count to the dictionary
            // add word to dictionary

            returnDictionary[[word lowercaseString]] = @(totalWords);
        }
    }
    
//    NSLog(@"%@", returnDictionary);
    
    return returnDictionary;
    
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array{

//    songList = @[ @"Coldplay - Strawberry Swing"        ,
//                  @"Johnny Flynn - In April"            ,
//                  @"Coldplay - Clocks"                  ,
//                  @"Sigur Rós - Andvari"                ,
//                  @"Ryan Adams - When The Stars Go Blue",
//                  @"Coldplay - Viva la Vida"            ,
//                  @"Johnny Flynn - Cold Bread"          ,
//                  @"Sigur Rós - Glósóli"                ,
//                  @"Ryan Adams - La Cienega Just Smiled"
//                  ];
//    
//    songsByArtist = @{ @"Coldplay"     : @[ @"Clocks"          ,
//                                            @"Strawberry Swing",
//                                            @"Viva la Vida"    ]       ,
//                       @"Johnny Flynn" : @[ @"Cold Bread",
//                                            @"In April"  ]             ,
//                       @"Ryan Adams"   : @[ @"La Cienega Just Smiled",
//                                            @"When The Stars Go Blue"] ,
//                       @"Sigur Rós"    : @[ @"Andvari" ,
//                                            @"Glósóli" ]
//                       };
    
//    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    NSMutableDictionary *roughInputDictionary = [[NSMutableDictionary alloc] init];

    
    
    for (NSString *inputString in array) {
        NSArray *splitArray = [inputString componentsSeparatedByString:@" - "];
        roughInputDictionary[[splitArray objectAtIndex:0]] = @"";
    }
    
    for (NSString *artst in [roughInputDictionary allKeys]) {
        NSPredicate *filteredSongs = [NSPredicate predicateWithFormat:@"self CONTAINS[d] %@", artst];
        NSArray *songArray = [array filteredArrayUsingPredicate:filteredSongs];
//        NSLog(@"%@", songArray);
        NSMutableArray *mArray = [[NSMutableArray alloc] init];
        
        for (NSString *artistSong in songArray) {
            NSArray *splitArray = [artistSong componentsSeparatedByString:@" - "];
            
//            NSLog(@"%@", splitArray);
            
            for (NSUInteger i = 0 ; i < splitArray.count; i++) {
                
                if (!roughInputDictionary[[splitArray objectAtIndex:i]]) {
                    [mArray addObject:[splitArray objectAtIndex:i]];
                }
            }

        }
        
        NSSortDescriptor *sortSongByAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
        
        NSArray *sortedSongs= [mArray sortedArrayUsingDescriptors:@[sortSongByAsc]];
        
        roughInputDictionary[artst] = sortedSongs;
        
    }
    
    
//    NSLog(@"%@", roughInputDictionary);
    
    NSDictionary *returnDictionary = [NSDictionary dictionaryWithDictionary:roughInputDictionary];
    
    return returnDictionary;
}


@end
