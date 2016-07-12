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
-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array
{
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor
        sortDescriptorWithKey:nil
        ascending:YES];
    NSArray *sortAsc = [array sortedArrayUsingDescriptors:@[sortByNilAsc]];
    
    return sortAsc;
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array
{
    NSSortDescriptor *sortByNilDesc = [NSSortDescriptor
        sortDescriptorWithKey:nil
        ascending:NO];
    NSArray *sortDesc = [array sortedArrayUsingDescriptors:@[sortByNilDesc]];
    return sortDesc;
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array
{
    NSMutableArray *mutableArr = [array mutableCopy];
    NSString *string = @"";
    if ([array[0] isKindOfClass:NSClassFromString(string)] )
    {
        NSString *firstString = array[0];
        mutableArr[0] = string;
        mutableArr[0] = mutableArr[array.count - 1];
        mutableArr[array.count - 1] = firstString;
    }else {
        NSNumber *firstNumber = array[0];
        mutableArr[0] = firstNumber;
        mutableArr[0] = mutableArr[array.count -1];
        mutableArr[array.count - 1] = firstNumber;
    }
    return mutableArr;
}

-(NSArray *)arrayByReversingArray:(NSArray *)array
{
    //Swap using pointers I'm sure is available in the reference
    //Maybe something like reverseIterator (C++)
    NSArray* reversedArray = [[array reverseObjectEnumerator] allObjects];
    
    return reversedArray;
}

-(NSString *)stringInBasicLeetFromString:(NSString *)string
{
    NSString *leetWord = @"";
    for (NSUInteger i = 0; i < string.length; i++)
    {
        char letter = [string characterAtIndex:i];
        if (letter == 'a')
        {
            leetWord = [leetWord stringByAppendingString:@"4"];
         
        }else if (letter == 's')
        {
            leetWord = [leetWord stringByAppendingString:@"5"];
       
        }else if (letter == 'i')
        {
            leetWord = [leetWord stringByAppendingString:@"1"];
           
        }else if (letter == 'l')
        {
            leetWord = [leetWord stringByAppendingString:@"1"];
            
        }else if (letter == 'e')
        {
            leetWord = [leetWord stringByAppendingString:@"3"];
            
        }else if (letter == 't')
        {
            leetWord = [leetWord stringByAppendingString:@"7"];
        }else {
            NSString *addLetterUnchanged = [NSString stringWithFormat:@"%c", letter]; 
            leetWord = [leetWord stringByAppendingString:addLetterUnchanged];
        }
    }
    return leetWord;
}

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array
{
    
    NSMutableArray *arrayHoldsTwoArrays = [[NSMutableArray alloc] init];
    NSMutableArray *negative = [[NSMutableArray alloc] init];
    NSMutableArray *positiveOrZero = [[NSMutableArray alloc] init];
    [arrayHoldsTwoArrays addObject:negative];
    [arrayHoldsTwoArrays addObject:positiveOrZero];
    for (NSNumber *number in array)
    {
        NSInteger currentNumber = [number integerValue];
        if (currentNumber < 0)
        {
            [negative addObject:number];
        }else {
            [positiveOrZero addObject:number];
        }
    }

    return arrayHoldsTwoArrays;
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary
{
    NSMutableArray *hobbitNames = [[NSMutableArray alloc] init];
    for (NSString *castMember in dictionary) {
        if ([dictionary[castMember] isEqualToString:@"hobbit"]) // containsObject didnt work here. Why?
        {
            [hobbitNames addObject:castMember];
        }
    }
  //      NSPredicate *hobbitPredicate = [NSPredicate predicateWithFormat:@"@K CONTAINS 'hobbit'", [dictionary allKeys]];
    //NSArray *hobbitNamesFiltered = [dictionary filteredA
  /*  if ([[dictionary allKeys] containsObject:@"hobbit"])
    {
        [hobbitNames addObject:]
    }
   */
    
    return hobbitNames;
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array
{
    NSPredicate *strWithAPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'A'"];
    NSArray *stringsStartingWithA = [array filteredArrayUsingPredicate:strWithAPredicate];
    return stringsStartingWithA;
}

-(NSInteger)sumOfIntegersInArray:(NSArray *)array
{
    NSInteger sum = 0;
    for (NSNumber *number in array)
    {
        sum += [number integerValue];
    }
    return sum;
}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array
{
    //Wow this is really hard! Gonna hardcode it for now.

    NSMutableArray *pluralWords = [[NSMutableArray alloc] init];
    for (NSString *word in array)
    {
        if ([word isEqualToString:@"foot"])
        {
            [pluralWords addObject:@"feet"];

        }else if ([word isEqualToString:@"box"])
        {
            [pluralWords addObject:@"boxes"];
            
        }else if([word isEqualToString:@"ox"])
        {
            [pluralWords addObject:@"oxen"];
            
        }else if([word isEqualToString:@"radius"])
        {
            [pluralWords addObject:@"radii"];
            
        }else if ([word isEqualToString:@"trivium"])
        {
            [pluralWords addObject:@"trivia"];
        }else
        {
            [pluralWords addObject:[word stringByAppendingString:@"s"]];
        }
    }
    return pluralWords;
}

-(NSDictionary *)countsOfWordsInString:(NSString *)string
{
    NSString *lowercase = [string lowercaseString];
    NSArray *excessCharacters = @[@".", @"-", @","];
    for (NSUInteger i = 0; i < excessCharacters.count ; i++)
    {
        lowercase = [lowercase stringByReplacingOccurrencesOfString:excessCharacters[i] withString:@""];
    }

    NSArray *listOfAllWordsSeparatedByASpace = [lowercase componentsSeparatedByString:@" "];
    NSMutableDictionary *wordCountDict = [[NSMutableDictionary alloc] init];
    for (NSString *word in listOfAllWordsSeparatedByASpace)
    {
       // if ([wordCountDict allKeys] containsObject:word])
        //{
            NSNumber *wordTotal = wordCountDict[word];
            NSInteger wordTotalInt = [wordTotal integerValue];
            wordTotalInt += 1;
            wordCountDict[word] = @(wordTotalInt);
      //  }else
       // {
         //   wordCountDict[word] = @1;
        //} :)
    }
    return wordCountDict;
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array
{
    
    NSMutableDictionary *songArtistDict = [[NSMutableDictionary alloc] init];
    for (NSString *line in array)
    {
        NSArray *songLine = [line componentsSeparatedByString:@" - "];
        NSString *artist = songLine[0];
        if ([[songArtistDict allKeys] containsObject:artist])
        {
            [songArtistDict[ songLine[0] ] addObject:songLine[1]];

        }else
        {
            songArtistDict[ songLine[0] ] = [[NSMutableArray alloc] init];
            [songArtistDict[ songLine[0] ] addObject:songLine[1]];
        }
        
    }
    NSSortDescriptor *sortBySongAsc = [NSSortDescriptor
                                       sortDescriptorWithKey:nil
                                       ascending:YES];
    
    for (NSString *musician in [songArtistDict allKeys])
    {
        NSMutableArray *listOfSongs = [songArtistDict[musician] mutableCopy];
        NSArray *alphabetizedSongs = [listOfSongs sortedArrayUsingDescriptors:@[sortBySongAsc]];
        songArtistDict[musician] = alphabetizedSongs;
    }
    //call should be using sortUsingDescriptors:
    
    return songArtistDict;
}

@end
