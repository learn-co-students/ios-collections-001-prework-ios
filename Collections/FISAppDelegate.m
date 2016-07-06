//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

//Return new array equal to the original array sorted in ascending order
- (NSArray *)arrayBySortingArrayAscending:(NSArray *)a{
    
    NSSortDescriptor * arrayAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    
    NSArray *sortedAsc = [a sortedArrayUsingDescriptors:@[arrayAsc]];
    
    return sortedAsc;
}

//Return new array equal to the original array sorted in descending order
- (NSArray *)arrayBySortingArrayDescending:(NSArray *)a{
    
    NSSortDescriptor * arrayDesc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    
    NSArray *sortedDesc = [a sortedArrayUsingDescriptors:@[arrayDesc]];
    
    return sortedDesc;
}

//Return new array with first and last objects of original array swapped
//Leave empty array unchanged
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)a{
    
    NSMutableArray *swapped = [a mutableCopy];
    
    NSUInteger len = [a count];
    
    //Only try to swap if array is not empty. This will also leave array of length 1 unchanged.
    if(len > 0){
        swapped[0] = a[len-1];
        
        swapped[len-1] = a[0];
    }

    return swapped;
}

//Return new array equal to original array reversed
- (NSArray *)arrayByReversingArray:(NSArray *)a{
    
    NSMutableArray *reversed = [[NSMutableArray alloc] init];
    
    NSUInteger len = [a count];
    
    for(NSUInteger i = 0; i < len; i++){
        [reversed addObject:a[len - i - 1]];
    }
    
    return reversed;
}

//Replace certain letters with numbers according to hard-coded mapping and return new string
- (NSString *)stringInBasicLeetFromString:(NSString *)str{
    
    NSDictionary * leetRules = @{@"a": @"4",
                                 @"s": @"5",
                                 @"i": @"1",
                                 @"l": @"1",
                                 @"e": @"3",
                                 @"t": @"7"};
    
    NSString *leetified = str;
    
    for(NSString *rule in [leetRules allKeys]){
        leetified = [leetified stringByReplacingOccurrencesOfString:rule withString:leetRules[rule]];
    }
    
    return leetified;
}

//Return an array with two sub-arrays, the first with all the negative numbers in the argument array, and the second with all the non-negative (zero and positive) numbers.
- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)a{
    
    NSArray * split = @[[[NSMutableArray alloc] init], [[NSMutableArray alloc]init]];
    
    //Indices for sub-arrays
    NSInteger negative = 0;
    NSInteger zeroOrPositive = 1;
    
    for(NSNumber *k in a){
        if([k integerValue] < 0){
            [split[negative] addObject:k];
        }else{
            [split[zeroOrPositive] addObject:k];
        }
    }
    return split;
}

//Return array containing keys (names) from dict where value is "hobbit"
- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dict{
    
    NSMutableArray *names = [[NSMutableArray alloc] init];
   
    for(NSString *name in [dict allKeys]){
        if([dict[name] isEqualToString:@"hobbit"]){
            [names addObject:name];
        }
    }
    
    return names;
}

//Return array containing members of array that begin with 'a', ignoring case and diacritical marks
- (NSArray *)stringsBeginningWithAInArray:(NSArray *)a{
    
    NSPredicate *beginsWithA = [NSPredicate predicateWithFormat:@"self LIKE[cd] 'a*'"];
    
    NSArray *filtered = [a filteredArrayUsingPredicate:beginsWithA];
    
    return filtered;
}

//Return sum of integers in array
- (NSInteger)sumOfIntegersInArray:(NSArray *)a{
    
    NSInteger sum = 0;
    
    for (NSNumber *i in a){
        sum += [i integerValue];
    }
    
    return sum;
}

//Return array of words converted into their correct plural forms:
//  * If word is "ox", plural is "oxen"
//  * Else if word is "goose" or "foot", replace 'oo' with 'ee'
//  * Else if word ends in 'um', plural ends in 'a'
//  * Else if word ends in 'ius', plural ends in 'ii'
//  * Else if singular ends in y, plural is -ies
//  * Else if singular ends in s, plural adds -es
//  * Default: add -s

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)a{
    
    NSMutableArray *pluralized = [[NSMutableArray alloc] init];
    
    for (NSString *word in a){
        
        NSString *plural;

        //specific exceptions
        if([word isEqualToString:@"ox"]){
            plural = @"oxen";
            
        }else if([word isEqualToString:@"goose"] || [word isEqualToString:@"foot"]){
            plural = [word stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
            
        //borrowed words
        }else if([word hasSuffix:@"um"]){ //e.g., trivium
            plural = [word substringToIndex:word.length - 2]; //chop off last two letters
            plural = [plural stringByAppendingString:@"a"]; //add new suffix
            
        }else if([word hasSuffix:@"ius"]){ //e.g., radius
            plural = [word substringToIndex:word.length - 2]; //chop off last two letters
            plural = [plural stringByAppendingString:@"i"]; //add new suffix
        
        //else assume regular rules
        }else if([word hasSuffix:@"y"]){ //e.g., pony
            NSRange range = NSMakeRange(word.length - 2, 1);
            plural = [word stringByReplacingCharactersInRange:range withString:@"ies"];
        
        }else if([word hasSuffix:@"s"] || [word hasSuffix:@"x"]){ //regular cases
            plural = [word stringByAppendingString:@"es"];
            
        }else{
            plural = [word stringByAppendingString:@"s"];
        }
        
        [pluralized addObject:plural];
    }
    
    return pluralized;
}

//Return a dictionary that has a key for each word in the submitted string, whose associated value is the count of how many times that word appears in the argument string. Remove punctuation and ignore capitalization.
//Note: my implementation doesn't strip apostrophes or other punctuation that appears in the middle of a word
- (NSDictionary *)countsOfWordsInString:(NSString *)str{
    
    //Split string by space into array of words
    NSMutableArray *words = [[str componentsSeparatedByString: @" "] mutableCopy];

    NSMutableDictionary *counts = [[NSMutableDictionary alloc] init];
    
    //Strip punctuation from words and lowercase them, then add them to dictionary or increment count
    for(NSString *word __strong in words){
        word = [[word stringByTrimmingCharactersInSet:[NSCharacterSet punctuationCharacterSet]] lowercaseString];
        
        NSNumber *count = [counts objectForKey:word];
        
        if(count){ //Already in dictionary
            NSInteger newCount = [count integerValue] + 1;
            counts[word] = @(newCount);
            
        }else{ //Add it
            counts[word] = @(1);
        }
    }
    
    return counts;
}

//Takes an array of strings of the form "Artist - Title" and should return a dictionary containing a key for each artist, whose value is an array of strings containing song names by that artist. 
- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)a{
    
    NSMutableDictionary * songsByArtist = [[NSMutableDictionary alloc] init];
    
    //Indices
    NSUInteger artist = 0;
    NSUInteger title = 1;
    
    //Loop through array:
        //Split string by " - " to get array of [artist, title]
        //Check if artist in dictionary
            //If yes, add title to array
            //If no, add artist to dictionary with value = empty mutable array
    for(NSString *entry in a){
        NSArray *splitEntry = [entry componentsSeparatedByString:@" - "];
        
        NSMutableArray *songs = [songsByArtist objectForKey:splitEntry[artist]];
        
        if(songs){ //Already in dictionary
            [songs addObject:splitEntry[title]]; //TODO: check that this modifies the array in place
        }else{
            songsByArtist[splitEntry[artist]] = [[NSMutableArray alloc] initWithObjects:splitEntry[title], nil];
        }
    }
    
    //Sort arrays before returning
    
    NSSortDescriptor *titlesAscending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES selector:@selector(caseInsensitiveCompare:)];
    
    for(NSString *name in [songsByArtist allKeys]){
        [[songsByArtist objectForKey:name] sortUsingDescriptors:@[titlesAscending]];

    }
    
    return songsByArtist;
}

@end
