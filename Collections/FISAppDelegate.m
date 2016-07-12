//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array
{
      NSSortDescriptor *ascendingDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
      return [array sortedArrayUsingDescriptors:@[ascendingDescriptor]];
    }

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array
{
      NSSortDescriptor *descendingDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
      return [array sortedArrayUsingDescriptors:@[descendingDescriptor]];
    }

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array
{
      NSMutableArray *swappedArray = [array mutableCopy];
      [swappedArray exchangeObjectAtIndex:0 withObjectAtIndex:array.count - 1];
      return swappedArray;
    }

- (NSArray *)arrayByReversingArray:(NSArray *)array
{
      NSMutableArray *reversedArray = [[NSMutableArray alloc] initWithCapacity:array.count];
      for (id obj in array.reverseObjectEnumerator) {
            [reversedArray addObject:obj];
          }
      return reversedArray;
    }

- (NSString *)stringInBasicLeetFromString:(NSString *)string
{
    
      NSDictionary *basicLeet = @{@"a" : @"4",
                                  @"s" : @"5",
                                  @"i" : @"1",
                                  @"l" : @"1",
                                  @"e" : @"3",
                                  @"t" : @"7"};
    
      for (NSString *key in basicLeet ) {
            string = [string stringByReplacingOccurrencesOfString:key withString:[basicLeet objectForKey:key]];
          }
    
      return string;
    }

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array
{
      NSPredicate *negativePredicate = [NSPredicate predicateWithFormat:@"self < 0"];
      NSArray *negatives = [array filteredArrayUsingPredicate:negativePredicate];
    
      NSPredicate *positivePredicate = [NSPredicate predicateWithFormat:@"self >= 0"];
      NSArray *positives = [array filteredArrayUsingPredicate:positivePredicate];
    
      return [NSArray arrayWithObjects:negatives, positives, nil];
    }

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary
{
      return [dictionary allKeysForObject:@"hobbit"];
    }

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array
{
      NSPredicate *beingsWithA = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
      return [array filteredArrayUsingPredicate:beingsWithA];
    }

- (NSInteger)sumOfIntegersInArray:(NSArray *)array
{
      NSInteger sum = 0;
      for (NSNumber *num in array) {
            sum += [num integerValue];
          }
      return sum;
    }

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array
{
      NSMutableArray *plurals = [[NSMutableArray alloc] initWithCapacity:array.count];
      for (NSString *singular in array) {
            NSString *plural = nil;
            if ([singular containsString:@"oo"]) {
                  plural = [singular stringByReplacingOccurrencesOfString:@"o" withString:@"e"];
                } else if ([[singular substringWithRange:NSMakeRange(singular.length - 2, 2)] isEqualToString:@"us"]) {
                      plural = [singular stringByReplacingCharactersInRange:NSMakeRange(singular.length - 2, 2) withString:@"i"];
                    } else if ([[singular substringWithRange:NSMakeRange(singular.length - 2, 2)] isEqualToString:@"um"]) {
                          plural = [singular stringByReplacingCharactersInRange:NSMakeRange(singular.length - 2, 2) withString:@"a"];
                        } else if (singular.length == 2) {
                              plural = [singular stringByAppendingString:@"en"];
                            } else if ([singular characterAtIndex:singular.length - 1] == 'x') {
                                  plural = [singular stringByAppendingString:@"es"];
                                } else {
                                      plural = [singular stringByAppendingString:@"s"];
                                    }
            [plurals addObject:plural];
          }
      return plurals;
    }

- (NSDictionary *)countsOfWordsInString:(NSString *)string
{
    
      // Remove punctuation
      NSArray *puntuations = @[@",",@"-", @"."];
      for (NSString *puntuation in puntuations) {
            string = [string stringByReplacingOccurrencesOfString:puntuation withString:@""];
          }
      string = [string lowercaseString];
    
      // separate words into array
      NSArray *words = [string componentsSeparatedByString:@" "];
    
      // remove dups
      NSSet *wordSet = [NSSet setWithArray:words];
    
      NSMutableDictionary *wordCounts = [[NSMutableDictionary alloc] init];
    
      for (NSString *word in wordSet) {
            NSPredicate *wordPredicate = [NSPredicate predicateWithFormat:@"self == %@", word];
            NSInteger count = [words filteredArrayUsingPredicate:wordPredicate].count;
            [wordCounts setValue:@(count) forKey:word];
          }
    
      return wordCounts;
    }

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array
{
      NSMutableDictionary *songByArtist = [[NSMutableDictionary alloc] init];
    
      for (NSString *artistWithSong in array) {
            // split the artist and corresponding song. Tokens are separated by "-"
            NSArray *artistSong = [artistWithSong componentsSeparatedByString:@" - "];
            NSString *artist = [artistSong firstObject];
            NSString *song = [artistSong lastObject];
        
            // Put the info into the songByArtist dictionary
            if ([songByArtist objectForKey:artist]) {
                  [[songByArtist objectForKey:artist] addObject:song];
                } else {
                      NSMutableArray *songs = [[NSMutableArray alloc] initWithObjects:song, nil];
                      [songByArtist setObject:songs forKey:artist];
                    }
          }
    
      // Sort the songs
      for (NSString *key in songByArtist) {
            NSMutableArray *songs = [songByArtist objectForKey:key];
            [songs sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:nil ascending:YES]]];
          }
    
      return songByArtist;
    }


@end
