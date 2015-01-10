//
//  SecondViewController.m
//  Set Manager
//
//  Created by Adam Socik on 11/18/14.
//  Copyright (c) 2014 Adam Socik. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) SetManager *manager;

@end

@implementation SecondViewController

- (IBAction)printSetA:(id)sender {
    self.textView.text = @"";   // Clear previous content
    
    NSString *set = @"Set A:\n";
    for (int i=0; i<self.manager.sizeOfA; i++) {
        NSString *row = [NSString stringWithFormat:@"%d\n", [_manager valueAtIndexA:i]];
        set = [set stringByAppendingString:row];
    }
    
    self.textView.text = set;
}

- (IBAction)printSetB:(id)sender {
    [self.manager switchAB];
    self.textView.text = @"";   // Clear previous content
    
    NSString *set = @"Set B:\n";
    for (int i=0; i<self.manager.sizeOfA; i++) {
        NSString *row = [NSString stringWithFormat:@"%d\n", [_manager valueAtIndexA:i]];
        set = [set stringByAppendingString:row];
    }
    
    self.textView.text = set;
    [self.manager switchAB];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.manager = _sharedManager;
    
    // Print Set A by default
    self.textView.text = @"";   // Clear previous content
    
    NSString *set = @"Set A:\n";
    for (int i=0; i<self.manager.sizeOfA; i++) {
        NSString *row = [NSString stringWithFormat:@"%d\n", [_manager valueAtIndexA:i]];
        set = [set stringByAppendingString:row];
    }
    
    self.textView.text = set;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     FirstViewController *FirstViewController = [segue destinationViewController];
    FirstViewController.sharedSetManager = self.sharedManager;
}

@end
