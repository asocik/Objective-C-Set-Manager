//
//  FirstViewController.h
//  Set Manager
//
//  Created by Adam Socik on 11/18/14.
//  Copyright (c) 2014 Adam Socik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetManager.h"

@interface FirstViewController : UIViewController
@property (strong, nonatomic) SetManager *sharedSetManager;

@end

