//
//  LinkedListNode.h
//  Set Manager - Command Line
//
//  Created by Adam Socik on 11/11/14.
//  Copyright (c) 2014 Adam Socik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedListNode : NSObject
{
    int nodeval;
    LinkedListNode *next;
}

- (int) nodeval;
- (LinkedListNode *) next;
- (id)initNode: (int) val next: (LinkedListNode*) nextNode;
- (void) setNext: (LinkedListNode *) nextNode;

@end
