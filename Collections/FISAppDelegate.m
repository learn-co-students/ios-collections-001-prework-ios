//
//  FISAppDelegate.m
//  Collections
//
//  Created by Chris Gonzales on 5/30/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/**
 
 * Define your methods here.
 
 */

//1
- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array{
    NSSortDescriptor *sortArrayAsc = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                       ascending:YES];
    
    NSArray *arrayAsc = [array sortedArrayUsingDescriptors:@[sortArrayAsc] ];
    return arrayAsc;
    };
//2
- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array{
    NSSortDescriptor *sortArrayDes = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                   ascending:NO];
    
    NSArray *arrayDes = [array sortedArrayUsingDescriptors:@[sortArrayDes] ];
    return arrayDes;
};;
//3
- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array{
    NSMutableArray *swappedArray = [array mutableCopy];
    swappedArray[0] = array[[array count]-1];
    swappedArray[[array count]-1] = array[0];
    return swappedArray;
    };
//4
- (NSArray *)arrayByReversingArray:(NSArray *)array{
    
    NSMutableArray *reversedArray = [[NSMutableArray alloc]init];
    
    for (NSInteger i = [array count] - 1; i >= 0; i--) {
        [reversedArray addObject:array[i]];
    }
    
    return reversedArray;
    };
//5
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
//6
- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array{
    
    NSMutableArray *splitArray = [[NSMutableArray alloc]init];
    
    NSPredicate *negativePredicate = [NSPredicate predicateWithFormat:@"self < 0"]; //set <= doesn't pass one of the tests
    NSPredicate *positivePredicate = [NSPredicate predicateWithFormat:@"self > 0"];

    [splitArray addObject:[array filteredArrayUsingPredicate:negativePredicate]];
    [splitArray addObject:[array filteredArrayUsingPredicate:positivePredicate]];

    return splitArray;
    };
//7
- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary{
    NSMutableArray *names = [[NSMutableArray alloc]init];
    
    for (NSString *key in dictionary) {
        if ([dictionary[key] isEqualToString:@"hobbit"]) {
            [names addObject:key];
        }
    }
    
    return names;
    };
//8
- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array{
    NSPredicate *beginWithA = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *stringBegisnWithA = [array filteredArrayUsingPredicate:beginWithA];
    
    return stringBegisnWithA;
    };
//9
- (NSInteger)sumOfIntegersInArray:(NSArray *)array{
    NSInteger total = 0;
    
    for (NSInteger i = 0 ; i < [array count]; i++) {
        
        total += [array[i] integerValue];
    }
    
    return total;
    
    }
    ;
//10
- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array{
    NSDictionary *specialWords = @{@"radius"    :@"radii",
                                   @"foot"      :@"feet",
                                   @"trivium"   :@"trivia",
                                   @"ox"        :@"oxen"  };
    NSMutableArray *pluralWords = [array mutableCopy];

    for (NSInteger i = 0 ; i < [pluralWords count]; i++) {
        if ([[specialWords allKeys]containsObject:pluralWords[i]]) {
            pluralWords[i] = specialWords[pluralWords[i]];
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
//11
- (NSDictionary *)countsOfWordsInString:(NSString *)string{
    
    NSDictionary *punctuation =    @{ @"."       : @"",
                                      @"-"       : @"",
                                      @","       : @"",
                                      @";"       : @""};
    
    NSArray *words = [[string lowercaseString] componentsSeparatedByString:@" "];
    NSMutableArray *mWords = [words mutableCopy];
    for(NSInteger i = 0; i < [mWords count]; i++){
        for (NSString *key in punctuation){
            mWords[i] = [mWords[i] stringByReplacingOccurrencesOfString:key withString:punctuation[key]];
        }
       
    }
    
    NSMutableDictionary *wordCount = [[NSMutableDictionary alloc]init];
    for (NSString *word in mWords){
        if(!wordCount[word]){
            wordCount[word] = @(1);
        }else{
            wordCount[word]= @([wordCount[word] integerValue] +1);
        }
        
    }
    
    return wordCount;
    };

//12
- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array{
//1.separate the artists and songs into array
    NSMutableDictionary *songsByArtist = [[NSMutableDictionary alloc]init];
    NSMutableArray *mArtistsSongs = [[NSMutableArray alloc]init];
    
    for (NSString *word in array){
        NSArray *artistsSongs = [word componentsSeparatedByString:@" - "];
        [mArtistsSongs addObject:artistsSongs];
            songsByArtist[artistsSongs[0]] = @"";
    }
//2. put the array contain artists and songs into dictionary
    NSMutableArray *songs = [[NSMutableArray alloc]init];
    NSMutableDictionary *mSongsByArtist = [songsByArtist mutableCopy];
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                   ascending:YES];
    
    for (NSString *key in songsByArtist) {
        for (NSArray *artist in mArtistsSongs){
            if ([key isEqualToString:artist[0]]) {
                [songs addObject:artist[1]];
            }
        }

        mSongsByArtist[key] = [songs sortedArrayUsingDescriptors:@[sortByNilAsc]];
        songs = [[NSMutableArray alloc]init];
    }
    
    return mSongsByArtist;
    };

@end
