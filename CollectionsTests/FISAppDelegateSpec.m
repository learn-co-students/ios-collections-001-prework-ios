//  FISAppDelegateSpec.m

#import <Foundation/Foundation.h>
#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"

#import "FISAppDelegate.h"

SpecBegin(FISAppDelegate)

describe(@"FISAppDelegate", ^{
    __block FISAppDelegate *appDelegate;
    
    __block NSArray *chaoticPrimes;
    __block NSArray *numbersToBisect;
    __block NSDictionary *fellowshipOfTheRing;
    
    __block NSArray *foods;
    __block NSArray *foodsBeginningWithA;
    
    __block NSArray *singulars;
    __block NSArray *plurals;
    
    __block NSString *moby;
    __block NSDictionary *mobyDict;  // get it?
    
    __block NSArray *songList;
    __block NSDictionary *songsByArtist;
    
    beforeEach(^{
        appDelegate = [[FISAppDelegate alloc] init];
        
        chaoticPrimes = @[ @11, @7, @3, @23, @19, @13, @2, @17, @5 ];
        
        numbersToBisect = @[ @(-7), @5, @(-3), @2, @0, @(-2), @3, @(-5),@7 ];
        
        fellowshipOfTheRing = @{ @"Legolas" : @"elf"   ,
                                 @"Gimli"   : @"dwarf" ,
                                 @"Gandalf" : @"Maiar" ,
                                 @"Frodo"   : @"hobbit",
                                 @"Merry"   : @"hobbit",
                                 @"Boromir" : @"human" ,
                                 @"Sam"     : @"hobbit",
                                 @"Aragorn" : @"human" ,
                                 @"Pippin"  : @"hobbit"
                               };
        
        foods = @[ @"almond", @"orange", @"pear", @"starfruit", @"avocado", @"banana",
                   @"pancake", @"potato", @"Apple Crings", @"cherry", @"artichoke" ];
        
        foodsBeginningWithA = @[@"almond", @"avocado", @"Apple Crings", @"artichoke"];
        
        singulars = @[ @"hand"   ,
                       @"foot"   , //yes
                       @"knee"   ,
                       @"table"  ,
                       @"box"    , //yes
                       @"ox"     , //yes
                       @"axle"   ,
                       @"radius" , //yes
                       @"trivium"]; //yes
        
        plurals = @[ @"hands" ,
                     @"feet"  ,
                     @"knees" ,
                     @"tables",
                     @"boxes" ,
                     @"oxen"  ,
                     @"axles" ,
                     @"radii" ,
                     @"trivia"];

        
        moby = @"Call me Ishmael. Some years ago- never mind how long precisely- having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world. It is a way I have of driving off the spleen and regulating the circulation.";
        
        mobyDict = @{ @"purse" : @1, @"years" : @1, @"would" : @1, @"mind" : @1, @"some" : @1, @"ishmael" : @1, @"ago" : @1, @"see" : @1, @"shore" : @1, @"part" : @1, @"particular" : @1, @"the" : @4, @"is" : @1, @"off" : @1, @"it" : @1, @"i" : @3, @"have" : @1, @"no" : @1, @"on" : @1, @"watery" : @1, @"thought" : @1, @"circulation" : @1, @"never" : @1, @"regulating" : @1, @"spleen" : @1, @"world" : @1, @"me" : @2, @"how" : @1, @"driving" : @1, @"or" : @1, @"little" : @2, @"interest" : @1, @"and" : @3, @"having" : @1, @"in" : @1, @"precisely" : @1, @"call" : @1, @"nothing" : @1, @"of" : @2, @"about" : @1, @"way" : @1, @"long" : @1, @"sail" : @1, @"money" : @1, @"to" : @1, @"my" : @1, @"a" : @2
                      };
        
        songList = @[ @"Coldplay - Strawberry Swing"        ,
                      @"Johnny Flynn - In April"            ,
                      @"Coldplay - Clocks"                  ,
                      @"Sigur Rós - Andvari"                ,
                      @"Ryan Adams - When The Stars Go Blue",
                      @"Coldplay - Viva la Vida"            ,
                      @"Johnny Flynn - Cold Bread"          ,
                      @"Sigur Rós - Glósóli"                ,
                      @"Ryan Adams - La Cienega Just Smiled"
                    ];
        
        songsByArtist = @{ @"Coldplay"     : @[ @"Clocks"          ,
                                                @"Strawberry Swing",
                                                @"Viva la Vida"    ]       ,
                           @"Johnny Flynn" : @[ @"Cold Bread",
                                                @"In April"  ]             ,
                           @"Ryan Adams"   : @[ @"La Cienega Just Smiled",
                                                @"When The Stars Go Blue"] ,
                           @"Sigur Rós"    : @[ @"Andvari" ,
                                                @"Glósóli" ]
                           };
    });
    
    describe(@"arrayBySortingArrayAscending:", ^{
        it(@"returns the contents of the submitted array sorted in ascending order", ^{
            NSArray *ascendingPrimes = @[ @2, @3, @5, @7, @11, @13, @17, @19, @23 ];
            expect([appDelegate arrayBySortingArrayAscending:chaoticPrimes]).to.equal(ascendingPrimes);
        });
    });
    
    describe(@"arrayBySortingArrayDescending:", ^{
        it(@"returns the contents of the submitted array sorted in descending order", ^{
            NSArray *descendingPrimes = @[ @23, @19, @17, @13, @11, @7, @5, @3, @2];
            expect([appDelegate arrayBySortingArrayDescending:chaoticPrimes]).to.equal(descendingPrimes);
        });
    });
    
    describe(@"arrayBySwappingFirstObjectWithLastObjectInArray:", ^{
        it(@"returns an NSArray object", ^{
            expect([appDelegate arrayBySwappingFirstObjectWithLastObjectInArray:chaoticPrimes]).to.beKindOf([NSArray class]);
        });
        
        it(@"returns an array of three objects with the first and last objects swapped", ^{
            NSArray *threeStrings = @[@"one", @"two", @"three"];
            
            expect([appDelegate arrayBySwappingFirstObjectWithLastObjectInArray:threeStrings]).to.equal(@[@"three",@"two",@"one"]);
        });
        
        it(@"returns an array of five objects with the first and last objects swapped", ^{
            NSArray *fiveStrings = @[@"one", @"two", @"three", @"four", @"five"];
            
            expect([appDelegate arrayBySwappingFirstObjectWithLastObjectInArray:fiveStrings]).to.equal(@[@"five", @"two", @"three", @"four", @"one"]);
        });
    });
    
    describe(@"arrayByReversingArray:", ^{
        it(@"returns an NSArray object", ^{
            expect([appDelegate arrayByReversingArray:chaoticPrimes]).to.beKindOf([NSArray class]);
        });
        
        it(@"returns a new array of four objects in reverse order of the submitted array with four objects", ^{
            NSArray *fourStrings = @[@"one", @"two", @"three", @"four"];
            
            expect([appDelegate arrayByReversingArray:fourStrings]).to.equal(@[@"four", @"three", @"two", @"one"]);
        });

        it(@"returns a new array of five objects in reverse order of the submitted array with five objects", ^{
            NSArray *fiveStrings = @[@"one", @"two", @"three", @"four", @"five"];
            
            expect([appDelegate arrayByReversingArray:fiveStrings]).to.equal(@[@"five", @"four", @"three", @"two", @"one"]);
        });
    });
    
    describe(@"stringInBasicLeetFromString:", ^{
        it(@"returns an NSString object", ^{
            expect([appDelegate stringInBasicLeetFromString:@"string"]).to.beKindOf([NSString class]);
        });
        
        it(@"returns a string in b451c l337 based on the submitted string",^{
            NSString *basicLeet = @"basic leet";
            
            expect([appDelegate stringInBasicLeetFromString:basicLeet]).to.equal(@"b451c 1337");
        });
    });
    
    describe(@"splitArrayIntoNegativesAndPositives:", ^{
        it(@"returns an NSArray object", ^{
            expect([appDelegate splitArrayIntoNegativesAndPositives:numbersToBisect]).to.beKindOf([NSArray class]);
        });

        it(@"returns an array with two sub-arrays", ^{
            expect([appDelegate splitArrayIntoNegativesAndPositives:numbersToBisect].count).to.equal(2);
        });
        
        it(@"returns the first sub-array with only the values that are less-than zero", ^{
            NSArray *bisectedArray = [appDelegate splitArrayIntoNegativesAndPositives:numbersToBisect];
            for (NSNumber *number in bisectedArray[0]) {
                expect([number integerValue]).to.beLessThan(0);
            }
        });
        
        it(@"returns the first sub-array with four values that are less-than zero", ^{
            NSArray *bisectedArray = [appDelegate splitArrayIntoNegativesAndPositives:numbersToBisect];
            
            expect([bisectedArray[0] count]).to.equal(4);
        });
        
        it(@"returns the second sub-array with only the values that are greater-than-or-equal-to zero", ^{
            NSArray *bisectedArray = [appDelegate splitArrayIntoNegativesAndPositives:numbersToBisect];
            for (NSNumber *number in bisectedArray[1]) {
                expect([number integerValue]).to.beGreaterThanOrEqualTo(0);
            }
        });
        
        it(@"returns the second sub-array with five values that are greater-than-or-equal-to zero", ^{
            NSArray *bisectedArray = [appDelegate splitArrayIntoNegativesAndPositives:numbersToBisect];
            
            expect([bisectedArray[1] count]).to.equal(5);
        });
    });
    
    describe(@"namesOfHobbitsInDictionary:", ^{
        it(@"returns an NSArray object", ^{
            expect([appDelegate namesOfHobbitsInDictionary:fellowshipOfTheRing]).to.beKindOf([NSArray class]);
        });

        it(@"returns an array with the correct names of the hobbits", ^{
            NSArray *hobbits = [appDelegate namesOfHobbitsInDictionary:fellowshipOfTheRing];

            expect(hobbits).to.haveACountOf(4);
            expect(hobbits).to.beSupersetOf(@[@"Frodo", @"Sam", @"Merry", @"Pippin"]);
        });

    });
    
    describe(@"stringsBeginningWithAInArray:", ^{
        it(@"returns an NSArray object", ^{
            expect([appDelegate stringsBeginningWithAInArray:foods]).to.beKindOf([NSArray class]);
        });
        
        it(@"returns all of and only the words that beginning with 'a'", ^{
            
            expect([appDelegate stringsBeginningWithAInArray:foods]).to.equal(foodsBeginningWithA);
        });
    });
    
    describe(@"sumOfIntegersInArray:", ^{
        it(@"returns the sum of all the integer numbers in the submitted array with positive values", ^{
            expect([appDelegate sumOfIntegersInArray:chaoticPrimes]).to.equal(100);
        });
        
        it(@"returns the sum of all the integer numbers in the submitted array with positive and negative values", ^{
            expect([appDelegate sumOfIntegersInArray:numbersToBisect]).to.equal(0);
        });
    });
    
    describe(@"arrayByPluralizingStringsInArray:", ^{
        it(@"returns an NSArray object", ^{
            expect([appDelegate arrayByPluralizingStringsInArray:@[@"string"]]).to.beKindOf([NSArray class]);
        });

        it(@"returns an array of the strings from the submitted array in their correct plural forms", ^{
            
            expect([appDelegate arrayByPluralizingStringsInArray:singulars]).to.equal(plurals);
        });
    });
    
    describe(@"countsOfWordsInString:", ^{
        it(@"returns an NSDictionary object", ^{
            expect([appDelegate countsOfWordsInString:@"string"]).to.beKindOf([NSDictionary class]);
        });

        it(@"returns a dictionary whose keys are each word in the story and the value is the number of occurences of that word", ^{
            // should ignore punctuation and be case insensitive
            
            expect([appDelegate countsOfWordsInString:moby]).to.equal(mobyDict);
        });
    });
    
    describe(@"songsGroupedByArtistFromArray:", ^{
        it(@"returns an NSDictionary object", ^{
            expect([appDelegate songsGroupedByArtistFromArray:songList]).to.beKindOf([NSDictionary class]);
        });

        it(@"returns a dictionary of the alphabetized song names collected into arrays with their artist's name as the key", ^{
            
            expect([appDelegate songsGroupedByArtistFromArray:songList]).to.equal(songsByArtist);
        });
    });
});

SpecEnd

