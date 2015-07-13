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

-(NSArray *)arrayByAscendingSortingArray:(NSArray *)array {
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    
    return [array sortedArrayUsingDescriptors:@[sortByNilAsc]];
}

-(NSArray *)arrayByDescendingSortingArray:(NSArray *)array {
    NSSortDescriptor *sortByNilDesc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    
    return [array sortedArrayUsingDescriptors:@[sortByNilDesc]];
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
    NSMutableArray *mutableArray = [array mutableCopy];
    NSUInteger endIndex = mutableArray.count - 1;
    
    [mutableArray exchangeObjectAtIndex:0 withObjectAtIndex:endIndex];
    return [NSArray arrayWithArray:mutableArray];
}

-(NSArray *)arrayByReversingArray:(NSArray *)array {
    NSMutableArray *mutableArray = [array mutableCopy];
    NSUInteger i = 0;
    NSUInteger j = mutableArray.count - 1;
    
    for ( ; i < (mutableArray.count / 2); i++) {
        [mutableArray exchangeObjectAtIndex:i withObjectAtIndex:j];
        j--;
    }
    
    return [NSArray arrayWithArray:mutableArray];
}



-(NSString *)stringInBasicLeetFromString:(NSString *)string {
    NSDictionary *conversions = @{ @"a" : @"4" ,
                                   @"s" : @"5" ,
                                   @"i" : @"1" ,
                                   @"l" : @"1" ,
                                   @"e" : @"3" ,
                                   @"t" : @"7" };
    NSString *leetString = string;
    
    for (NSString *key in conversions) {
        leetString = [leetString stringByReplacingOccurrencesOfString:key withString:conversions[key]];
    }
    
    return leetString;
}

-(NSArray *)bisectArrayAt0:(NSArray *)array {
    NSMutableArray *negative = [[NSMutableArray alloc] init];
    NSMutableArray *positive = [[NSMutableArray alloc] init];
    
    for (NSNumber *number in array) {
        if ([number floatValue] < 0 ) {
            [negative addObject:number];
        } else if ([number floatValue] > 0) {
            [positive addObject:number];
        }
    }
    
    return @[negative, positive];
}

-(NSArray *)arrayByFilteringHobbitsFromDictionary:(NSDictionary *)dictionary {
    NSMutableArray *hobbits = [[NSMutableArray alloc] init];
    
    for (NSString *key in dictionary) {
        if ([dictionary[key] isEqualToString:@"hobbit"]) {
            [hobbits addObject:key];
        }
    }

    return [NSArray arrayWithArray:hobbits];
}

-(NSArray *)arrayByFilteringStringsBeginningWithA:(NSArray *)array {
    
    NSPredicate *beginsWithAPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *beginsWithA = [array filteredArrayUsingPredicate:beginsWithAPredicate];
    
    return beginsWithA;
}


-(NSInteger)sumOfIntegerNumbersInArray:(NSArray *)array {
    
    NSInteger sum = 0;
    for (NSNumber *number in array) {
        sum = sum + [number integerValue];
    }
    
    return sum;
}


-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    
    NSMutableArray *plurals = [[NSMutableArray alloc] init];
    
    for (NSString *singular in array) {
        NSString *plural = @"";
        if ([singular containsString:@"oo"]) {
            plural = [singular stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
        } else if ([singular containsString:@"ox"]) {
            if ([singular hasPrefix:@"b"]) {
                plural = [singular stringByAppendingString:@"es"];
            } else {
                plural = [singular stringByAppendingString:@"en"];
            }
        } else if ([singular hasSuffix:@"us"]) {
            plural = [singular stringByReplacingOccurrencesOfString:@"us" withString:@"i"];
        } else if ([singular hasSuffix:@"um"]) {
            plural = [singular stringByReplacingOccurrencesOfString:@"um" withString:@"a"];
        } else {
            plural = [singular stringByAppendingString:@"s"];
        }
        [plurals addObject:plural];
    }
    
    return [NSArray arrayWithArray:plurals];
}

-(NSDictionary *)countsOfWordsInString:(NSString *)string {
    NSArray *punctuationStrings = @[@".", @",", @";", @"-"];
    
    NSString *noPunctuation = string;
    
    for (NSString *punctuation in punctuationStrings) {
        noPunctuation = [noPunctuation stringByReplacingOccurrencesOfString:punctuation withString:@""];
    }
    
    NSString *lowercaseNoPunctuation = [noPunctuation lowercaseString];
    
    NSArray *arrayOfWords = [lowercaseNoPunctuation componentsSeparatedByString:@" "];
    
    NSMutableDictionary *countsOfWords = [[NSMutableDictionary alloc] init];
    
    for (NSString *word in arrayOfWords) {
        if ([countsOfWords[word] integerValue] > 0) {
            NSInteger count = [countsOfWords[word] integerValue];
            count++;
            countsOfWords[word] = @(count);
        } else {
            countsOfWords[word] = @1;
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:countsOfWords];
}

-(NSDictionary *)dictionaryOfSongsByArtistFromArray:(NSArray *)array {
    NSMutableDictionary *artistsWithSongs = [[NSMutableDictionary alloc] init];
    
    for (NSString *string in array) {
        NSArray *artistAndSong = [string componentsSeparatedByString:@" - "];
        NSString *artist = artistAndSong[0];
        NSString *song = artistAndSong[1];
        
        if ([[artistsWithSongs allKeys] containsObject:artist]) {
            [artistsWithSongs[artist] addObject:song];
        } else {
            artistsWithSongs[artist] = [ @[song] mutableCopy];
        }
    }
    
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    for (NSString *artist in artistsWithSongs) {
        [artistsWithSongs[artist] sortUsingDescriptors:@[sortByNilAsc]];
    }
    
    return [NSDictionary dictionaryWithDictionary:artistsWithSongs];
}


@end
