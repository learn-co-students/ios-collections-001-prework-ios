//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}
//arrayBySortingArrayAscending: that takes one NSArray argument and returns and NSArray.

//arrayBySortingArrayAscending: should return the objects in the submitted array arranged from low to high.

-(NSArray *)arrayBySortingArrayAscending : (NSArray *)array{
    NSSortDescriptor *sortingArrayAscending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [array sortedArrayUsingDescriptors:@[sortingArrayAscending]];
}

//arrayBySortingArrayDescending: that takes one NSArray argument and returns an NSArray.

//arrayBySortingArrayDescending: should return the objects in the submitted array arranged from high to low.

-(NSArray *)arrayBySortingArrayDescending : (NSArray *)array{
    NSSortDescriptor *sortingArrayDescendingDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    return [array sortedArrayUsingDescriptors:@[sortingArrayDescendingDescriptor]];
}

//arrayBySwappingFirstObjectWithLastObjectInArray: that takes one NSArray argument and returns an NSArray.

//arrayBySwappingFirstObjectWithLastObjectInArray: should return an array that's like the submitted array, but with first and last objects switched with each other.

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray : (NSArray *)array{
    NSMutableArray *copiedArray = [[NSMutableArray alloc]initWithArray:array];
    NSUInteger lastElement = [array count]-1;
    [copiedArray exchangeObjectAtIndex:0 withObjectAtIndex:lastElement];

    return copiedArray;
}

//arrayByReversingArray: that takes one NSArray argument and returns an NSArray.

//arrayByReversingArray: should return an array that is the reverse of the submitted array. Hint: Try swapping objects moving in from the beginning and the end.

-(NSArray *)arrayByReversingArray : (NSArray *)array{
    NSMutableArray *reversedArray = [[NSMutableArray alloc] initWithArray:array];
    NSUInteger lastElement = [array count]-1;
    NSUInteger firstElement = 0;
    
    for (NSUInteger i = 0; i <= ([array count]-1)/2; i++) {
        [reversedArray exchangeObjectAtIndex:firstElement withObjectAtIndex:lastElement];
        NSLog(@"%lu is the first %lu is the last", firstElement,lastElement);
        
        firstElement++;
        lastElement--;
    }
    return reversedArray;

}

//stringInBasicLeetFromString: that takes one NSString argument and returns an NSString.

/*
 stringInBasicLeetFromString: should convert the following substrings in the submitted string:
 "a" to "4",
 "s" to "5",
 "i" to "1",
 "l" to "1",
 "e" to "3", and
 "t" to "7".
 Note: It's impractical to make a truly comprehensive leet translator since it's so fluid in its typesetting conventions in slang. Introduction to leet.
 
 let's try using string by replacing occurences of string with string...
 */
-(NSString *)stringInBasicLeetFromString : (NSString *)string{
    NSDictionary *letterToLeet = @{ @"a" : @"4",
                                   @"s" : @"5",
                                   @"i" : @"1",
                                   @"l" : @"1",
                                   @"e" : @"3",
                                   @"t" : @"7"};
                                   
    NSString *convertedString = string;
    for (NSString *key in letterToLeet) {
        convertedString = [convertedString stringByReplacingOccurrencesOfString:key withString:letterToLeet[key]];
    }
    return convertedString;
}

//splitArrayIntoNegativesAndPositives: that takes one NSArray argument and returns an NSArray.

//splitArrayIntoNegativesAndPositives: should return an array with two sub-arrays, the first with all the negative numbers in the argument array, and the second with all the non-negative (zero and positive) numbers.

-(NSArray *)splitArrayIntoNegativesAndPositives : (NSArray *)array {
    NSMutableArray *negatives = [[NSMutableArray alloc] init];
    NSMutableArray *positives = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < [array count]; i++) {
        if ([array[i] integerValue]< 0) {
            [negatives addObject:array[i]];
        }else{
            [positives addObject:array[i]];
        }
        
        NSLog(@"here are the positives %@, here are the negatives %@", positives, negatives);
        
    
    }
    return @[negatives, positives];
}

//namesOfHobbitsInDictionary: that takes one NSDictionary argument and returns an NSArray.

//namesOfHobbitsInDictionary: should return an array containing the keys (i.e., character names) from the given dictionary whose value is "hobbit".


-(NSArray *)namesOfHobbitsInDictionary : (NSDictionary *)dictionary{
    NSMutableArray *hobbitsInDict = [[NSMutableArray alloc] init];
    for (NSString *key in dictionary) {
        if ([dictionary[key] isEqualToString:@"hobbit"]) {
            [hobbitsInDict addObject:key];
        }
    }
    return hobbitsInDict;


}

//stringsBeginningWithAInArray: that takes one NSArray argument and returns an NSArray.

//stringsBeginningWithAInArray: should return an array containing the strings from the given array begin with the letter "a".


-(NSArray *)stringsBeginningWithAInArray : (NSArray *)array{
    NSPredicate *beginsWithAPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *beginsWithAArray = [array filteredArrayUsingPredicate:beginsWithAPredicate];
    return beginsWithAArray;

}

//sumOfIntegersInArray: that takes one NSArray argument and returns an NSInteger.


-(NSInteger)sumOfIntegersInArray : (NSArray *)array{
    NSInteger total = 0;
    NSInteger currentNumber;
    for (NSString *num in array) {
        currentNumber = [num integerValue];
        total = total + currentNumber;
    }

    return total;
}

//arrayByPluralizingStringsInArray: that takes one NSArray argument and returns an NSArray.

//arrayByPluralizingStringsInArray: should convert the different strings into their correct plural forms. This is more complex than just adding an "s"; you'll have to run checks on the strings so be sure look at the test arrays so that you know the expected plural forms.

-(NSArray *)arrayByPluralizingStringsInArray : (NSArray *)array{
    NSMutableArray *pluralWords = [[NSMutableArray alloc] init];
    for (NSString *singular in array) {
        
        NSString *pluralWord = @"";
        
        
        if ([singular containsString:@"oo"]) {
            pluralWord=[singular stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
        }
        
        else if ([singular containsString:@"ox"]){
            
            if ([singular hasPrefix:@"o"]) {
                pluralWord=[singular stringByAppendingString:@"en"];
            }
            
            else{
                 pluralWord=[singular stringByAppendingString:@"es"];
            }
            
        }
        
        else if ([singular hasSuffix:@"um"]){
            
             pluralWord=[singular stringByReplacingOccurrencesOfString:@"um" withString:@"a"];
        }
        
        else if ([singular hasSuffix:@"us"]){
            
             pluralWord=[singular stringByReplacingOccurrencesOfString:@"us" withString:@"i"];
        }
        else{
            
             pluralWord=[singular stringByAppendingString:@"s"];
        }
        
        [pluralWords addObject:pluralWord];
    }
    
    return pluralWords;

}

//countsOfWordsInString: that takes one NSString argument and returns an NSDictionary.

//countsOfWordsInString: should return a dictionary that has a key for each word in the submitted string, whose associated value is the count of how many times that word appears in the argument string. Be sure to remove the punctuation (.,-;) and ignore capitalization.
//For example, if given the string "I think, I thought; I think I.", the method should return @{ @"i": @4, @"think": @2, @"thought": @1 }.

-(NSDictionary *)countsOfWordsInString : (NSString *)string{
    



}

//songsGroupedByArtistFromArray: that takes one NSArray argument and returns an NSDictionary.
-(NSDictionary *)songsGroupedByArtistFromArray : (NSArray *)array{ return nil; }

@end
