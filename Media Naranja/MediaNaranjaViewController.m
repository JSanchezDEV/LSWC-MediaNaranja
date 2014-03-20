//
//  MediaNaranjaViewController.m
//  Media Naranja
//
//  Created by g102 DIT UPM on 20/03/14.
//  Copyright (c) 2014 g102 DIT UPM. All rights reserved.
//

#import "MediaNaranjaViewController.h"
#import "BirthDateViewController.h"
#import "FirstDateViewController.h"
#import "DeathDateViewController.h"

@interface MediaNaranjaViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) NSDate* fillBirthDate;
@property (strong, nonatomic) NSDate* fillFirstDate;
@property (strong, nonatomic) NSDate* fillDeathDate;
@property (weak, nonatomic) IBOutlet UILabel *birthDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *deathDateLabel;

@end

@implementation MediaNaranjaViewController

- (NSDate*) fillBirthDate{
    if(!_fillBirthDate) _fillBirthDate = [[NSDate alloc] init];
    return _fillBirthDate;
}

- (NSDate*) fillFirstDate{
    if(!_fillFirstDate) _fillFirstDate = [[NSDate alloc] init];
    return _fillFirstDate;
}

- (NSDate*) fillDeathDate{
    if(!_fillDeathDate) _fillDeathDate = [[NSDate alloc] init];
    return _fillDeathDate;
}


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
    if([segue.identifier isEqualToString:@"Select BirthDate"]){
        BirthDateViewController *chooseDateVC = segue.destinationViewController;
        chooseDateVC.birthDate = self.fillBirthDate;
    } else if([segue.identifier isEqualToString:@"Select FirstDate"]){
        FirstDateViewController *chooseDateVC = segue.destinationViewController;
        chooseDateVC.firstDate = self.fillFirstDate;
    } else if([segue.identifier isEqualToString:@"Select DeathDate"]){
        DeathDateViewController *chooseDateVC = segue.destinationViewController;
        chooseDateVC.deathDate = self.fillDeathDate;
    }
}

- (IBAction)BirthOK:(UIStoryboardSegue*)segue {
    BirthDateViewController *chooseDateVC = segue.sourceViewController;
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];
    self.fillBirthDate = chooseDateVC.birthDate;
    self.birthDateLabel.text = [format stringFromDate:self.fillBirthDate];
}

- (IBAction)BirthCancel:(UIStoryboardSegue*)segue {}


- (IBAction)FirstOK:(UIStoryboardSegue*)segue {
    FirstDateViewController *chooseDateVC = segue.sourceViewController;
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];
    self.fillFirstDate = chooseDateVC.firstDate;
    self.firstDateLabel.text = [format stringFromDate:self.fillFirstDate];
}

- (IBAction)FirstCancel:(UIStoryboardSegue*)segue {}

- (IBAction)DeathOK:(UIStoryboardSegue*)segue {
    DeathDateViewController *chooseDateVC = segue.sourceViewController;
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];
    self.fillDeathDate = chooseDateVC.deathDate;
    self.deathDateLabel.text = [format stringFromDate:self.fillDeathDate];
}

- (IBAction)DeathCancel:(UIStoryboardSegue*)segue {}

@end

