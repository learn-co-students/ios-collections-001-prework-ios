# Collections Practice

## Objectives

1. Sort an array.
2. Reverse an array.
3. Change characters in a string.
4. Split an array.
5. Filter the values in a dictionary.
6. Filter an array.
7. Alter mulitple substrings according to certain conditions.
8. Alter strings in an array according to certain conditions.
9. Collect data on a string's contents into a dictionary ignoring punctation and case.
10. Convert information in strings into a nested collection.

## Introduction

The goal of this lab is to give you practice manipulating collections in different ways that you have read about in this unit. You'll need to use loops, filters, and sort descriptors in specific ways to accomplish a task. Reference the Apple documentation to look for built-in methods on the various collection classes that can help you.

## Instructions

Navigate to the `FISAppDelegate.h` header file. Declare each of these methods, and define them to return `nil` in the `FISAppDelegate.m` implementation file. Run the tests and see that most of them fail.

1. `arrayByAscendingSortingArray:` that takes one `NSArray` argument and returns and `NSArray`.
2. `arrayByDescendingSortingArray:` that takes one `NSArray` argument and returns an `NSArray`.
3. `arrayBySwappingFirstObjectWithLastObjectInArray:` that takes one `NSArray` argument and returns an `NSArray`.
4. `arrayByReversingArray:` that takes one `NSArray` argument and returns an `NSArray`.
5. `stringInBasicLeetFromString:` that takes one `NSString` argument and returns an `NSString`.
6. `bisectArrayAt0:` that takes one `NSArray` argument and returns an `NSArray`.
7. `arrayByFilteringHobbitsFromDictionary:` that takes one `NSDictionary` argument and returns an `NSArray`.
8. `arrayByFilteringStringsBeginningWithA:` that takes one `NSArray` argument and returns an `NSArray`.
9. `sumOfIntegerNumbersInArray:` that takes one `NSArray` argument and returns an `NSInteger`.
10. `arrayByPluralizingStringsInArray:` that takes one `NSArray` argument and returns an `NSArray`.
11. `countsOfWordsInString:` that takes one `NSString` argument and returns an `NSDictionary`.
12. `dictionaryOfSongsByArtistFromArray:` that takes one `NSArray` argument and returns an `NSDictionary`.

Now, write out the method bodies for each method one by one. Run the tests each time you finish a method to check your work. Reference each of the tests to know what they're expecting. Avoid hardcoding the answers to pass the tests directly - the tests are just providing sample data for your methods to handle.

1. `arrayByAscendingSortingArray:` should return the objects in the submitted array arranged from low to high.

2. `arrayByDescendingSortingArray:` should return the objects in the submitted array arranged from high to low.

3. `arrayBySwappingFirstObjectWithLastObjectInArray:` should return an array that's like the submitted array, but with first and last objects switched with each other.

4. `arrayByReversingArray:` should return an array that is the reverse of the submitted array. **Hint:** *Try swapping objects moving in from the beginning and the end.*

5. `stringInBasicLeetFromString:` should convert the following substrings in the submitted string: 
  * "a" to "4", 
  * "s" to "5", 
  * "i" to "1", 
  * "l" to "1", 
  * "e" to "3", and 
  * "t" to "7".  
  **Note:** *It's impractical to make a truly comprehensive leet translator since it's so fluid in its typesetting conventions in slang.* [*Introduction to leet.*][how_to_read_leet]

6. `bisectArrayAt0:` should return an array with two sub-arrays, the first with all the negative numbers in the argument array, and the second with all the positive numbers.

7. `arrayByFilteringHobbitsFromDictionary:` should return a filtered array containing the four dictionary keys (character names) which hold the value "hobbit".

8. `arrayByFilteringStringsBeginningWithA:` should return a filtered array containing the strings that begin with the letter "a".

9. `sumOfIntegerNumbersInArray:` should add together all of the numbers in the submitted array and return the sum.

10. `arrayByPluralizingStringsInArray:` should convert the different strings into their correct plural forms. This more complex than just adding an "s"; you'll have to run checks on the strings so be sure look at the test arrays so that you know the expected plural forms.

11. `countsOfWordsInString:` should return a dictionary that has a key for each word in the submitted string (`moby` in the test file), whose associated value is the count of how many times that word appears in the argument string. Be sure to remove the punctuation (`.``,``-``;`) and ignore capitalization. *The content of this test is from the opening paragraph of Herman Melville's "[Moby Dick][moby_dick]".*

12. `dictionaryOfSongsByArtistFromArray:` should return a nested combination that is a dictionary containing a key for each artist, whose value is an array of strings containing their song names. You'll have to split each string and arrange its information into the correct place in the nested combination. *Be sure to alphabetize the arrays of songs before returning the dictionary. If you're using mutable arrays inside the dictionary, you can use the* `sortUsingDescriptors:` *method.*


[how_to_read_leet]: http://www.wikihow.com/Read-and-Write-in-1337
[moby_dick]: http://www.online-literature.com/melville/mobydick/2/