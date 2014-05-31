//
//  FISCollections.m
//  Collections
//
//  Created by Chris Gonzales on 5/30/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCollections.h"

@implementation FISCollections


-(NSArray *)sortArrayAsc:(NSArray *)array;
{
    return [array sortedArrayUsingSelector:@selector(compare:)];
}

-(NSArray *)sortArrayDesc:(NSArray *)array;
{
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    
    return [array sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

-(NSArray *)swapElements:(NSArray *)array;
{
    NSMutableArray *swappedArray = [[NSMutableArray alloc] initWithArray:array];
    [swappedArray exchangeObjectAtIndex:1 withObjectAtIndex:2];
    
    return swappedArray;
}

-(NSArray *)reverseArray:(NSArray *)array;
{
    return [[array reverseObjectEnumerator] allObjects];
}
-(NSArray *)keshaMaker:(NSArray *)array;
{
    NSMutableArray *keshArray = [[NSMutableArray alloc] init];
    
    for (NSString *element in array) {
        NSString *newString = [element stringByReplacingCharactersInRange:NSMakeRange(2, 1) withString:@"$"];
        [keshArray addObject:newString];
    }
    
    return keshArray;
}

-(NSDictionary *)greaterAndLessThan10:(NSArray *)array;
{
    NSMutableArray *greater = [[NSMutableArray alloc] init];
    NSMutableArray *lessThan = [[NSMutableArray alloc] init];
    
    for (NSNumber *item in array) {
        if ([item integerValue] > 10) {
            [greater addObject:item];
        } else {
            [lessThan addObject:item];
        }
    }
    
    return @{@"greater_than_10": greater, @"less_than_10": lessThan};
}

-(NSArray *)findWinners:(NSDictionary *)peeps;
{
    NSArray *keys = [peeps allKeysForObject:@"winner"];
    
    return keys;
}

-(NSArray *)findA:(NSArray *)array;
{
    NSPredicate *aPredicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] 'a'"];
    
    return [array filteredArrayUsingPredicate:aPredicate];
}

-(NSInteger)sumArray:(NSArray *)array;
{
    NSNumber *sum = [array valueForKeyPath:@"@sum.self"];
    
    return [sum integerValue];
}

-(NSArray *)addS:(NSArray *)array;
{
    NSMutableArray *fixedArray = [[NSMutableArray alloc] init];
    
    for (int x = 0; x < array.count; x++) {
        NSString *currentItem = array[x];
        if (x == 1) {
            [fixedArray addObject:currentItem];
        } else {
            [fixedArray addObject:[NSString stringWithFormat:@"%@s", currentItem]];
        }
    }
    
    return fixedArray;
}

-(NSDictionary *)countWordsInStory:(NSString *)story;
{
    NSArray *storyWords = [story componentsSeparatedByString:@" "];
    NSMutableDictionary *wordDictionary = [[NSMutableDictionary alloc] init];
    
    for (NSString *word in storyWords) {
        if (wordDictionary[word]) {
            NSInteger count = [wordDictionary[word] integerValue];
            count++;
            wordDictionary[word] = [NSNumber numberWithInteger:count];
        } else {
            wordDictionary[word] = @1;
        }
    }
    
    return wordDictionary;
}

-(NSDictionary *)organizeSongsByArtist:(NSArray *)jams;
{
    NSMutableDictionary *organizer = [[NSMutableDictionary alloc] init];
    for (NSString *jam in jams) {
        NSArray *splitJam = [jam componentsSeparatedByString:@" - "];
        NSString *artist = splitJam[0];
        NSString *song = splitJam[1];
        
        if (organizer[artist]) {
            NSMutableArray *artistTracks = organizer[artist];
            [artistTracks addObject:song];
        } else {
            organizer[artist] = [[NSMutableArray alloc] initWithObjects:song, nil];
        }
    }
    
    return organizer;
}

@end
