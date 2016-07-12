//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSArray *)arrayBySortingArrayAscending: (NSArray *)ascendingPrimes {
    NSSortDescriptor *ascNumbers = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                    ascending:YES ];
    NSArray *ascPrimes = [ascendingPrimes sortedArrayUsingDescriptors:@[ascNumbers]];
    return ascPrimes;
}

- (NSArray *)arrayBySortingArrayDescending: (NSArray *)descendingPrimes {
    NSSortDescriptor *descNumbers = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                 ascending:NO ];
    NSArray *descPrimes = [descendingPrimes sortedArrayUsingDescriptors:@[descNumbers]];
    return descPrimes;
}

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray: (NSArray *)givenStrings {
    NSMutableArray *mGivenStrings = [givenStrings mutableCopy];
    NSString *firstString = mGivenStrings[0];
    NSString *lastString = mGivenStrings[mGivenStrings.count -1];
    
    [mGivenStrings addObject:firstString];
    [mGivenStrings insertObject:lastString atIndex:0];
    [mGivenStrings removeObjectAtIndex:1];
    [mGivenStrings removeObjectAtIndex:mGivenStrings.count-2];
    
    return mGivenStrings;
}

- (NSArray *)arrayByReversingArray: (NSArray *)givenArray {
    NSArray *reversedArray = [[givenArray reverseObjectEnumerator] allObjects];
    return reversedArray;
}

- (NSString *)stringInBasicLeetFromString: (NSString *)subStrings{
    NSMutableString *leet = [subStrings mutableCopy];

    NSDictionary *replacements = @{
                                  @"a": @"4",
                                  @"s": @"5",
                                  @"i": @"1",
                                  @"l": @"1",
                                  @"e": @"3",
                                  @"t": @"7", };
    for (NSString *key in replacements) {
            [leet replaceOccurrencesOfString:key withString:replacements[key] options:0 range:NSMakeRange(0, leet.length)];
    }
    return leet;
}

- (NSArray *)splitArrayIntoNegativesAndPositives: (NSArray *)negPosArray {
    NSMutableArray *mNegPosArray = [[NSMutableArray alloc]init];
    NSMutableArray *negArray = [[NSMutableArray alloc]init];
    NSMutableArray *posArray = [[NSMutableArray alloc]init];
    
    for (NSNumber *num in negPosArray) {
        if ([num integerValue] < 0) {
            [negArray addObject:num];
        }
        else if ([num integerValue] >= 0){
            [posArray addObject:num];
        }
    }
    
    [mNegPosArray addObject:negArray];
    [mNegPosArray addObject:posArray];

    return mNegPosArray;
}

- (NSArray *)namesOfHobbitsInDictionary: (NSDictionary *)middleEarth {
    NSMutableArray *hobbitNames = [[NSMutableArray alloc]init];
    
    for (NSDictionary *name in middleEarth) {
        if ([middleEarth[name] isEqualToString:@"hobbit"]) {
            [hobbitNames addObject:name];
        }
    }

    return hobbitNames;
}

- (NSArray *)stringsBeginningWithAInArray: (NSArray *)unsortedArray {
    
    NSPredicate *aWordsPredicate = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH[c] 'a'"];
    NSArray *arrayWithA = [unsortedArray filteredArrayUsingPredicate:aWordsPredicate];
    
    return arrayWithA;
}

- (NSInteger)sumOfIntegersInArray: (NSArray *)numbersArray{
    NSInteger allNumberSum = 0;
    for (NSNumber *num in numbersArray) {
           allNumberSum = (allNumberSum + [num integerValue]);
    }
    return allNumberSum;
}

- (NSArray *)arrayByPluralizingStringsInArray: (NSArray *)stringsArray{

    NSMutableArray *pluralizedArray = [[NSMutableArray alloc]init];
    for (NSString *singleItem in stringsArray) {
        if ([singleItem isEqualToString:@"hand"]) {
            [pluralizedArray addObject:@"hands"];
        } else if ([singleItem isEqualToString:@"foot"]) {
            [pluralizedArray addObject:@"feet"];
        } else if ([singleItem isEqualToString:@"knee"]) {
            [pluralizedArray addObject:@"knees"];
        } else if ([singleItem isEqualToString:@"table"]) {
            [pluralizedArray addObject:@"tables"];
        } else if ([singleItem isEqualToString:@"box"]) {
            [pluralizedArray addObject:@"boxes"];
        } else if ([singleItem isEqualToString:@"ox"]) {
            [pluralizedArray addObject:@"oxen"];
        } else if ([singleItem isEqualToString:@"axle"]) {
            [pluralizedArray addObject:@"axles"];
        } else if ([singleItem isEqualToString:@"radius"]) {
            [pluralizedArray addObject:@"radii"];
        } else if ([singleItem isEqualToString:@"trivium"]) {
            [pluralizedArray addObject:@"trivia"];
        }
    }
    return pluralizedArray;
}

- (NSDictionary *)countsOfWordsInString: (NSString *)wordsString{
    NSMutableDictionary *wordsAndCounts = [[NSMutableDictionary alloc] init];
    NSNumber *wordCount = @1;
    wordsString = [wordsString stringByReplacingOccurrencesOfString:@"." withString:@""];
    wordsString = [wordsString stringByReplacingOccurrencesOfString:@"," withString:@""];
    wordsString = [wordsString stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSMutableArray *wordsArray = [[[wordsString lowercaseString] componentsSeparatedByString:@" "]mutableCopy];
    
    for (NSString *word in wordsArray) {
       if ([[wordsAndCounts allKeys] containsObject:word]) {
            wordsAndCounts[word] = @([wordsAndCounts[word] integerValue] + 1);
        }
            else {
            wordsAndCounts[word] = wordCount;
        }

    }
    return wordsAndCounts;
}



- (NSDictionary *)songsGroupedByArtistFromArray: (NSArray *)songList{
    NSMutableDictionary *songsByArtist = [[NSMutableDictionary alloc]init];
    
    for (NSUInteger i = 0; i < songList.count; i++) {
        NSArray *artistAndSong = [songList[i] componentsSeparatedByString: @" - "];
        NSString *artist = artistAndSong[0];
        NSString *song = artistAndSong[1];

        if (songsByArtist[artist]) {
            NSMutableArray *artistSongsArray = songsByArtist[artist];
            [artistSongsArray addObject:song];
            [artistSongsArray sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:nil ascending:YES]]];
            }

            else {
                songsByArtist[artist] = [@[song]mutableCopy];
        }
    }
    return songsByArtist;
}

@end
