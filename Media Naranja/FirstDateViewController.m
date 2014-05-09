//
//  FirstDateViewController.m
//  Media Naranja
//
//  Created by Android Manifest on 20/03/14.
//  Copyright (c) 2014 g102 DIT UPM. All rights reserved.
//

#import "FirstDateViewController.h"

@interface FirstDateViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *firstDatePicker;
@end

@implementation FirstDateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.firstDatePicker.date = self.firstDate;
    if (self.birthDate) {
        [self.firstDatePicker setMinimumDate:self.birthDate];
    }
    if (self.deathDate) {
        NSDate * earlier = [self.deathDate earlierDate:[NSDate date]];
        [self.firstDatePicker setMaximumDate:earlier];
    } else {
        [self.firstDatePicker setMaximumDate:[NSDate date]];
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
    if ([segue.identifier isEqualToString:@"First OK"]) {
        self.firstDate = self.firstDatePicker.date;
    }
}


@end
