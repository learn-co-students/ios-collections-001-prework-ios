//
//  FISCollections.h
//  Collections
//
//  Created by Chris Gonzales on 5/30/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISCollections : NSObject

-(NSArray *)sortArrayAsc:(NSArray *)array;
-(NSArray *)sortArrayDesc:(NSArray *)array;
-(NSArray *)swapElements:(NSArray *)array;
-(NSArray *)reverseArray:(NSArray *)array;
-(NSArray *)keshaMaker:(NSArray *)array;
-(NSDictionary *)greaterAndLessThan10:(NSArray *)array;
-(NSArray *)findWinners:(NSDictionary *)peeps;
-(NSArray *)findA:(NSArray *)array;
-(NSInteger)sumArray:(NSArray *)array;
-(NSArray *)addS:(NSArray *)array;
-(NSDictionary *)countWordsInStory:(NSString *)story;
-(NSDictionary *)organizeSongsByArtist:(NSArray *)jams;

@end
