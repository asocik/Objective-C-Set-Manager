//
//  LinkedListNode.m
//  Set Manager - Command Line
//
//  Created by Adam Socik on 11/11/14.
//  Copyright (c) 2014 Adam Socik. All rights reserved.
//

#import "LinkedListNode.h"

@implementation LinkedListNode

- (id)initNode: (int) val next: (LinkedListNode*) nextNode
{
    self = [super init];
    if (self) {
        nodeval = val;
        next = nextNode;
    }
    return self;
}

- (int) nodeval {
    return nodeval;
}

- (LinkedListNode *) next {
    return next;
}

- (void) setNext: (LinkedListNode *) nextNode {
    next = nextNode;
}

@end
