//
//  OCSetManager.h
//  Set Manager - Command Line
//
//  Created by Adam Socik on 11/11/14.
//  Copyright (c) 2014 Adam Socik. All rights reserved.
//

#import "SetManager.h"

@interface OCSetManager : SetManager

-(id) initOCManager;
-(void) clearA;
-(void) saveAintoB;
-(int) addElementToA: (int) element;
-(int) removeElementFromA: (int) element;
-(int) sizeOfA;
-(int) indexOfA:(int)element;
-(int) valueAtIndexB:(int)index;
-(int) valueAtIndexA:(int)index;

@end
