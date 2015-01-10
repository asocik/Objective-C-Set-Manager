//
//  ListSetManager.m
//  Set Manager - Command Line
//
//  Created by Adam Socik on 11/11/14.
//  Copyright (c) 2014 Adam Socik. All rights reserved.
//

#import "ListSetManager.h"

@implementation ListSetManager

/*----------------------------------------------------------------------------
 Initializes both sets to empty linked lists
 ----------------------------------------------------------------------------*/
-(id)initListManager {
    self = [super init];
    if (self) {
        setA = nil;
        setB = nil;
    }
    return self;
}

/*----------------------------------------------------------------------------
 Removes all elements from set A
 ----------------------------------------------------------------------------*/
-(void) clearA {
    setA = nil;     // ARC in Objective-C will do the clean up
}

/*----------------------------------------------------------------------------
 Performs a deep copy of set A to set B (previous content of set B is lost)
 ----------------------------------------------------------------------------*/
-(void) saveAintoB {
    setB = nil;
    
    LinkedListNode *p;
    for(p = setA; p != nil; p = [p next])
        [self addElementToB:[p nodeval]];
}

/*----------------------------------------------------------------------------
 Adds the element to set A if it is not already there
 ----------------------------------------------------------------------------*/
-(int) addElementToA: (int) element {
    
    // Empty list
    if (setA == nil) {
        setA = [[LinkedListNode alloc] initNode: element next: nil];
        return element;
    }
    
    // If element is in list the return
    if ([self indexOfA:element] != -1)
        return -1;
    
    // Add to the end of the list
    LinkedListNode *newnode = [[LinkedListNode alloc] initNode: element next: nil];
    
    LinkedListNode *p1;
    LinkedListNode *p2;
    for(p1 = setA; p1 != nil; p1 = [p1 next]) {
        p2 = p1;
    }
    
    [p2 setNext:newnode];
    return element;
}

/*----------------------------------------------------------------------------
 Adds the element to set B
 ----------------------------------------------------------------------------*/
-(void) addElementToB: (int) element {
    
    // Empty list
    if (setB == nil) {
        setB = [[LinkedListNode alloc] initNode: element next: nil];
        return;
    }
    
    // Add to the end of the list
    LinkedListNode *newnode = [[LinkedListNode alloc] initNode: element next: nil];
    
    LinkedListNode *p1;
    LinkedListNode *p2;
    for(p1 = setB; p1 != nil; p1 = [p1 next]) {
        p2 = p1;
    }
    
    [p2 setNext:newnode];
}

/*----------------------------------------------------------------------------
 Removes the specified element in A if it is found
 ----------------------------------------------------------------------------*/
-(int) removeElementFromA: (int) element {
    
    // If the set is empty
    if (setA == nil)
        return -1;
    
    LinkedListNode *current;
    LinkedListNode *previous = nil;
    for(current = setA; current != nil; previous = current, current = [current next]) {

        // Found the element
        if ([current nodeval] == element) {
            // If the element at the front of the list is being removed
            if (previous == nil) {
                setA = [current next];
            }
            else {
                [previous setNext:[current next]];
            }
     
            return element;
        }
    }
    return -1;
}

/*----------------------------------------------------------------------------
 Returns the size of set A
 ----------------------------------------------------------------------------*/
-(int) sizeOfA {
    LinkedListNode *p;
    int size = 0;
    for(p = setA; p != nil; p = [p next])
        size++;
    return size;
}

/*----------------------------------------------------------------------------
 Finds the index of the element in set A
 ----------------------------------------------------------------------------*/
-(int) indexOfA:(int)element {
    
    LinkedListNode *p;
    int i = 0;
    for(p = setA; p != nil; p = [p next]) {
        if ([p nodeval] == element)
            return i;
        i++;
    }
    return -1;
}

/*----------------------------------------------------------------------------
 Finds the value at the given index in setB
 ----------------------------------------------------------------------------*/
-(int) valueAtIndexB:(int)index {
    LinkedListNode *p;
    int i = 0;
    for(p = setB; p != nil; p = [p next], i++) {
        if (i == index)
            return [p nodeval];
    }
    return -1;
}

/*----------------------------------------------------------------------------
 Finds the value at the given index in setA
 ----------------------------------------------------------------------------*/
-(int) valueAtIndexA:(int)index {
    LinkedListNode *p;
    int i = 0;
    for(p = setA; p != nil; p = [p next], i++) {
        if (i == index)
            return [p nodeval];
    }
    return -1;
}

/*----------------------------------------------------------------------------
 Prints set A
 ----------------------------------------------------------------------------*/
-(void) printA {
    NSLog(@"\n\nSet A:\n");
    LinkedListNode *p;
    for(p = setA; p != nil; p = [p next])
        NSLog(@"%d\n", [p nodeval]);
    NSLog(@"\n\n");
}

/*----------------------------------------------------------------------------
 Prints set B
 ----------------------------------------------------------------------------*/
-(void) printB {
    NSLog(@"\n\nSet B:\n");
    LinkedListNode *p;
    for(p = setB; p != nil; p = [p next])
        NSLog(@"%d\n", [p nodeval]);
    NSLog(@"\n\n");
}

@end
