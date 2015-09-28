//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    
    NSArray * arrayO = @[@"one", @"two", @"three", @"four"];
    
    //@[@"one", @"two", @"three", @"four", @"five"];
    
    NSArray * arrayO2 = @[@"1", @"3", @"-2", @"0",@"-5", @"11", @"-2", @"7" ];


    NSLog(@"%@",[self arrayBySwappingFirstObjectWithLastObjectInArray:arrayO]);
    NSLog(@"REversed -- %@",[self arrayByReversingArray:arrayO]);
    

    [self stringInBasicLeetFromString:@"basic"];
    [self splitArrayIntoNegativesAndPositives:arrayO2];
    
     NSLog(@"sum = %lu",[self sumOfIntegersInArray:arrayO2]);
    
    NSArray * namePlura = @[ @"hand"   ,
                              @"foot"   ,
                              @"knee"   ,
                              @"table"  ,
                              @"box"    ,
                              @"ox"     ,
                              @"axle"   ,
                              @"radius" ,
                              @"trivium"];
    
    [self arrayByPluralizingStringsInArray: namePlura];
    
    
    NSString * moby = @"Call me Ishmael. Some years ago- never mind how long precisely- having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world. It is a way I have of driving off the spleen and regulating the circulation.";
    [self countsOfWordsInString:moby];
    
    NSArray * songList = @[ @"Johnny Flynn - In April" ,
                  @"Coldplay - Clocks"                  ,
                  @"Sigur Rós - Andvari"                ,
                  @"Ryan Adams - When The Stars Go Blue",
                  @"Coldplay - Viva la Vida"            ,
                  @"Johnny Flynn - Cold Bread"          ,
                  @"Sigur Rós - Glósóli"                ,
                  @"Ryan Adams - La Cienega Just Smiled",
                  @"Coldplay - Strawberry Swing"
                  ];
    [self songsGroupedByArtistFromArray:songList];
    
    return YES;
}


-(NSArray *)arrayBySortingArrayAscending:(NSArray*)arrayA{
    
    NSSortDescriptor * sortAA = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [arrayA sortedArrayUsingDescriptors:@[sortAA]];
}


-(NSArray *)arrayBySortingArrayDescending:(NSArray*)arrayD{
    
    NSSortDescriptor * sortAA = [[NSSortDescriptor sortDescriptorWithKey:nil ascending:YES] reversedSortDescriptor];
    return [arrayD sortedArrayUsingDescriptors:@[sortAA]];
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray*)arraySwap{
    NSMutableArray * arrayBase = [arraySwap mutableCopy];
 
    [arrayBase exchangeObjectAtIndex:0 withObjectAtIndex:(arraySwap.count - 1)];
    return arrayBase;

}

-(NSArray *)arrayByReversingArray:(NSArray *)arrayRe{ // Am I taking advantage of math? is it right?
    
    NSMutableArray * arrayR = [arrayRe mutableCopy];
    
    for (int i = 0; i < arrayR.count/2; i++) {
        
        [arrayR exchangeObjectAtIndex:i withObjectAtIndex:((arrayR.count - 1) - i)];
    }
    return arrayR;
}

-(NSString *)stringInBasicLeetFromString:(NSString *)stringBasic{
    
    /*"a" to "4",
     "s" to "5",
     "i" to "1",
     "l" to "1",
     "e" to "3", and
     "t" to "7".
     */
    
    NSString * a = @"a s i l e t";
    NSString * n = @"4 5 1 1 3 7";
    
    NSArray * ac = [ a componentsSeparatedByString:@" "];
    NSArray * nc = [ n componentsSeparatedByString:@" "];
	    
    for ( int i = 0 ; i < nc.count ; i++) {
    stringBasic = [stringBasic stringByReplacingOccurrencesOfString:ac[i] withString:nc[i]];
    }
    
    NSLog(@"leet a = %@ leet nc = %@ LeetString = %@ ", ac, nc , stringBasic );
    
    return stringBasic ;

}
-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)arraySplit{
    
    NSMutableArray * pos = [[NSMutableArray alloc] init];
    NSMutableArray * neg = [[NSMutableArray alloc] init];
    NSMutableArray * splited = [[NSMutableArray alloc] init];
    
    for ( int i = 0 ; i < arraySplit.count ; i++ ){
        
        int x = (int)[arraySplit[i] integerValue];
        if ( x >= 0 ){
            [pos addObject:[ NSString stringWithFormat: @"%i",x ]];
        } else {
            [neg addObject:[ NSString stringWithFormat:@"%i",x]];
        }
    }
    
     [splited addObject:neg];
     [splited addObject:pos];
     NSLog(@" splited = %@", splited);
    
    return splited;

}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)nameD{

    /*
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
     */
    
    //NSOrderedSet * nameSet = [NSOrderedSet orderedSetWithArray:[nameD allValues]];
    
    return [nameD allKeysForObject:@"hobbit"];

 
}
-(NSArray *)stringsBeginningWithAInArray:(NSArray *)arrayB{
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF LIKE[cd] 'a*'"];
    return [arrayB filteredArrayUsingPredicate:predicate];

}

-(NSInteger)sumOfIntegersInArray:(NSArray *)array{
    
    NSInteger sum = 0 ;
    for ( NSInteger i = 0 ; i < array.count ; i++){
        sum = sum + [array[i] integerValue];
    }
    
    return sum ;

}
-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array{
    
    /*
     singulars = @[ @"hand"   ,
     @"foot"   ,
     @"knee"   ,
     @"table"  ,
     @"box"    ,
     @"ox"     ,
     @"axle"   ,
     @"radius" ,
     @"trivium"];
     
     plurals = @[ @"hands" ,
     @"feet"  ,
     @"knees" ,
     @"tables",
     @"boxes" ,
     @"oxen"  ,
     @"axles" ,
     @"radii" ,
     @"trivia"];
     */
    
    NSMutableDictionary * nameD = [[NSMutableDictionary alloc] initWithObjects:array forKeys:array];
    
    NSPredicate * predicateU = [ NSPredicate predicateWithFormat:@"SELF LIKE '*diu?'"];
    NSArray * arrayP = [ array filteredArrayUsingPredicate:predicateU];
    

    NSMutableArray * names = [[NSMutableArray alloc] init];
    
    for ( NSString * uString in arrayP){
        
        NSString * tobeReplaced;
        NSInteger index;
        
        if ([uString isEqualToString:[nameD objectForKey:uString]]) {
            
            tobeReplaced = [uString stringByReplacingOccurrencesOfString:@"us" withString:@"i"];
            index = [[nameD allValues] indexOfObject:uString];
            names = [[nameD allValues] mutableCopy];
            [names replaceObjectAtIndex:index withObject:tobeReplaced];
            NSLog(@"to be replaced = %@, plurs%@" , tobeReplaced, names);
        }
    }
    
    
    NSPredicate * predicateUI = [ NSPredicate predicateWithFormat:@"SELF LIKE '*viu?'"];
    NSArray * arrayUI = [ array filteredArrayUsingPredicate:predicateUI];

    
    for ( NSString * uString in arrayUI){
        
        NSString * tobeReplaced;
        NSInteger index;
        
        if ([uString isEqualToString:[nameD objectForKey:uString]]) {
            
            tobeReplaced = [uString stringByReplacingOccurrencesOfString:@"um" withString:@"a"];
            index = [[nameD allValues] indexOfObject:uString];
            //names = [[nameD allValues] mutableCopy];
            [names replaceObjectAtIndex:index withObject:tobeReplaced];
            NSLog(@"to be replaced = %@, plurs%@" , tobeReplaced, names);
        }
    }
    
    return names;

}
-(NSDictionary *)countsOfWordsInString:(NSString *)string{
    
    NSCharacterSet * removePun = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    NSString * readyS = [[string componentsSeparatedByCharactersInSet:removePun] componentsJoinedByString:@","];
    NSArray * uniquWords = [readyS componentsSeparatedByString:@","];
    NSOrderedSet * nameSet = [NSOrderedSet orderedSetWithArray:uniquWords];
    NSArray * uniqeSting = [nameSet array];
    
    NSMutableDictionary * diction = [[NSMutableDictionary alloc] init];
    
    for (NSString * countWord in uniqeSting){
        NSInteger times = [[string componentsSeparatedByString:countWord] count] - 1;
        [diction setObject: [NSString stringWithFormat:@"%ld", (long)times] forKey:countWord];
    }
    
    [diction removeObjectForKey:@""];
    NSLog(@" diction %@", diction);

    
    return diction;

}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array{
    /*
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
     */
    
    NSMutableArray * artist = [[NSMutableArray alloc] init];
    NSMutableArray * song = [[NSMutableArray alloc] init];
    NSMutableDictionary * list = [[NSMutableDictionary alloc] init];

    for (NSInteger i = 0 ; i < array.count ; i++){
        
        NSString * eachEntry = array[i];
        NSArray * songArtist = [eachEntry componentsSeparatedByString:@"-"];

        if ([artist containsObject: songArtist[0]]) {
            
            NSMutableString * test = [[list objectForKey: songArtist[0]] mutableCopy];
            [test appendString: [NSString stringWithFormat:@", %@", songArtist[1]]];
            [list setObject: test forKey:songArtist[0]];
            
        } else {
            [artist addObject:songArtist[0]];
            [song addObject:songArtist[1]];
            [list setObject:songArtist[1] forKey:songArtist[0]];

        }
    }
    [[list allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    NSLog(@"artist = %@ - song = %@ list = %@",artist,song,list);
    return list;
 }

@end


