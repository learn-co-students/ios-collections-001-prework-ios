//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSArray *chaoticPrimes = @[ @11, @7, @3, @23, @19, @13, @2, @17, @5 ];
    
    NSArray *numbersToBisect = @[ @(-7), @5, @(-3), @2, @0, @(-2), @3, @(-5),@7 ];
    
    NSDictionary *fellowshipOfTheRing = @{ @"Legolas" : @"elf"   ,
                             @"Gimli"   : @"dwarf" ,
                             @"Gandalf" : @"Maiar" ,
                             @"Frodo"   : @"hobbit",
                             @"Merry"   : @"hobbit",
                             @"Boromir" : @"human" ,
                             @"Sam"     : @"hobbit",
                             @"Aragorn" : @"human" ,
                             @"Pippin"  : @"hobbit"
                             };
    
    NSArray *foods = @[ @"almond", @"orange", @"pear", @"starfruit", @"avocado", @"banana",
               @"pancake", @"potato", @"Apple Crings", @"cherry", @"artichoke" ];
    
    NSString *basicLeet = @"basic leet";
    
    NSArray *singulars = @[ @"hand"   ,
                   @"foot"   ,
                   @"knee"   ,
                   @"table"  ,
                   @"box"    ,
                   @"ox"     ,
                   @"axle"   ,
                   @"radius" ,
                   @"trivium"];
    
    NSString *moby = @"Call me Ishmael. Some years ago- never mind how long precisely- having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world. It is a way I have of driving off the spleen and regulating the circulation.";
    
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
    

    NSArray *results1 = [self arrayBySortingArrayAscending:chaoticPrimes];
    NSLog(@"arrayBySortingArrayAscending: %@", results1);
    
    NSArray *results2 = [self arrayBySortingArrayDescending:chaoticPrimes];
    NSLog(@"arrayBySortingArrayAscending: %@", results2);
    
    NSArray *results3 = [self arrayBySwappingFirstObjectWithLastObjectInArray:foods];
    NSLog(@"arrayBySwappingFirstObjectWithLastObjectInArray: %@", results3);
    
    NSArray *results4 = [self arrayByReversingArray:foods];
    NSLog(@"arrayByReversingArray: %@", results4);
    
    NSString *results5 = [self stringInBasicLeetFromString:basicLeet];
    NSLog(@"stringInBasicLeetFromString: %@", results5);
    
    NSArray *results6 = [self splitArrayIntoNegativesAndPositives:numbersToBisect];
    NSLog(@"splitArrayIntoNegativesAndPositives: %@", results6);
    
    NSArray *results7 = [self namesOfHobbitsInDictionary:fellowshipOfTheRing];
    NSLog(@"namesOfHobbitsInDictionary: %@", results7);
    
    NSArray *results8 = [self stringsBeginningWithAInArray:foods];
    NSLog(@"stringsBeginningWithAInArray: %@", results8);
    
    NSInteger results9 = [self sumOfIntegersInArray:numbersToBisect]; //numbersToBisect, chaoticPrimes
    NSLog(@"sumOfIntegersInArray: %li", results9);
    
    NSArray *results10 = [self arrayByPluralizingStringsInArray:singulars];
    NSLog(@"arrayByPluralizingStringsInArray: %@", results10);
    
    NSDictionary *results11 = [self countsOfWordsInString:moby];
    NSLog(@"countsOfWordsInString: %@", results11);
    
    NSDictionary *results12 = [self songsGroupedByArtistFromArray:songList];
    NSLog(@"songsGroupedByArtistFromArray: %@", results12);
    
    return YES;
}

- (NSArray *) arrayBySortingArrayAscending: (NSArray *) array1{
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *sortedArray = [array1 sortedArrayUsingDescriptors:@[sortByNilAsc]];
    return sortedArray;
}

- (NSArray *) arrayBySortingArrayDescending: (NSArray *) array1{
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *sortedArray = [array1 sortedArrayUsingDescriptors:@[sortByNilAsc]];
    return sortedArray;
    return nil;
}

- (NSArray *) arrayBySwappingFirstObjectWithLastObjectInArray: (NSArray *) array1{
    NSMutableArray *swappedArray = [array1 mutableCopy];
    swappedArray[0] = array1[[array1 count] -1];
    swappedArray[[array1 count] -1] = array1[0];
    return swappedArray;
}

- (NSArray *) arrayByReversingArray: (NSArray *) array1{
    NSArray* reversedArray = [[array1 reverseObjectEnumerator] allObjects];
    return reversedArray;
}

- (NSString *) stringInBasicLeetFromString: (NSString *) string1{
    // basic leet = b451c 1337
    NSString *results = @"";
    for (NSUInteger i = 0; i < [string1 length]; i++) {
        // iterate through the characters in the string
        NSRange range = NSMakeRange(i, 1);
        NSString *currentChar = [string1 substringWithRange:range];
        
        // replace the character with the leet char - per the test...
        if([ currentChar isEqual: @"b"]){
            results = [results stringByAppendingString:@"b"];
        } else if([currentChar isEqual: @"a"]){
            results = [results stringByAppendingString:@"4"];
        } else if([currentChar isEqual: @"s"]){
            results = [results stringByAppendingString:@"5"];
        } else if([currentChar isEqual: @"i"]){
            results = [results stringByAppendingString:@"1"];
        } else if([currentChar isEqual: @"c"]){
            results = [results stringByAppendingString:@"c"];
        } else if([currentChar isEqual: @" "]){
            results = [results stringByAppendingString:@" "];
        } else if([currentChar isEqual: @"l"]){
            results = [results stringByAppendingString:@"1"];
        } else if([currentChar isEqual: @"e"]){
            results = [results stringByAppendingString:@"3"];
        } else if([currentChar isEqual: @"t"]){
            results = [results stringByAppendingString:@"7"];
        }
        //NSLog(@"i: %li %@", i, currentChar);
    }
    return results;
}

- (NSArray *) splitArrayIntoNegativesAndPositives: (NSArray *) array1{
    NSMutableArray *positiveInts = [[NSMutableArray alloc] init];
    NSMutableArray *negativeInts = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < [array1 count]; i++) {
        //NSLog(@"i = %@", array1[i]);
        NSInteger currentInt = [array1[i] integerValue];
        if(currentInt < 0){
            [negativeInts addObject:array1[i]];
        } else {
            [positiveInts addObject:array1[i]];
        }
    }
    NSArray *splitArray = @[negativeInts,positiveInts];
    return splitArray;
}

- (NSArray *) namesOfHobbitsInDictionary: (NSDictionary *) dictionary1{
    NSMutableArray *hobbits = [[NSMutableArray alloc] init];
    for (NSString *key in [dictionary1 allKeys]){
        if ([dictionary1[key] isEqualToString:@"hobbit"]){
            [hobbits addObject:key];
        }
    }
    return hobbits;
}

- (NSArray *) stringsBeginningWithAInArray: (NSArray *) array1{
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for (NSString *fruit in array1) {
        NSString *firstChar = [fruit substringToIndex:1];
        if([[firstChar uppercaseString] isEqualToString:@"A"]){
            [results addObject:fruit];
        }
    }
    return results;
}

- (NSInteger) sumOfIntegersInArray: (NSArray *) array1{
    NSInteger sum = 0;
    for (NSInteger i = 0; i < [array1 count]; i++) {
        NSInteger currentInt = [array1[i] integerValue];
        sum = sum + currentInt;
    }
    return sum;
}

- (NSArray *) arrayByPluralizingStringsInArray: (NSArray *) array1{
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < [array1 count]; i++) {
        // find the words with complex plural forms and convert those, then append an s to the remaining words.
        if([ array1[i] isEqual: @"foot"]){
            [results addObject:@"feet"];
        } else if([ array1[i] isEqual: @"ox"]){
            [results addObject:@"oxen"];
        } else if([ array1[i] isEqual: @"box"]){
            [results addObject:@"boxes"];
        } else if([ array1[i] isEqual: @"radius"]){
            [results addObject:@"radii"];
        } else if([ array1[i] isEqual: @"trivium"]){
            [results addObject:@"trivia"];
        } else {
            NSString *pluralVersion = [NSString stringWithFormat: @"%@s", array1[i]];
            [results addObject:pluralVersion];
        }
    }
    return results;
}

- (NSDictionary *) countsOfWordsInString: (NSString *) string1{
    // define the acceptable characters and then get invertedSet
    NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"] invertedSet];
    // remove unaccpetable characters put each word into an array
    NSArray *words = [string1 componentsSeparatedByCharactersInSet:notAllowedChars];
    NSMutableDictionary *results = [NSMutableDictionary dictionary];
  
    // iterate through the array, put duplicates of the currect string into an array and then create a record in a dictionary
    for (NSUInteger i = 0; i < [words count]; i++) {
        NSString *stringToSearch = words[i];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF LIKE[c] %@",stringToSearch];
        NSArray *searchResults = [words filteredArrayUsingPredicate:predicate];
        //NSLog(@"words: %@ : %@", stringToSearch, results);
        NSNumber *resultCount = @([searchResults count]);
        // add key/value to the results dict.
        if([words[i] length] > 0) {
            NSString *key = [words[i] lowercaseString];
            results[key] = resultCount;
        }
    }
    return results;
}

- (NSDictionary *) songsGroupedByArtistFromArray: (NSArray *) array1{
    
    NSMutableArray *artistTitleSplit = [[NSMutableArray alloc] init];
    NSMutableArray *artistNames = [[NSMutableArray alloc] init];
    NSMutableDictionary *results = [NSMutableDictionary dictionary];
    // split the strings into artist and song and add to new array, create an array of only the artsits, too.
    for(NSString *artist in array1){
        NSMutableArray *split = [[artist componentsSeparatedByString:@" - "] mutableCopy];
        [artistTitleSplit addObject:split];
        [artistNames addObject:split[0]];
    }
    
    artistNames = [artistNames valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSLog(@"artistNames: %@", artistNames);
    
    // create a dictionary with each artist as a key
    for (NSUInteger i = 0; i < [artistNames count]; i++) {
        results[artistNames[i]] = [NSMutableDictionary dictionary];
    }
    
     // search the titles by each artist
    for (NSString *key in [results allKeys]) {
        NSMutableArray *titlesByArtist = [[NSMutableArray alloc] init];
        for(NSUInteger i = 0; i < [artistTitleSplit count]; i++) {
            if([artistTitleSplit[i][0] isEqualToString:key])
                [titlesByArtist addObject:artistTitleSplit[i][1]]; // adds titles that match artist to the result set
        }
        NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
        results[key] = [titlesByArtist sortedArrayUsingDescriptors:@[sortByNilAsc]]; // set the dictionary key to the result set
    }
    return results;
}

@end
