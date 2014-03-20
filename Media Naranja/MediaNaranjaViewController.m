//
//  MediaNaranjaViewController.m
//  Media Naranja
//
//  Created by g102 DIT UPM on 20/03/14.
//  Copyright (c) 2014 g102 DIT UPM. All rights reserved.
//

#import "MediaNaranjaViewController.h"
#import "BirthDateViewController.h"

@interface MediaNaranjaViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation MediaNaranjaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}

- (IBAction)BirthOK:(UIStoryboardSegue*)segue {
    BirthDateViewController *chooseDateVC = segue.sourceViewController;
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];
    self.dateLabel.text = [format stringFromDate:chooseDateVC.birthDate];
}

- (IBAction)BirthCancel:(UIStoryboardSegue*)segue {
    
}

@end
