//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/**
 
 * Define your methods here.
 
 */

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)arrayInput
{
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                   ascending:YES];
    
    NSArray *arrayAsc = [arrayInput sortedArrayUsingDescriptors:@[sortByNilAsc]];
    
    return arrayAsc;
}

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)arrayInput
{
    NSSortDescriptor *sortByNilDesc = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                    ascending:NO];
    
    NSArray *arrayDesc = [arrayInput sortedArrayUsingDescriptors:@[sortByNilDesc]];
    
    return arrayDesc;
}

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)arrayInput
{
    NSUInteger lastIndex = [arrayInput count] -1;
    
    NSMutableArray *updatedArray = [arrayInput mutableCopy];
    
    [updatedArray replaceObjectAtIndex:0 withObject:arrayInput[lastIndex]];
    [updatedArray replaceObjectAtIndex:lastIndex withObject:arrayInput[0]];
    
    return updatedArray;
}

- (NSArray *)arrayByReversingArray:(NSArray *)arrayInput
{
    NSMutableArray *reversedArray = [[NSMutableArray alloc] init];
    
    NSUInteger arrayLength = [arrayInput count];
    
    for(NSInteger i = arrayLength -1; i >=0; i--)
    {
        [reversedArray addObject:arrayInput[i]];
    }
    
    return reversedArray;
    
}

- (NSString *)stringInBasicLeetFromString:(NSString *)stringInput
{
    NSString *leetString = stringInput;
    
    leetString = [leetString stringByReplacingOccurrencesOfString:@"a" withString:@"4"];
    leetString = [leetString stringByReplacingOccurrencesOfString:@"s" withString:@"5"];
    leetString = [leetString stringByReplacingOccurrencesOfString:@"i" withString:@"1"];
    leetString = [leetString stringByReplacingOccurrencesOfString:@"l" withString:@"1"];
    leetString = [leetString stringByReplacingOccurrencesOfString:@"e" withString:@"3"];
    leetString = [leetString stringByReplacingOccurrencesOfString:@"t" withString:@"7"];
    
    return leetString;
}


- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)arrayInput
{
    NSMutableArray *negatives = [[NSMutableArray alloc] init];
    NSMutableArray *nonNegatives = [[NSMutableArray alloc] init];
    NSMutableArray *arraySplitIntoPositivesAndNegatives = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < [arrayInput count]; i++)
    {
        BOOL isNegative = [arrayInput[i] integerValue] < 0;
        
        if(isNegative)
        {
            [negatives addObject:arrayInput[i]];
        }
        else
        {
            [nonNegatives addObject:arrayInput[i]];
        }
    }
    
    [arraySplitIntoPositivesAndNegatives addObject:negatives];
    [arraySplitIntoPositivesAndNegatives addObject:nonNegatives];
    
    return arraySplitIntoPositivesAndNegatives;
    
}

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)database
{
    NSArray *hobbitNames = [database allKeys];
    
    NSString *lookingForType = @"hobbit";
    
    NSMutableArray *hobbits = [[NSMutableArray alloc] init];
    
    for (NSString *name in hobbitNames)
    {
        BOOL isHobbit = [database[name] isEqualToString:lookingForType];
        
        if(isHobbit)
        {
            [hobbits addObject:name];
        }
    }
    
    return hobbits;
}

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)arrayInput
{
    NSMutableArray *wordsThatStartWithA = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < [arrayInput count]; i++)
    {
        BOOL startsWithA = [[[arrayInput[i] substringToIndex:1] lowercaseString] isEqualToString:@"a"];
        
        if(startsWithA)
        {
            [wordsThatStartWithA addObject:arrayInput[i]];
        }
    }
    
    return wordsThatStartWithA;
}

- (NSInteger)sumOfIntegersInArray:(NSArray *)arrayInput
{
    NSInteger sum = 0;
    
    for(NSUInteger i = 0; i < [arrayInput count]; i++)
    {
        sum = sum + [arrayInput[i] integerValue];
    }
    
    return sum;
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)arrayInput
{
    NSMutableArray *pluralArray = [[NSMutableArray alloc] init];
    
    for(NSUInteger i = 0; i < [arrayInput count]; i++)
    {
        NSString *plural = [arrayInput[i] mutableCopy];
        
        BOOL isFoot = [[plural lowercaseString] isEqualToString:@"foot"];
        BOOL isBox = [[plural lowercaseString] isEqualToString:@"box"];
        BOOL isOx = [[plural lowercaseString] isEqualToString:@"ox"];
        BOOL isRadius = [[plural lowercaseString] isEqualToString:@"radius"];
        BOOL isTrivium = [[plural lowercaseString] isEqualToString:@"trivium"];
        
        if(isFoot)
        {
            plural = @"feet";
        }
        else if (isBox)
        {
            plural = @"boxes";
        }
        else if (isOx)
        {
            plural = @"oxen";
        }
        else if (isRadius)
        {
            plural = @"radii";
        }
        else if (isTrivium)
        {
            plural = @"trivia";
        }
        else{
            plural = [plural stringByAppendingString:@"s"];
        }
        
        [pluralArray addObject:plural];
    }
    
    return pluralArray;
}

- (NSDictionary *)countsOfWordsInString:(NSString *)stringInput
{
    NSMutableDictionary *wordCount = [[NSMutableDictionary alloc] init];
    
    NSMutableCharacterSet *separators = [NSMutableCharacterSet punctuationCharacterSet];
    [separators formUnionWithCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSArray *wordsInStringArray = [stringInput componentsSeparatedByCharactersInSet:separators];
    
    NSArray *wordsInString = [wordsInStringArray mutableCopy];
    
    NSLog(@"%@", wordsInString);
    
    NSMutableArray *countArray = [[NSMutableArray alloc] init];
    
    for(NSUInteger i = 0; i < [wordsInString count]; i++)
    {
        NSUInteger counter = 0;
        
        for(NSUInteger j = 0; j <[wordsInString count]; j++)
        {
            BOOL isDupe = [wordsInString[i] isEqualToString:wordsInString[j]];
            
            if(isDupe)
            {
                counter++;
            }
        }
        
        NSNumber *counterNumber = @(counter);
        
        [countArray addObject:counterNumber];
    }
    
    for(NSUInteger i = 0; i < [wordsInString count]; i++)
    {
        if( i == 0)
        {
            [wordCount setObject:countArray[i] forKey:[wordsInString[i] lowercaseString]];
        }
        else{
            
            NSUInteger counter = 0;
            
            for (NSUInteger j = 0; j < i; j++)
            {
                
                
                BOOL isDupe = [[wordsInString[j] lowercaseString] isEqualToString:[wordsInString[i] lowercaseString]];
                
                if(isDupe)
                {
                    counter++;
                }
            }
            
            BOOL isFirstInstance = counter == 0;
            BOOL isNotBlank = ![wordsInString[i] isEqualToString:@""];
            
            if(isFirstInstance && isNotBlank)
            {
                [wordCount setObject:countArray[i] forKey:[wordsInString[i] lowercaseString]];
            }
            
        }
    }
    
    return wordCount;
    
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)arrayInput
{
    NSSortDescriptor *sortedbyArtistNil = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    
    NSArray *sortedByArtist = [arrayInput sortedArrayUsingDescriptors:@[sortedbyArtistNil]];
    
    
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < [sortedByArtist count]; i++)
    {
        NSString *stringIteration = sortedByArtist[i];
        
        NSArray *artistAndTitleArray = [stringIteration componentsSeparatedByString:@" - "];
        
        [artists addObject:artistAndTitleArray[0]];
        [songs addObject:artistAndTitleArray[1]];
        
    }
    
    
    NSMutableDictionary *output = [[NSMutableDictionary alloc] init];
    
    for (NSUInteger i = 0; i < [artists count]; i++)
    {
        BOOL isNewKey = ![[output allKeys] containsObject:artists[i]];
        
        if(isNewKey)
        {
            NSMutableArray *songsBySpecificArtist = [[NSMutableArray alloc] init];
            
            for(NSUInteger j = 0; j < [artists count]; j++)
            {
                BOOL isSameArtist = [artists[i] isEqualToString:artists[j]];
                
                if(isSameArtist)
                {
                    [songsBySpecificArtist addObject:songs[j]];
                }
            }
            
            [output setObject:songsBySpecificArtist forKey:artists[i]];
        }
    }
    
    return output;
    
}


@end
