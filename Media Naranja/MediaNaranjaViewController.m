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
#import "NaranjaView.h"

@interface MediaNaranjaViewController ()
@property (strong, nonatomic) NSDate* fillBirthDate;
@property (strong, nonatomic) NSDate* fillFirstDate;
@property (strong, nonatomic) NSDate* fillDeathDate;
@property (weak, nonatomic) IBOutlet UILabel *birthDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *deathDateLabel;
@property (nonatomic) BOOL birthOKBool;
@property (nonatomic) BOOL firstOKBool;
@property (nonatomic) BOOL deathOKBool;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet NaranjaView *portraitView;
@property (weak, nonatomic) IBOutlet NaranjaView *landscapeView;
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
    self.birthOKBool = NO;
    self.firstOKBool = NO;
    self.deathOKBool = NO;
    [self.portraitView setHidden:NO];
    [self.landscapeView setHidden:YES];
    [self refrescaImagen];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self refrescaImagen];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    if (fromInterfaceOrientation == 3 || fromInterfaceOrientation == 4) {
        [self.portraitView setHidden:NO];
        [self.landscapeView setHidden:YES];
    } else if (fromInterfaceOrientation == 1) {
        [self.portraitView setHidden:YES];
        [self.landscapeView setHidden:NO];
    }
    [self refrescaImagen];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"Select BirthDate"]){
        BirthDateViewController *chooseDateVC = segue.destinationViewController;
        chooseDateVC.birthDate = self.fillBirthDate;
        if (self.firstOKBool) {
            chooseDateVC.firstDate = self.fillFirstDate;
        }
        if (self.deathOKBool) {
            chooseDateVC.deathDate = self.fillDeathDate;
        }
    } else if([segue.identifier isEqualToString:@"Select FirstDate"]){
        FirstDateViewController *chooseDateVC = segue.destinationViewController;
        if (self.birthOKBool) {
            chooseDateVC.birthDate = self.fillBirthDate;
        }
        chooseDateVC.firstDate = self.fillFirstDate;
        if (self.deathOKBool) {
            chooseDateVC.deathDate = self.fillDeathDate;
        }
    } else if([segue.identifier isEqualToString:@"Select DeathDate"]){
        DeathDateViewController *chooseDateVC = segue.destinationViewController;
        if (self.birthOKBool) {
            chooseDateVC.birthDate = self.fillBirthDate;
        }
        if (self.firstOKBool) {
            chooseDateVC.firstDate = self.fillFirstDate;
        }
        chooseDateVC.deathDate = self.fillDeathDate;
    }
}

- (IBAction)BirthOK:(UIStoryboardSegue*)segue {
    BirthDateViewController *chooseDateVC = segue.sourceViewController;
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];
    self.fillBirthDate = chooseDateVC.birthDate;
    self.birthDateLabel.text = [format stringFromDate:self.fillBirthDate];
    self.birthOKBool = YES;
    [self calcResult];
    [self refrescaImagen];
}

- (IBAction)BirthCancel:(UIStoryboardSegue*)segue {
    [self refrescaImagen];
}


- (IBAction)FirstOK:(UIStoryboardSegue*)segue {
    FirstDateViewController *chooseDateVC = segue.sourceViewController;
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];
    self.fillFirstDate = chooseDateVC.firstDate;
    self.firstDateLabel.text = [format stringFromDate:self.fillFirstDate];
    self.firstOKBool = YES;
    [self calcResult];
    [self refrescaImagen];
}

- (IBAction)FirstCancel:(UIStoryboardSegue*)segue {
    [self refrescaImagen];
}

- (IBAction)DeathOK:(UIStoryboardSegue*)segue {
    DeathDateViewController *chooseDateVC = segue.sourceViewController;
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];
    self.fillDeathDate = chooseDateVC.deathDate;
    self.deathDateLabel.text = [format stringFromDate:self.fillDeathDate];
    self.deathOKBool = YES;
    [self calcResult];
    [self refrescaImagen];
}

- (IBAction)DeathCancel:(UIStoryboardSegue*)segue {
    [self refrescaImagen];
}

- (void)calcResult {
    float birth2death;
    float first2death;
    float percentage;
    if (self.birthOKBool && self.firstOKBool && self.deathOKBool) {
        first2death = roundf([self.fillDeathDate timeIntervalSinceDate:self.fillFirstDate]/3600/24);
        birth2death = roundf([self.fillDeathDate timeIntervalSinceDate:self.fillBirthDate]/3600/24);
        if (birth2death ==0) {
            percentage = 1;
        } else {
            percentage = (first2death / birth2death);
        }
        self.portraitView.percentage = percentage;
        self.landscapeView.percentage = percentage;
        self.resultLabel.text = [NSString stringWithFormat:@"%2.2f %%", percentage*100];
    }
}

- (void)refrescaImagen {
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if (self.birthOKBool && self.firstOKBool && self.deathOKBool) {
        if (orientation == 3 || orientation == 4) {
            [self.landscapeView setNeedsDisplay];
        } else if (orientation == 1) {
            [self.portraitView setNeedsDisplay];
        }
    }
}

@end

