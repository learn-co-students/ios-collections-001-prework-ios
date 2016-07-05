//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSArray*)arrayBySortingArrayAscending: (NSArray*)array {
    
    NSSortDescriptor *sortByAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    
    return [array sortedArrayUsingDescriptors:@[sortByAsc]];
}
- (NSArray*)arrayBySortingArrayDescending:(NSArray*)array{
    
    NSSortDescriptor *sortByDesc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    
    return [array sortedArrayUsingDescriptors:@[sortByDesc]];
}

- (NSArray*)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray*)array {
    
    NSMutableArray *index = [[NSMutableArray alloc]init];
    NSUInteger endIndex = index.count - 1;
    
    [index exchangeObjectAtIndex:0 withObjectAtIndex:endIndex];
    return [NSArray arrayWithArray: index];
}

- (NSArray*)arrayByReversingArray:(NSArray*)array {
    
    NSMutableArray *reversedArray = [[NSMutableArray alloc]init];
    
    for (NSUInteger i = 0; i < (reversedArray.count / 2); i++) {
        
        NSUInteger j = reversedArray.count - 1 - i;
        [reversedArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    
    }
    
    return reversedArray;
}

- (NSString*)stringInBasicLeetFromString: (NSString*)string {
    
    NSDictionary *data = @{@"a":@"4",
                           @"s":@"5",
                           @"i":@"1",
                           @"l":@"1",
                           @"e":@"3",
                           @"t":@"7"
                           };
    
    NSString *leetString = string;
    
    for (NSString *key in data) {
        
        leetString = [leetString stringByReplacingOccurrencesOfString:key withString:data[key]];
    }
    
    return leetString;
}

- (NSArray*)splitArrayIntoNegativesAndPositives: (NSArray*)array {
    
    NSMutableArray *negativeNum = [[NSMutableArray alloc]init];
    NSMutableArray *positiveNum = [[NSMutableArray alloc] init];
    
    for (NSNumber *number in array) {
        
        if ([number floatValue] < 0) {
            
            [negativeNum addObject: number];
        }
        
        if ([number floatValue] >= 0) {
            [positiveNum addObject:number];
        }
    }
    
    return negativeNum;
    return positiveNum;
}

- (NSArray*)namesOfHobbitsInDictionary: (NSDictionary*)dictionary {
    
    NSMutableArray *hobbit = [[NSMutableArray alloc]init];
    
    for (NSString *key in dictionary) {
        
        if ([dictionary[key] isEqualToString:@"hobbit"]) {
            
            [hobbit addObject:key];
        }
    }
    
    return hobbit;
}

- (NSArray*)stringsBeginningWithAInArray: (NSArray*)array {
    
    NSPredicate *containsA = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *containsAArray = [array filteredArrayUsingPredicate:containsA];
    
    return containsAArray;
    
}

- (NSInteger*)sumOfIntegersInArray: (NSArray*)array {
    
    NSUInteger sum = 0;
    
    for (NSNumber *num in array) {
        
        sum = sum + [num integerValue];
    }
    
    return sum;
}

- (NSArray*)arrayByPluralizingStringsInArray: (NSArray*)array {
    
    NSMutableArray *plurals = [[NSMutableArray alloc] init];
    
    NSString *noPunc = @"";
    
    for (NSString *singularString in plurals) {
        
        [noPunc stringByReplacingOccurrencesOfString:singularString withString:@""];
    }
    
    NSString *lowerCase = [noPunc lowercaseString];
    NSArray *words = [lowerCase componentsSeparatedByString:@""];
    
    NSMutableDictionary *countOfWord = [[NSMutableDictionary alloc] init];
    
    for (NSString *singleWord in words) {
        
        if ([countOfWord[singleWord] integerValue] > 0){
            NSInteger newCount = [countOfWord[singleWord] integerValue] +1;
            countOfWord[singleWord] = @(newCount);
            
        } else {
            
            countOfWord[singleWord] = @1;
        }
    }
    
    
    
    return [NSDictionary dictionaryWithDictionary:countOfWord];
}

- (NSDictionary*)countsOfWordsInString: (NSString*)string {
    
    NSArray *punctuationArray = @[@"-",@".",@",",@":",@";"];
    
    NSString *noPunc = @"";
    
    for (NSString *punctuation in punctuationArray) {
        
        
    }
    
    return punctuationArray;
}

- (NSDictionary*)songsGroupedByArtistFromArray:(NSArray*)array {
    
    NSMutableDictionary *artistsGrouped = [[NSMutableDictionary alloc] init];
    
    for (NSString *string in array) {
        
        
    }
    
    return artistsGrouped;
}

@end
