//
//  SetManager.m
//  Set Manager - Command Line
//
//  Created by Adam Socik on 11/11/14.
//  Copyright (c) 2014 Adam Socik. All rights reserved.
//

#import "SetManager.h"

@implementation SetManager

/*----------------------------------------------------------------------------
 Swaps set A and set B
 ----------------------------------------------------------------------------*/
-(void) switchAB {
    id temp = setA;
    setA = setB;
    setB = temp;
}

/*----------------------------------------------------------------------------
 Checks if the element is a member of set A
 ----------------------------------------------------------------------------*/
-(BOOL) memberOfA: (int) element {
    return [self indexOfA:element] == -1 ? false : true;
}

/*----------------------------------------------------------------------------
 Set union of sets A and B. The result is stored as set A. The previous
 content of A is lost. B is not modified by this operation.
 ----------------------------------------------------------------------------*/
-(void) AUnionB {
    [self switchAB];
    int sizeOfSetB = [self sizeOfA];
    [self switchAB];
    
    // This will add any element from set B not already in set A
    for (int i=0; i < sizeOfSetB; i++)
        [self addElementToA: [self valueAtIndexB: i]];
}

-(void) clearA {
    // Deferred to subclass
}

-(void) saveAintoB {
    // Deferred to subclass
}

-(int) addElementToA: (int) element {
    // Deferred to subclass
    return -1;
}

-(void) removeElementFromA: (int) element {
    // Deferred to subclass
}

-(int) sizeOfA {
    // Deferred to subclass
    return 0;
}

-(int) indexOfA:(int)element {
    // Deferred to subclass
    return 0;
}

-(int) valueAtIndexA:(int)index {
    // Deferred to subclass
    return 0;
}

-(int) valueAtIndexB:(int)index {
    // Deferred to subclass
    return 0;
}

-(void)printA {
    // Deferred to subclass
}

-(void)printB {
    // Deferred to subclass
}

@end
