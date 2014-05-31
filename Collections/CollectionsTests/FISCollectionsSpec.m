//
//  FISCollectionsSpec.m
//  Collections
//
//  Created by Chris Gonzales on 5/30/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#import "FISCollections.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "KIF.h"
#import "Swizzlean.h"

SpecBegin(FISCollections)

describe(@"FISCollections", ^{
    __block FISCollections *collection;
    __block NSString *story;
    __block NSDictionary *storyCount;
    __block NSArray *jams;
    
    beforeAll(^{
        collection = [[FISCollections alloc] init];
        
        story = @"The summer of tenth grade was the best summer of my life. I went to the beach everyday and we had amazing weather. The weather didnt really vary much and was always pretty hot although sometimes at night it would rain. I didnt mind the rain because it would cool everything down and allow us to sleep peacefully. Its amazing how much the weather affects your mood. Who would have thought that I could write a whole essay just about the weather in tenth grade. Its kind of amazing right? Youd think for such an interesting person I might have more to say but you would be wrong.";
        
        storyCount = @{@"The":@2, @"summer":@2, @"of":@3, @"tenth":@2, @"grade":@1,
                       @"was":@2, @"the":@5, @"best":@1, @"my":@1, @"life.":@1, @"I":@4,
                       @"went":@1, @"to":@3, @"beach":@1, @"everyday":@1, @"and":@3,
                       @"we":@1, @"had":@1, @"amazing":@3, @"weather.":@1, @"weather":@3,
                       @"didnt":@2, @"really":@1, @"vary":@1, @"much":@2, @"always":@1,
                       @"pretty":@1, @"hot":@1, @"although":@1, @"sometimes":@1, @"at":@1,
                       @"night":@1, @"it":@2, @"would":@4, @"rain.":@1, @"mind":@1, @"rain":@1,
                       @"because":@1, @"cool":@1, @"everything":@1, @"down":@1, @"allow":@1,
                       @"us":@1, @"sleep":@1, @"peacefully.":@1, @"Its":@2, @"how":@1,
                       @"affects":@1, @"your":@1, @"mood.":@1, @"Who":@1, @"have":@2,
                       @"thought":@1, @"that":@1, @"could":@1, @"write":@1, @"a":@1,
                       @"whole":@1, @"essay":@1, @"just":@1, @"about":@1, @"in":@1,
                       @"grade.":@1, @"kind":@1, @"right?":@1, @"Youd":@1, @"think":@1, 
                       @"for":@1, @"such":@1, @"an":@1, @"interesting":@1, @"person":@1, 
                       @"might":@1, @"more":@1, @"say":@1, @"but":@1, @"you":@1, @"be":@1, @"wrong.":@1};
        
        jams = @[@"dave matthews band - tripping billies", @"dave matthews band - #41", @"calvin harris - some techno song", @"avicii - some other dance song", @"oasis - wonderwall", @"oasis - champagne supernova"];
    });
    
//    Question 1
    describe(@"sortArrayAsc:", ^{
        it(@"should return an array sorted in ascending order",^{
            NSArray *result = [collection sortArrayAsc:@[@25,@7,@1]];
            expect(result).to.equal(@[@1,@7,@25]);
        });
    });
    
//    Question 2
    describe(@"sortArrayDesc:", ^{
        it(@"should return an array sorted in descending order",^{
            NSArray *result = [collection sortArrayDesc:@[@25,@7,@14]];
            expect(result).to.equal(@[@25,@14,@7]);
        });
    });
    
//    Question 3
    describe(@"swapElements:", ^{
        it(@"should swap the second and third elements of an array",^{
            NSArray *result = [collection swapElements:@[@"blake",@"ashley",@"scott"]];
            expect(result).to.equal(@[@"blake",@"scott",@"ashley"]);
        });
    });
    
//    Question 4
    describe(@"reverseArray:", ^{
        it(@"reverse the order of an array",^{
            NSArray *result = [collection reverseArray:@[@"blake",@"ashley",@"scott"]];
            expect(result).to.equal(@[@"scott",@"ashley",@"blake"]);
        });
    });
    
//    Question 5
    describe(@"keshaMaker:", ^{
        it(@"taking an array as an input, change the 3rd character of each element to a dollar sign",^{
            NSArray *result = [collection keshaMaker:@[@"blake",@"ashley",@"scott"]];
            expect(result).to.equal(@[@"bl$ke",@"as$ley",@"sc$tt"]);
        });
    });
    
//    Question 6
    describe(@"greaterAndLessThan10:", ^{
        it(@"using an array as an input create a dictionary with two keys, 'greater_than_10' and 'less_than_10' with values that are arrays of any numbers greater than 10 or less than 10",^{
            NSDictionary *result = [collection greaterAndLessThan10: @[@100,@1000,@5,@2,@3,@15,@1,@1,@100]];
            NSDictionary *answer = @{@"greater_than_10": @[@100,@1000,@15,@100], @"less_than_10": @[@5,@2,@3,@1,@1]};
            expect(result).to.equal(answer);
        });
    });
    
//    Question 7
    describe(@"findWinners:", ^{
        it(@"find all the winners and return them in an array",^{
            NSArray *result = [collection findWinners:@{@"blake": @"winner",
                                                        @"ashley": @"loser",
                                                        @"caroline": @"loser",
                                                        @"carlos": @"winner"}];
            expect(result).to.beSupersetOf(@[@"blake",@"carlos"]);
            expect(result.count).to.equal(2);
        });
    });
    
//    Question 8
    describe(@"findA:", ^{
        it(@"find all words that begin with 'a' in teh following array",^{
            NSArray *result = [collection findA:@[@"apple",@"orange",@"pear",@"avis",@"arlo",@"ascot"]];
            expect(result).to.equal(@[@"apple",@"avis",@"arlo",@"ascot"]);
        });
    });
    
//    Question 9
    describe(@"sumArray:", ^{
        it(@"sum all the numbers in the following array",^{
            NSInteger result = [collection sumArray:@[@11,@4,@7,@8,@9,@100,@134]];
            expect(result).to.equal(273);
        });
    });
    
//    Question 10
    describe(@"addS:", ^{
        it(@"add an 's' to each word in the array except for the 2nd element in the array",^{
            NSArray *result = [collection addS:@[@"hand",@"feet",@"knee",@"table"]];
            expect(result).to.equal(@[@"hands",@"feet",@"knees",@"tables"]);
        });
    });
    
//    Question 11
    describe(@"countWordsInStory:", ^{
        it(@"returns a dictionary whose keys are each word in the story and the value is the number of occurences of that word", ^{
            NSDictionary *result = [collection countWordsInStory:story];
            expect(result).to.equal(storyCount);
        });
    });
    
//    Question 12
    describe(@"organizeSongsByArtist:", ^{
        it(@"organize the songs by artist",^{
            NSDictionary *result = [collection organizeSongsByArtist:jams];
            expect(result).to.equal(@{@"dave matthews band": @[@"tripping billies",@"#41"], @"calvin harris": @[@"some techno song"], @"avicii":@[@"some other dance song"], @"oasis":@[@"wonderwall",@"champagne supernova"]});
        });
    });
});

SpecEnd
