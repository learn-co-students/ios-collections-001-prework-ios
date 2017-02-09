//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}


-(NSArray*)arrayBySortingArrayAscending:(NSArray*)argument; {
    NSSortDescriptor *sortArrayAscending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:1];
    return [argument sortedArrayUsingDescriptors:@[sortArrayAscending]];
    
}

-(NSArray*)arrayBySortingArrayDescending:(NSArray*)argument; {
    NSSortDescriptor *sortArrayAscending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:0];
    return [argument sortedArrayUsingDescriptors:@[sortArrayAscending]];
}

-(NSArray*)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray*)argument; {
    NSString *first = [argument firstObject];
    NSString *last = [argument lastObject];
    NSMutableArray *mArgument = [argument mutableCopy];
    NSInteger lastNumber =mArgument.count-1;
    [mArgument replaceObjectAtIndex:0 withObject:last];
    [mArgument replaceObjectAtIndex:lastNumber withObject:first];
    return [NSArray arrayWithArray:mArgument];
}

-(NSArray*)arrayByReversingArray:(NSArray*)argument; {
    NSMutableArray *mArgument=[argument mutableCopy];
    for (NSUInteger i=0; i<argument.count; i++){
        mArgument[i] = argument [[argument count]-i-1];
        }
    return mArgument;
}

-(NSString*)stringInBasicLeetFromString:(NSString *)argument {
    NSString *goodbyeA=[argument stringByReplacingOccurrencesOfString:@"a" withString:@"4"];
     NSString *goodbyeS=[goodbyeA stringByReplacingOccurrencesOfString:@"s" withString:@"5"];
     NSString *goodbyeI=[goodbyeS stringByReplacingOccurrencesOfString:@"i" withString:@"1"];
     NSString *goodbyeL=[goodbyeI stringByReplacingOccurrencesOfString:@"l" withString:@"1"];
     NSString *goodbyeE=[goodbyeL stringByReplacingOccurrencesOfString:@"e" withString:@"3"];
    return [goodbyeE stringByReplacingOccurrencesOfString:@"t" withString:@"7"];
}

-(NSArray*)splitArrayIntoNegativesAndPositives:(NSArray*)argument; {
    NSPredicate *negative= [NSPredicate predicateWithFormat:@"self <0"];
    NSPredicate *positive = [NSPredicate predicateWithFormat:@"self =>0"];
    NSArray *positiveSubArray=[argument filteredArrayUsingPredicate:positive];
    NSArray *negativeSubArray=[argument filteredArrayUsingPredicate:negative];
    return @[negativeSubArray,positiveSubArray];
}

-(NSArray*)namesOfHobbitsInDictionary:(NSDictionary*)argument; {
    NSMutableArray *hobbits=[[NSMutableArray alloc]init];
    for (NSString *name in [argument allKeys]) {
        if([argument[name] isEqualToString:@"hobbit"]) {
            [hobbits addObject:name];
        }
       
    }
 return hobbits;
}

-(NSArray*)stringsBeginningWithAInArray:(NSArray*)argument; {
    NSPredicate *filterA =[NSPredicate predicateWithFormat:@"self LIKE[c] 'a*'"];
    NSArray *returnArray= [argument filteredArrayUsingPredicate:filterA];
    return returnArray;
}

-(NSInteger)sumOfIntegersInArray:(NSArray*)argument; {
    NSUInteger sumOfIntegers=0;
    for (NSNumber *individualNumber in argument) {
        sumOfIntegers += [individualNumber integerValue];
    }
    return sumOfIntegers;
}

-(NSArray*)arrayByPluralizingStringsInArray:(NSArray*)argument; {
    NSDictionary *plurals= @ { @"foot":@"feet",@"box":@"boxes",@"ox":@"oxen",@"radius":@"radii",@"trivium":@"trivia"};
    NSMutableArray *returnArray = [[NSMutableArray alloc]init];
    for(NSString *singular in argument) {
        NSMutableString *nonFunkyPlural= [[NSMutableString alloc] init];
        if(plurals[singular]) {
            [returnArray addObject:plurals[singular]];
        }
        else {
            [nonFunkyPlural appendFormat:@"%@s",singular];
            [returnArray addObject:nonFunkyPlural];
        }
        
    
    }
    return [NSArray arrayWithArray:returnArray];
}

-(NSDictionary*)countsOfWordsInString:(NSString*)argument; {
    NSMutableDictionary *returnedCount = [NSMutableDictionary dictionary];
    NSMutableCharacterSet *filteredCharacters= [[NSCharacterSet punctuationCharacterSet] mutableCopy];
    [filteredCharacters formUnionWithCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSMutableArray *actualWords= [[[argument lowercaseString] componentsSeparatedByCharactersInSet:filteredCharacters]mutableCopy];
    [actualWords removeObject:@""];
    NSNumber *wordCount;
    for (NSString *individualWord in actualWords) {
        wordCount=returnedCount[individualWord];
        if (!wordCount) {
            returnedCount[individualWord]=@1;
        }
        else {
            returnedCount[individualWord]=@([wordCount integerValue]+1);
        }
        }
    return returnedCount;
}

-(NSDictionary*)songsGroupedByArtistFromArray:(NSArray*)argument; {
    NSMutableDictionary *unformattedDictionary = [[NSMutableDictionary alloc] init];
    
     for (NSString *artistSongs in argument) {
         
         
          NSArray *hyphenArray = [artistSongs componentsSeparatedByString:@" - "];
         unformattedDictionary[[hyphenArray objectAtIndex:0]] = @""; }
    
    for (NSString *artist in [unformattedDictionary allKeys]) {
        
        NSPredicate *formattedSongs = [NSPredicate predicateWithFormat:@"self CONTAINS[d] %@", artist];
        NSArray *finalSongArray = [argument filteredArrayUsingPredicate:formattedSongs];
        NSMutableArray *songArray = [[NSMutableArray alloc] init];
        for (NSString *artistSong in finalSongArray) {
            
            NSArray *secondHyphenArray = [artistSong componentsSeparatedByString:@" - "];
            for (NSUInteger i = 0;i <secondHyphenArray.count;i++) {
                
                if (!unformattedDictionary[[secondHyphenArray objectAtIndex:i]]) {
                    [songArray addObject:[secondHyphenArray objectAtIndex:i]]; }
            }
        }
        NSSortDescriptor *alphabeticalSongs = [NSSortDescriptor sortDescriptorWithKey:nil ascending:1];
        NSArray *finalSongs= [songArray sortedArrayUsingDescriptors:@[alphabeticalSongs]];
        unformattedDictionary[artist] = finalSongs; }
    return [NSDictionary dictionaryWithDictionary:unformattedDictionary];
}




/**
 
 * Define your methods here.
 
 */

@end
