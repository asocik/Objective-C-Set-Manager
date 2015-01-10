//
//  ListSetManager.h
//  Set Manager - Command Line
//
//  Created by Adam Socik on 11/11/14.
//  Copyright (c) 2014 Adam Socik. All rights reserved.
//

#import "SetManager.h"
#import "LinkedListNode.h"

@interface ListSetManager : SetManager

-(id) initListManager;
-(void) clearA;
-(void) saveAintoB;
-(int) addElementToA: (int) element;
-(int) removeElementFromA: (int) element;
-(int) sizeOfA;
-(int) indexOfA:(int)element;
-(int) valueAtIndexA:(int)index;
-(int) valueAtIndexB:(int)index;

@end
