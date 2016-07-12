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

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)ascArray {

    NSSortDescriptor *sortObjectsAsc = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                ascending:YES];
    
    NSArray *sortByAsc = [ascArray sortedArrayUsingDescriptors:@[sortObjectsAsc]];
    
    return sortByAsc;
    
}

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)descArray {
    
    NSSortDescriptor *sortObjectsDesc = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                  ascending:NO];

    NSArray *sortByDesc = [descArray sortedArrayUsingDescriptors:@[sortObjectsDesc]];

    return sortByDesc;
    
}

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)objectArray {
    
    NSMutableArray *mObjectArray = [objectArray mutableCopy];
    
    NSUInteger lastObject = [objectArray count] - 1;
    
    [mObjectArray replaceObjectAtIndex:0 withObject:objectArray[lastObject]];
    
    [mObjectArray replaceObjectAtIndex:lastObject withObject:objectArray[0]];
    
    return mObjectArray;
}

- (NSArray *)arrayByReversingArray:(NSArray *)reverseArray {
    
    NSArray *arrayReversal = [[reverseArray reverseObjectEnumerator] allObjects];

    return arrayReversal;
    
}

- (NSString *)stringInBasicLeetFromString:(NSString *)leetString {
    
NSDictionary *leetCipher = @{
                             @"a" : @"4"   ,
                             @"s" : @"5"   ,
                             @"i" : @"1"   ,
                             @"l" : @"1"   ,
                             @"e" : @"3"   ,
                             @"t" : @"7"  };
    
    for (NSString *key in leetCipher) {
        leetString = [leetString stringByReplacingOccurrencesOfString:key
                                                           withString:leetCipher[key]];
}
    
    return leetString;
    
}

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)splitArray {
    
    NSPredicate *negativesPredicate = [NSPredicate predicateWithFormat:@"self < 0"];
    
    NSPredicate *positivesPredicate = [NSPredicate predicateWithFormat:@"self >=0"];
    
    NSArray *filterArray = @[[splitArray filteredArrayUsingPredicate:negativesPredicate],
                             [splitArray filteredArrayUsingPredicate:positivesPredicate]];
    
    return filterArray;
    
}


-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbitsDictionary {
    
    NSMutableArray *hobbitsName = [[NSMutableArray alloc] init];
    
    for (NSDictionary *key in hobbitsDictionary) {
    
        if ([hobbitsDictionary[key] isEqualToString:@"hobbit"]) {
    
            [hobbitsName addObject:key];
    
        }
    
    }
    
    return hobbitsName;
    
}

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)aInArray {

    NSPredicate *aFoodsPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[cd] 'a'"];
    
    NSArray *foodsWithA = [aInArray filteredArrayUsingPredicate:aFoodsPredicate];
    
    return foodsWithA;
    
}

- (NSInteger)sumOfIntegersInArray:(NSArray *)integersArray {
    
    NSInteger totalSum = 0;

    for (NSNumber *numberSum in integersArray) {
    
        totalSum += [numberSum integerValue];
    
    }
    
    return totalSum;
    
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)pluralsArray {

    NSMutableArray *mPlurals = [[NSMutableArray alloc] init];
    
    for (NSString *singular in pluralsArray) {
    
        if ([singular isEqualToString:@"hand"]) {
            [mPlurals addObject:@"hands"];
    
            } else if ([singular isEqualToString:@"foot"]) {
                [mPlurals addObject:@"feet"];
            
                } else if ([singular isEqualToString:@"knee"]) {
                    [mPlurals addObject:@"knees"];
            
                    } else if ([singular isEqualToString:@"table"]) {
                        [mPlurals addObject:@"tables"];
            
                        } else if ([singular isEqualToString:@"box"]) {
                            [mPlurals addObject:@"boxes"];
            
                            } else if ([singular isEqualToString:@"ox"]) {
                                [mPlurals addObject:@"oxen"];
            
                                } else if ([singular isEqualToString:@"axle"]) {
                                    [mPlurals addObject:@"axles"];
            
                                    } else if ([singular isEqualToString:@"radius"]) {
                                        [mPlurals addObject:@"radii"];
            
                                        } else if ([singular isEqualToString:@"trivium"]) {
                                            [mPlurals addObject:@"trivia"];
                                            
                                        }
        
    }
    
    return mPlurals;
    
}

- (NSDictionary *)countsOfWordsInString:(NSString *)countsString {
    
    NSMutableDictionary *countsOfWords = [[NSMutableDictionary alloc] init];

    countsString = [[[countsString stringByReplacingOccurrencesOfString:@"." withString:@""]stringByReplacingOccurrencesOfString:@"," withString:@""] stringByReplacingOccurrencesOfString: @"-" withString:@""];
    
    NSArray *countsArray = [[[countsString lowercaseString]
                         
                             componentsSeparatedByString:@" "]mutableCopy];
    
    for (NSString *words in countsArray) {

        NSUInteger wordOccurence = [countsOfWords[words] unsignedIntegerValue];
    
        countsOfWords[words] = @(wordOccurence + 1);
    
    }
    
    return countsOfWords;
    
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)songsArray {

    NSMutableDictionary *songNamesByArtist = [[NSMutableDictionary alloc] init];

    for (NSString *song in songsArray) {
    
        NSArray *artistTitle = [song componentsSeparatedByString:@" - "];
        
        NSString *artist = artistTitle[0];
    
        NSString *songTitle = artistTitle[1];

        if ([[songNamesByArtist allKeys] containsObject:artist]) {
    
            [songNamesByArtist[artist] addObject:songTitle];
    
        } else {
    
            songNamesByArtist[artist] = [@[songTitle] mutableCopy];
    
        }

        NSSortDescriptor *sortByAlphaAsc = [NSSortDescriptor sortDescriptorWithKey:nil
                                    
                                                                         ascending:YES];
    
        for (NSString *artist in songNamesByArtist) {
    
            [songNamesByArtist[artist] sortUsingDescriptors:@[sortByAlphaAsc]];
    
        }
    
    }
    
    return songNamesByArtist;
    
}





















@end
