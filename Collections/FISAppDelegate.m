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

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array
{
    NSSortDescriptor *descending = [NSSortDescriptor sortDescriptorWithKey:@"self"
                                                                ascending:NO];
    NSArray *sorted = [array sortedArrayUsingDescriptors:@[descending]];
    return sorted;
}

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array
{
    NSSortDescriptor *ascending = [NSSortDescriptor sortDescriptorWithKey:@"self"
                                                                 ascending:YES];
    NSArray *sorted = [array sortedArrayUsingDescriptors:@[ascending]];
    return sorted;
}

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array
{
    return nil;
}

- (NSArray *)arrayByReversingArray:(NSArray *)array
{
    return nil;
}

- (NSArray *)stringInBasicLeetFromString:(NSString *)string
{
    return nil;
}

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array
{
    return nil;
}

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbits
{
    return nil;
}

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array
{
    return nil;
}

- (NSInteger)sumOfIntegersInArray:(NSArray *)array
{
    return nil;
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array
{
    return nil;
}

- (NSDictionary *)countsOfWordsInString:(NSString *)string
{
    return nil;
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)songs
{
    return nil;
}

@end
