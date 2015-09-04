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

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)ascendingArray
{
  NSSortDescriptor *assortedByAscending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
  NSArray *sortedArray = [ascendingArray sortedArrayUsingDescriptors:@[assortedByAscending]];
  return sortedArray;
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)descendingArray
{
  NSSortDescriptor *sortedByDescending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:false];
  NSArray *sortedArray = [descendingArray sortedArrayUsingDescriptors:@[sortedByDescending]];
  return sortedArray;
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)swap
{
  NSMutableArray *mutableSwap = [swap mutableCopy];
  NSString *objectZero = [mutableSwap objectAtIndex:0];
  NSString *objectLast = [mutableSwap objectAtIndex:mutableSwap.count-1];
  [mutableSwap removeObjectAtIndex:0];
  [mutableSwap insertObject:objectLast atIndex:0];
  [mutableSwap removeObjectAtIndex:mutableSwap.count-1];
  [mutableSwap addObject:objectZero];
  
  return mutableSwap;
}

-(NSArray *)arrayByReversingArray:(NSArray *)reverse
{
  NSArray *reversedArray = [[reverse reverseObjectEnumerator]allObjects];
  return reversedArray;
}

-(NSString *)stringInBasicLeetFromString:(NSString *)basic
{
  NSString *leetString = [basic stringByReplacingOccurrencesOfString:@"a" withString:@"4"];
  leetString = [leetString stringByReplacingOccurrencesOfString:@"s" withString:@"5"];
  leetString = [leetString stringByReplacingOccurrencesOfString:@"i" withString:@"1"];
  leetString = [leetString stringByReplacingOccurrencesOfString:@"l" withString:@"1"];
  leetString = [leetString stringByReplacingOccurrencesOfString:@"e" withString:@"3"];
  leetString = [leetString stringByReplacingOccurrencesOfString:@"t" withString:@"7"];
  
  return leetString;
}

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)negativesAndPositives
{
//{ NSPredicate *negativePredicate = [NSPredicate predicateWithFormat:@"number<0"];
//  NSArray *arrayOfNegatives = [negativesAndPositives filteredArrayUsingPredicate:negativePredicate];
//  
//  NSPredicate *positivePredicate = [NSPredicate predicateWithFormat:  @"number>=0"];
//  NSArray *arrayOfPositives = [negativesAndPositives filteredArrayUsingPredicate:positivePredicate];
//  
//  NSMutableArray *splitArray = [[NSMutableArray alloc]init];
//  
//  splitArray[0] = arrayOfNegatives;
//  splitArray[1] = arrayOfPositives;
  NSMutableArray *negativeArrary = [[NSMutableArray alloc]init];
  NSMutableArray *positiveArray = [[NSMutableArray alloc]init];

  for (NSUInteger i =0; i<negativesAndPositives.count; i++) {
    NSInteger negOrPos = [negativesAndPositives[i] integerValue];
    NSNumber *newNumber;
    if (negOrPos>0) {
      newNumber = @(negOrPos);
      [positiveArray addObject:newNumber];
    }
    if (negOrPos<0) {
      newNumber = @(negOrPos);
      [negativeArrary addObject:newNumber];
    }
    
    
      }
  
  NSMutableArray *splitArray = [[NSMutableArray alloc]init];
  splitArray[0] = negativeArrary;
  splitArray[1] = positiveArray;
  
return splitArray;
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbits
{
  NSArray *allNames = [hobbits allKeysForObject:@"hobbit"];
  return allNames;
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)aWords
{
  NSPredicate *beginsWithA = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH[c] 'a'"];
  NSArray *wordsBeginningWithA = [aWords filteredArrayUsingPredicate:beginsWithA];
  
  return wordsBeginningWithA;
}

-(NSInteger)sumOfIntegersInArray:(NSArray *)numbersToSum
{
  NSInteger sum = 0;
  for (NSUInteger i = 0; i<numbersToSum.count; i++) {
    
    NSInteger currentNumber = [numbersToSum[i] integerValue];
   sum = sum + currentNumber;
   
  }
  return sum;
}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)singularArray
{
  NSMutableArray *pluralizedWords = [[NSMutableArray alloc]init];
  
  for (NSUInteger i = 0; i<singularArray.count; i++) {
    if ([singularArray[i] containsString:@"oo"]) {
      NSString *pluralOO = [singularArray[i] stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
      [pluralizedWords addObject:pluralOO];
    }
    else if ([singularArray[i] containsString:@"us"]) {
      NSString *pluralUS = [singularArray[i] stringByReplacingOccurrencesOfString:@"us" withString:@"i"];
      [pluralizedWords addObject:pluralUS];
    }
    else if ([singularArray[i] containsString:@"um"]){
      NSString *pluralUM = [singularArray[i] stringByReplacingOccurrencesOfString:@"um" withString:@"a"];
      [pluralizedWords addObject:pluralUM];
    }
    
    else if ([singularArray[i] containsString:@"box"]){
      NSString *pluralBox = [singularArray[i] stringByAppendingString:@"es"];
      [pluralizedWords addObject:pluralBox];
    }
    else if ([singularArray[i] containsString:@"ox"]){
      NSString *pluralOx = [singularArray[i] stringByAppendingString:@"en"];
      [pluralizedWords addObject:pluralOx];
    }
    else {
   NSString *regularString = [singularArray[i]stringByAppendingString:@"s"];
    [pluralizedWords addObject:regularString];
    }
  }
  
  
  return pluralizedWords;
}

-(NSDictionary *)countsOfWordsInString:(NSString *)wordsToCount
{
  //remove punctuation from string
  NSString *stringWithoutPunctuation = [[wordsToCount componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@" "];
  //create array from string with each word at an index
  NSArray *wordsArray = [stringWithoutPunctuation componentsSeparatedByString:@" "];
  
  NSMutableDictionary *countsOfStrings = [[NSMutableDictionary alloc]init];
  
  //iterate over array to filter each word and create a dictionary with word:count format
  for (NSUInteger i = 0; i<wordsArray.count; i++) {
    NSString *word = [wordsArray[i] lowercaseString];
    NSPredicate *wordPredicate = [NSPredicate predicateWithFormat:@"self MATCHES[c] %@", word];
    NSArray *lengthArray = [wordsArray filteredArrayUsingPredicate:wordPredicate];
    NSInteger count = [lengthArray count];
    NSNumber *countNumber = @(count);
    
    countsOfStrings [word] = countNumber;
  }
  [countsOfStrings removeObjectForKey:@""];
  return countsOfStrings;
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)artists
{
  // create the dictionary we are going to return
  //
  // now we want to loop through the array of artists!
  //k,
  // start loop
  // parse the entry from the array and get artist, song
  // check if the artist already has songs in our dictionary
  // if they do, then we simply add this song to the list of songs
  // if they don't then we need to create a list of songs and add this song to it
  // end loop
  //
  // return the dictionary of artists and their songs and rejoice!
  
  /* BEFORE CLAIRE */
  
  NSMutableDictionary *songsGroupedbyArtist = [[NSMutableDictionary alloc]init];
//  NSMutableArray *artistArray = [[NSMutableArray alloc]init];
//  NSMutableDictionary *subDictionary = [[NSMutableDictionary alloc]init];
  
  
  for (NSUInteger i = 0; i<artists.count; i++) {
    NSString *artist = [artists[i] componentsSeparatedByString:@" - "][0];
    NSString *song = [artists[i] componentsSeparatedByString:@" - "][1];
    
    if (artist && song) {
      // if artist already has songs in array, just add to it
      NSMutableArray *songsInArray = [songsGroupedbyArtist objectForKey:artist];
      if (songsInArray != nil) {
        // already have added songs, just add to the list
        [songsInArray addObject:song];
      } else {
        // no songs added, need to create list and add this song
        songsInArray = [[NSMutableArray alloc] init];
        [songsInArray addObject:song];
        songsGroupedbyArtist[artist] = songsInArray;
      }
      
      NSSortDescriptor *songSort = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
      NSArray *sortedArray = [songsGroupedbyArtist[artist] sortedArrayUsingDescriptors:@[songSort]];
      songsGroupedbyArtist[artist] = [sortedArray mutableCopy];
    }
  }
  
  
 
  
//    subDictionary [subArray[0]] = subArray[1];
//    if (songsGroupedbyArtist[subArray[0]]) {
//      [songsGroupedbyArtist[subArray[0]] addObject:subArray[1]];
//    }
//    songsGroupedbyArtist = subDictionary;
    
  
//  for (NSUInteger i = 0; i<artistArray.count; i++) {
//   
//    if (artistArray[i][0]) {
//    
//      songsGroupedbyArtist[artistArray[i][0]]= artistArray[i][1];
//    }
//     NSMutableArray *nestedArray = [[NSMutableArray alloc]init];
//    songsGroupedbyArtist [artistArray[i][0]] = nestedArray;
//    [nestedArray addObject:artistArray[i][1]];
//    }
  
//    NSPredicate *filterSongsPredicate = [NSPredicate predicateWithFormat:@"self CONTAINS[c] %@", artistArray[i][0]];
//    NSArray *filteredArtists = [artistArray filteredArrayUsingPredicate:filterSongsPredicate];
//    songsGroupedbyArtist [artistArray[i][0]] =
  
  
  
  return songsGroupedbyArtist;
}






@end
