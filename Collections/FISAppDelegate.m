//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

//should return the objects in the submitted array arranged from low to high.
-(NSArray *)arrayBySortingArrayAscending:(NSArray *)chaoticPrimes {
    NSSortDescriptor *sortByNilAscending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *ascendingPrimes = [chaoticPrimes sortedArrayUsingDescriptors:@[sortByNilAscending]];
    
    return ascendingPrimes;
}

//should return the objects in the submitted array arranged from high to low.
-(NSArray *)arrayBySortingArrayDescending:(NSArray *)chaoticPrimes {
    NSSortDescriptor *sortbyNilDescending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *descendingPrimes = [chaoticPrimes sortedArrayUsingDescriptors:@[sortbyNilDescending]];
    
    return descendingPrimes;
}

//should return an array that's like the submitted array, but with first and last objects switched with each other.
-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)chaoticPrimes {
    NSMutableArray *firstLastSwapArray = [chaoticPrimes mutableCopy];
    NSUInteger lastObject = [chaoticPrimes count] - 1;
    [firstLastSwapArray replaceObjectAtIndex:0 withObject:chaoticPrimes[lastObject]];
    [firstLastSwapArray replaceObjectAtIndex:lastObject withObject:chaoticPrimes[0]];
    
    return firstLastSwapArray;
}

//should return an array that is the reverse of the submitted array. Hint: Try swapping objects moving in from the beginning and the end.
-(NSArray *)arrayByReversingArray:(NSArray *)chaoticPrimes {
    NSArray *reversedArray = [[chaoticPrimes reverseObjectEnumerator] allObjects];

    return reversedArray;
}

//should convert the following substrings in the submitted string:
//"a" to "4",
//"s" to "5",
//"i" to "1",
//"l" to "1",
//"e" to "3", and
//"t" to "7".
//Note: It's impractical to make a truly comprehensive leet translator since it's so fluid in its typesetting conventions in slang. Introduction to leet.
-(NSString *)stringInBasicLeetFromString:(NSString *)leetString {
    NSDictionary *basicLeet = @{@"a":@"4",
                                 @"s":@"5",
                                 @"i":@"1",
                                 @"l":@"1",
                                 @"e":@"3",
                                 @"t":@"7"};
    for (NSString *key in basicLeet) {
        leetString = [leetString stringByReplacingOccurrencesOfString:key
                                                           withString:basicLeet[key]];}
    return leetString;
}

//should add together all of the numbers in the submitted array and return the sum.
-(NSInteger )sumOfIntegersInArray:(NSArray *)chaoticPrimes {
    NSInteger totalSum = 0;
    for (NSNumber *numberSum in chaoticPrimes) {
    totalSum += [numberSum integerValue];
    }
    return totalSum;
}

//should return an array with two sub-arrays, the first with all the negative numbers in the argument array, and the second with all the non-negative (zero and positive) numbers.
-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)numbersToBisect {
    NSPredicate *negativesPredicate = [NSPredicate predicateWithFormat:@"self < 0"];
    NSPredicate *positivesPredicate = [NSPredicate predicateWithFormat:@"self >=0"];
    NSArray *bisectedArray = @[[numbersToBisect filteredArrayUsingPredicate:negativesPredicate],
                            [numbersToBisect filteredArrayUsingPredicate:positivesPredicate]];
    return bisectedArray;
}

//should return an array containing the keys (i.e., character names) from the given dictionary whose value is "hobbit".
-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)fellowshipOfTheRing {
    NSMutableArray *hobbits = [[NSMutableArray alloc]init];
    for (NSDictionary *key in fellowshipOfTheRing){
        if ([fellowshipOfTheRing[key] isEqualToString:@"hobbit"]) {
            [hobbits addObject: key];
        }
    }
    return hobbits;
}

//should return an array containing the strings from the given array begin with the letter "a".
-(NSArray *)stringsBeginningWithAInArray:(NSArray *)foodsBeginningWithA{
    NSPredicate *beginningWithAPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[cd] 'a'"];
    NSArray *beginningWithAArray = [foodsBeginningWithA filteredArrayUsingPredicate:beginningWithAPredicate];
    return beginningWithAArray;
}

//should convert the different strings into their correct plural forms. This is more complex than just adding an "s"; you'll have to run checks on the strings so be sure look at the test arrays so that you know the expected plural forms.
// singulars = @[ @"hand"   ,
//@"foot"   ,
//@"knee"   ,
//@"table"  ,
//@"box"    ,
//@"ox"     ,
//@"axle"   ,
//@"radius" ,
//@"trivium"];

//plurals = @[ @"hands" ,
           //  @"feet"  ,
             //@"knees" ,
             //@"tables",
             //@"boxes" ,
             //@"oxen"  ,
             //@"axles" ,
             //@"radii" ,
             //@"trivia"];

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)singularArray{
    NSMutableArray *pluralArray = [[NSMutableArray alloc]init];
    for (NSString *singular in singularArray){
        if ([singular isEqualToString:@"hand"]){
             [pluralArray addObject:@"hands"];
             } else if ([singular isEqualToString:@"foot"]) {
                     [pluralArray addObject:@"feet"];
             } else if ([singular isEqualToString:@"knee"]) {
                 [pluralArray addObject:@"knees"];
                 } else if ([singular isEqualToString:@"table"]) {
                         [pluralArray addObject:@"tables"];
                     } else if ([singular isEqualToString:@"box"]) {
                             [pluralArray addObject:@"boxes"];
                         } else if ([singular isEqualToString:@"ox"]) {
                                 [pluralArray addObject:@"oxen"];
                             } else if ([singular isEqualToString:@"axle"]) {
                                     [pluralArray addObject:@"axles"];
                                 } else if ([singular isEqualToString:@"radius"]) {
                                         [pluralArray addObject:@"radii"];
                                 } else if ([singular isEqualToString:@"trivium"]) {
                                     [pluralArray addObject:@"trivia"];
        }
    }
    return pluralArray;
}

    //should return a dictionary that has a key for each word in the submitted string, whose associated value is the count of how many times that word appears in the argument string. Be sure to remove the punctuation (.,-;) and ignore capitalization.
   // For example, if given the string "I think, I thought; I think I.", the method should return @{ @"i": @4, @"think": @2, @"thought": @1 }.
    //The string used in the test is from the opening paragraph of Herman Melville's "Moby-Dick".

//@"Call me Ishmael. Some years ago- never mind how long precisely- having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world. It is a way I have of driving off the spleen and regulating the circulation.";

-(NSDictionary *)countsOfWordsInString:(NSString *)moby {
    NSMutableDictionary *countOfMobyWords = [[NSMutableDictionary alloc]init];
    
    moby = [[[moby stringByReplacingOccurrencesOfString:@"." withString:@""]
                   stringByReplacingOccurrencesOfString:@"," withString:@""]
                   stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    NSArray *arrayOfMobyCount = [[[moby lowercaseString]
                              componentsSeparatedByString:@" "]mutableCopy];
    
    for (NSString *words in arrayOfMobyCount) {
        NSUInteger wordCount = [countOfMobyWords[words] unsignedIntegerValue];
        countOfMobyWords[words] = @(wordCount + 1);
    }
    return countOfMobyWords;
}

//takes an array of strings of the form "Artist - Title" and should return a dictionary containing a key for each artist, whose value is an array of strings containing song names by that artist. You'll have to split each string and arrange its information into the correct place in the nested data structure. Be sure to alphabetize the arrays of songs before returning the dictionary. If you're using mutable arrays inside the dictionary, you can use the sortUsingDescriptors: method.
//songList = @[ @"Coldplay - Strawberry Swing"        ,
//@"Johnny Flynn - In April"            ,
//@"Coldplay - Clocks"                  ,
//@"Sigur Rós - Andvari"                ,
//@"Ryan Adams - When The Stars Go Blue",
//@"Coldplay - Viva la Vida"            ,
//@"Johnny Flynn - Cold Bread"          ,
//@"Sigur Rós - Glósóli"                ,
//@"Ryan Adams - La Cienega Just Smiled"
//songsByArtist = @{@"Coldplay"     : @[    @"Clocks"          ,
//                                          @"Strawberry Swing",
//                                          @"Viva la Vida"    ]       ,
//                  @"Johnny Flynn" : @[    @"Cold Bread",
//                                          @"In April"  ]             ,
//                  @"Ryan Adams"   : @[    @"La Cienega Just Smiled",
//                                          @"When The Stars Go Blue"] ,
//                  @"Sigur Rós"    : @[    @"Andvari" ,
//                                          @"Glósóli" ]
-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)songList {
  
    NSMutableDictionary *songsByArtist = [[NSMutableDictionary alloc] init];
    
    for (NSString *song in songList) {
        NSArray *artistTitle = [song componentsSeparatedByString:@" - "];
        NSString *artist = artistTitle[0];
        NSString *songTitle = artistTitle[1];
        
        if ([[songsByArtist allKeys] containsObject:artist]) {
            [songsByArtist[artist] addObject:songTitle];
            } else {
            songsByArtist[artist] = [@[songTitle] mutableCopy];
            }

        NSSortDescriptor *sortArtistsAscending = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                         ascending:YES];
        
            for (NSString *artist in songsByArtist) {
                [songsByArtist[artist] sortUsingDescriptors:@[sortArtistsAscending]];
            }
        
        }
    
    return songsByArtist;
}


@end
