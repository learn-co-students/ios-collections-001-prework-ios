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
    NSMutableArray *temp = [array mutableCopy];
    [temp exchangeObjectAtIndex:0 withObjectAtIndex:[array count] - 1];
    return temp;
}

- (NSArray *)arrayByReversingArray:(NSArray *)array
{
    NSMutableArray *temp = [array mutableCopy];
    
    NSUInteger i = 0;
    NSUInteger j = [temp count] - 1;
    while (i < j) {
        [temp exchangeObjectAtIndex:i withObjectAtIndex:j];
        i++;
        j--;
    }
    
    return temp;
}

- (NSString *)stringInBasicLeetFromString:(NSString *)string
{
    NSDictionary *swapValues = @{@"a": @"4", @"s": @"5", @"i": @"1", @"l": @"1", @"e": @"3", @"t": @"7"};
    for (NSString *value in swapValues) {
        string = [string stringByReplacingOccurrencesOfString:value withString:swapValues[value]];
    }
    return string;
}

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array
{
    NSMutableArray *pos = [[NSMutableArray alloc] init];
    NSMutableArray *neg = [[NSMutableArray alloc] init];
    for (NSNumber *value in array) {
        if ([value integerValue] < 0) {
            [neg addObject:value];
        } else {
            [pos addObject:value];
        }
    }
    return @[neg, pos];
}

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbits
{
    NSMutableArray *hobbitNames = [[NSMutableArray alloc] init];
    for (NSString *name in hobbits) {
        if ([hobbits[name] isEqualToString:@"hobbit"]) {
            [hobbitNames addObject:name];
        }
    }
    return hobbitNames;
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
