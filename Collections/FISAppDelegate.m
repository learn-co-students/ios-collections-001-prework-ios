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

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array{
        NSSortDescriptor *sortArrayAsc = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                       ascending:YES];
    
        NSArray *arrayAsc = [array sortedArrayUsingDescriptors:@[sortArrayAsc] ];
        return arrayAsc;
        };

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array{
        NSSortDescriptor *sortArrayDes = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                       ascending:NO];
    
        NSArray *arrayDes = [array sortedArrayUsingDescriptors:@[sortArrayDes] ];
        return arrayDes;
    };;

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array{
        NSMutableArray *swappedArray = [array mutableCopy];
        swappedArray[0] = array[[array count]-1];
        swappedArray[[array count]-1] = array[0];
        return swappedArray;
        };

- (NSArray *)arrayByReversingArray:(NSArray *)array{
    
        NSMutableArray *reversedArray = [[NSMutableArray alloc]init];
    
        for (NSInteger i = [array count] - 1; i >= 0; i--) {
                [reversedArray addObject:array[i]];
            }
    
        return reversedArray;
        };

- (NSString *)stringInBasicLeetFromString:(NSString *)string{

        NSDictionary *letterToNumber = @{ @"a"       : @"4",
                                          @"s"       : @"5",
                                          @"i"       : @"1",
                                          @"l"       : @"1",
                                          @"e"       : @"3",
                                          @"t"       : @"7",};
    
        for (NSString *key in letterToNumber){
                string = [string stringByReplacingOccurrencesOfString:key withString:letterToNumber[key]];
            }
    
        return string ;
        };

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array{
    
        NSPredicate *negativePredicate = [NSPredicate predicateWithFormat:@"self < 0"];
        NSArray *negativeArray = [array filteredArrayUsingPredicate:negativePredicate];

        NSPredicate *positivePredicate = [NSPredicate predicateWithFormat:@"self >= 0"];
        NSArray *positiveArray = [array filteredArrayUsingPredicate:positivePredicate];

        NSArray *splitArray = @[negativeArray, positiveArray];
        return splitArray;
    };

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary{
        NSMutableArray *names = [[NSMutableArray alloc]init];
    
        for (NSString *key in dictionary) {
                if ([dictionary[key] isEqualToString:@"hobbit"]) {
                        [names addObject:key];
                    }
            }
    
        return names;
        };

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array{
        NSPredicate *beginningWithA = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
        NSArray *stringBeginningWithA = [array filteredArrayUsingPredicate:beginningWithA];
    
        return stringBeginningWithA;
        };

- (NSInteger)sumOfIntegersInArray:(NSArray *)array{
        NSInteger sum = 0;
    
        for (NSInteger i = 0 ; i < [array count]; i++) {
        
                sum += [array[i] integerValue];
            }
    
        return sum;
    
        };

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array{
        NSDictionary *allWords = @{@"foot"      :@"feet",
                                       @"radius"   :@"radii",
                                   @"trivium"        :@"trivia",
                                   @"ox"       :@"oxen"};
        NSMutableArray *pluralWords = [array mutableCopy];
    
        for (NSInteger i = 0 ; i < [pluralWords count]; i++) {
                if ([[allWords allKeys]containsObject:pluralWords[i]]) {
                        pluralWords[i] = allWords[pluralWords[i]];
                    } else{
                
                            if ([pluralWords[i] hasSuffix:@"x"]){
                                pluralWords[i] = [pluralWords[i] stringByAppendingString:@"es"];
                                }else {
                                     pluralWords[i] = [pluralWords[i] stringByAppendingString:@"s"];
                                    }
                        }
        
            }
    
        return pluralWords;
        };

- (NSDictionary *)countsOfWordsInString:(NSString *)string{
    
        NSDictionary *punctuation =    @{ @"."       : @"",
                                          @"-"       : @"",
                                          @","       : @"",
                                          @";"       : @""};
    
        NSArray *words = [[string lowercaseString] componentsSeparatedByString:@" "];
        NSMutableArray *maWords = [words mutableCopy];
            for(NSInteger i = 0; i < [maWords count]; i++){
                for (NSString *key in punctuation){
                        maWords[i] = [maWords[i] stringByReplacingOccurrencesOfString:key withString:punctuation[key]];
                    }
        
            }
    
        NSMutableDictionary *wordCount = [[NSMutableDictionary alloc]init];
        for (NSString *word in maWords){
                if(!wordCount[word]){
                        wordCount[word] = @(1);
                    }else{
                            wordCount[word]= @([wordCount[word] integerValue] +1);
                        }
        
            }
    
        return wordCount;
        };


- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array{
    
        NSMutableDictionary *songsByArtist = [[NSMutableDictionary alloc]init];
        NSMutableArray *maArtistsSongs = [[NSMutableArray alloc]init];
    
        for (NSString *word in array){
                NSArray *artistsSongs = [word componentsSeparatedByString:@" - "];
                [maArtistsSongs addObject:artistsSongs];
                    songsByArtist[artistsSongs[0]] = @"";
            }

        NSMutableArray *songs = [[NSMutableArray alloc]init];
        NSMutableDictionary *maSongsByArtist = [songsByArtist mutableCopy];
        NSSortDescriptor *sortByNilAscending = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                       ascending:YES];
    
        for (NSString *key in songsByArtist) {
                for (NSArray *artist in maArtistsSongs){
                        if ([key isEqualToString:artist[0]]) {
                                [songs addObject:artist[1]];
                            }
                    }
        
                maSongsByArtist[key] = [songs sortedArrayUsingDescriptors:@[sortByNilAscending]];
                songs = [[NSMutableArray alloc]init];
            }
    
        return maSongsByArtist;
        };

@end
