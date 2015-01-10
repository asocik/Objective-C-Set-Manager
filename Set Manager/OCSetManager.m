//
//  OCSetManager.m
//  Set Manager - Command Line
//
//  Created by Adam Socik on 11/11/14.
//  Copyright (c) 2014 Adam Socik. All rights reserved.
//

#import "OCSetManager.h"

@implementation OCSetManager

/*----------------------------------------------------------------------------
 Initializes both sets to empty NSMutable arrays
 ----------------------------------------------------------------------------*/
-(id)initOCManager {
    self = [super init];
    if (self) {
        setA = [NSMutableArray array];
        setB = [NSMutableArray array];
    }
    return self;
}

/*----------------------------------------------------------------------------
 Removes all elements from set A
 ----------------------------------------------------------------------------*/
-(void) clearA {
    [setA removeAllObjects];
}

/*----------------------------------------------------------------------------
 Performs a deep copy of set A to set B (previous content of set B is lost)
 ----------------------------------------------------------------------------*/
-(void) saveAintoB {
    setB = [NSMutableArray array];
    
    for (int i=0; i < [setA count]; i++)
        setB[i] = setA[i];
}

/*----------------------------------------------------------------------------
 Adds the element to set A if it is not already there
 ----------------------------------------------------------------------------*/
-(int) addElementToA: (int) element {
    if ([self indexOfA: element] == -1) {
        [setA addObject:[NSNumber numberWithInt: element]];
        return element;
    }
    return -1;
}

/*----------------------------------------------------------------------------
 Removes the specified element in A if it is found
 ----------------------------------------------------------------------------*/
-(int) removeElementFromA: (int) element {
    if ([self indexOfA:element] == -1)
        return -1;
    [setA removeObject:[NSNumber numberWithInt: element]];
    return element;
}

/*----------------------------------------------------------------------------
 Returns the size of set A
 ----------------------------------------------------------------------------*/
-(int) sizeOfA {
    return (int)[setA count];
}

/*----------------------------------------------------------------------------
 Finds the index of the element in set A
 ----------------------------------------------------------------------------*/
-(int) indexOfA:(int)element {
    return (int) [setA indexOfObject:[NSNumber numberWithInt: element]];
}

/*----------------------------------------------------------------------------
 Finds the value at the given index in set B
 ----------------------------------------------------------------------------*/
-(int) valueAtIndexB:(int)index {
    return (int) [[setB objectAtIndex:index] integerValue];
}

/*----------------------------------------------------------------------------
 Finds the value at the given index in set A
 ----------------------------------------------------------------------------*/
-(int) valueAtIndexA:(int)index {
    return (int) [[setA objectAtIndex:index] integerValue];
}

/*----------------------------------------------------------------------------
 Prints set A
 ----------------------------------------------------------------------------*/
-(void) printA {
    NSLog(@"\n\nSet A:\n%@\n\n", setA);
}

/*----------------------------------------------------------------------------
 Prints set B
 ----------------------------------------------------------------------------*/
-(void) printB {
    NSLog(@"\n\nSet B:\n%@\n\n", setB);
}

@end
