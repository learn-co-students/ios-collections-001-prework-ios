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
    
    NSMutableArray *index = [array mutableCopy];
    NSUInteger endIndex = index.count - 1;
    
    [index exchangeObjectAtIndex:0 withObjectAtIndex:endIndex];
    return [NSArray arrayWithArray: index];
}

- (NSArray*)arrayByReversingArray:(NSArray*)array {
    
    NSMutableArray *reversedArray = [array mutableCopy];
    
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
    
    return @[negativeNum, positiveNum];
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
    
    for (NSString *word in array) {
        
        NSString *plural = @"";
        
        if ([word containsString:@"oo"]) {
            
            plural = [word stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
            
            
        } else if ([word containsString:@"ox"]) {
            
            if ([word hasPrefix:@"b"]) {
                
                plural = [word stringByAppendingString:@"es"];
                
            } else {
                
                plural = [word stringByAppendingString:@"en"];
            }
            
        } else if ([word containsString:@"us"]) {
            
            plural = [word stringByReplacingOccurrencesOfString:@"us" withString: @"i"];
            
        } else if ([word containsString:@"um"]) {
            
            plural = [word stringByReplacingOccurrencesOfString:@"um" withString:@"a"];
            
        } else {
            
            plural = [word stringByAppendingString:@"s"];
            
        }
        
        [plurals addObject:plural];
        
    }
    
    return plurals;
    
}

- (NSDictionary*)countsOfWordsInString: (NSString*)string {
    
    NSArray *punctuationArray = @[@"-",@".",@",",@":",@";"];
    
    NSString *noPunc = [string mutableCopy];
    
    for (NSString *punctuation in punctuationArray) {
        
        noPunc = [noPunc stringByReplacingOccurrencesOfString:punctuation withString:@""];
    }
    
    NSString *noPuncLowerCase = [noPunc lowercaseString];
    
    NSArray *noPuncLowerArray = [noPuncLowerCase componentsSeparatedByString:@" "];
    
    
    NSMutableDictionary *count = [[NSMutableDictionary alloc] init];
    
    for (NSString *word in noPuncLowerArray) {
        
        if ([count[word] integerValue] > 0) {
            
            NSInteger numWords = [count[word] integerValue] + 1;
            count[word] = @(numWords);
            
            
        } else {
            
            count[word] = @1;
        }
        
        
    }
    
    return count;
}



- (NSDictionary*)songsGroupedByArtistFromArray:(NSArray*)array {
    
    NSMutableDictionary *artistsGrouped = [[NSMutableDictionary alloc] init];

    
    for (NSString *string in array) {
        
        NSArray *artistSong = [string componentsSeparatedByString:@" - "];
        NSString *artist = artistSong[0];
        NSString *song = artistSong[1];
        
        
        if ([[artistsGrouped allKeys] containsObject:artist]) {
            
            [artistsGrouped[artist] addObject:song];
            
        } else {
            
            artistsGrouped[artist] = [@[song] mutableCopy];
        }
    }
    
    NSSortDescriptor *artistsAlph = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    for (NSString *artist in artistsGrouped) {
        
        [artistsGrouped[artist] sortUsingDescriptors:@[artistsAlph]];
        
    }
    
    
    return artistsGrouped;
}

@end
