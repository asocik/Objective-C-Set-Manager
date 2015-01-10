//
//  SetManager.h
//  Set Manager - Command Line
//
//  Created by Adam Socik on 11/11/14.
//  Copyright (c) 2014 Adam Socik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SetManager : NSObject
{
    id setA;
    id setB;
}

-(void) clearA;
-(void) switchAB;
-(void) saveAintoB;
-(int) addElementToA: (int) element;
-(int) removeElementFromA: (int) element;
-(int) sizeOfA;
-(int) indexOfA: (int) element;
-(BOOL) memberOfA: (int) element;
-(void) AUnionB;
-(void) printA;
-(void) printB;
-(int) valueAtIndexB:(int)index;
-(int) valueAtIndexA:(int)index;

@end
