//
//  FirstViewController.m
//  Set Manager
//
//  Created by Adam Socik on 11/18/14.
//  Copyright (c) 2014 Adam Socik. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "SetManager.h"
#import "OCSetManager.h"
#import "ListSetManager.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation FirstViewController
{
    SetManager *manager;
    int element;
    bool haveBeenInitialized;
}

- (IBAction)initList:(id)sender {
    manager = [[ListSetManager alloc] initListManager];
    haveBeenInitialized = true;
    [self.infoLabel setText:@"List initialized"];
}

- (IBAction)initOrderedCollection:(id)sender {
    manager = [[OCSetManager alloc] initOCManager];
    haveBeenInitialized = true;
    [self.infoLabel setText:@"Ordered Collection Initialized"];

}

// Converts input in text box and checks to see if input is a valid integer
// Value is stored in class variable
- (BOOL) validInput
{
    NSString *input = self.inputTextField.text;
    element = [input intValue];
    
    // Make sure that zero was inputted
    if (element == 0 && ![input isEqualToString:@"0"]) {
        [self.infoLabel setText:@"Enter a valid integer"];
        return false;
    }
    
    self.inputTextField.text = @"";     // Clear out the text field
    return true;
}

- (IBAction)addToA:(id)sender {
    if (!haveBeenInitialized) {
        [self.infoLabel setText:@"You must initialize a set first"];
        return;
    }
    
    if (![self validInput])
        return;
    
    int result = [manager addElementToA:element];
    NSString *message;
    if (result == -1)
        message = [NSString stringWithFormat:@"%d is already a member of set A", element];
    else
        message = [NSString stringWithFormat:@"%d added to set A", element];
    [self.infoLabel setText:message];
}

- (IBAction)removeFromA:(id)sender {
    if (!haveBeenInitialized) {
        [self.infoLabel setText:@"You must initialize a set first"];
        return;
    }
    
    if (![self validInput])
        return;
    
    int result = [manager removeElementFromA:element];
    NSString *message;
    if (result == -1)
        message = [NSString stringWithFormat:@"%d is a not member of set A", element];
    else
        message = [NSString stringWithFormat:@"%d removed from set A", element];
    [self.infoLabel setText:message];
}

- (IBAction)memberOfA:(id)sender {
    if (!haveBeenInitialized) {
        [self.infoLabel setText:@"You must initialize a set first"];
        return;
    }
    
    if (![self validInput])
        return;
    
    bool member = [manager memberOfA:element];
    NSString *message;
    
    if (member)
        message = [NSString stringWithFormat:@"%d is a member of set A", element];
    else
        message = [NSString stringWithFormat:@"%d is not a member of set A", element];
    [self.infoLabel setText:message];
}

- (IBAction)indexOf:(id)sender {
    if (!haveBeenInitialized) {
        [self.infoLabel setText:@"You must initialize a set first"];
        return;
    }
    
    if (![self validInput])
        return;
    
    int index = [manager indexOfA:element];
    NSString *message;
    
    if (index == -1)
        message = [NSString stringWithFormat:@"%d is not a member of set A", element];
    else
        message = [NSString stringWithFormat:@"%d is at index %d", element, index];
    
    [self.infoLabel setText:message];
}

- (IBAction)AUnionB:(id)sender {
    if (!haveBeenInitialized) {
        [self.infoLabel setText:@"You must initialize a set first"];
        return;
    }
    
    [manager AUnionB];
    [self.infoLabel setText:@"A unioned with B"];
}

- (IBAction)clearA:(id)sender {
    if (!haveBeenInitialized) {
        [self.infoLabel setText:@"You must initialize a set first"];
        return;
    }
    
    [manager clearA];
    [self.infoLabel setText:@"Set A cleared"];
}

- (IBAction)saveAIntoB:(id)sender {
    if (!haveBeenInitialized) {
        [self.infoLabel setText:@"You must initialize a set first"];
        return;
    }
    
    [manager saveAintoB];
    [self.infoLabel setText:@"Set A saved into Set B"];
}

- (IBAction)sizeOfA:(id)sender {
    if (!haveBeenInitialized) {
        [self.infoLabel setText:@"You must initialize a set first"];
        return;
    }
    
    int size = [manager sizeOfA];
    NSString *message = [NSString stringWithFormat:@"Size of Set A is %d", size];
    [self.infoLabel setText:message];
}

- (IBAction)switchAandB:(id)sender {
    if (!haveBeenInitialized) {
        [self.infoLabel setText:@"You must initialize a set first"];
        return;
    }
    
    [manager switchAB];
    [self.infoLabel setText:@"Sets A and B were switched"];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    haveBeenInitialized = false;
    manager = self.sharedSetManager;
    
    // If there is a pre-existing set
    if (manager != nil)
        haveBeenInitialized = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SecondViewController *secondViewController = [segue destinationViewController];
    secondViewController.sharedManager = manager;
}

@end
