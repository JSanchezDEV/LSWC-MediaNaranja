//
//  BirthDateViewController.m
//  Media Naranja
//
//  Created by Android Manifest on 20/03/14.
//  Copyright (c) 2014 g102 DIT UPM. All rights reserved.
//

#import "BirthDateViewController.h"

@interface BirthDateViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *birthDatePicker;
@end

@implementation BirthDateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.birthDatePicker.date = self.birthDate;
    if (self.firstDate) {
        [self.birthDatePicker setMaximumDate:self.firstDate];
    } else if (self.deathDate) {
        [self.birthDatePicker setMaximumDate:self.deathDate];
    } else {
        [self.birthDatePicker setMaximumDate:[NSDate date]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Birth OK"]) {
        self.birthDate = self.birthDatePicker.date;
    }
}

@end
