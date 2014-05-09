//
//  NaranjaView.m
//  Media Naranja
//
//  Created by Daniel Sánchez Seijo on 21/03/14.
//  Copyright (c) 2014 g102 DIT UPM. All rights reserved.
//

#import "NaranjaView.h"

@implementation NaranjaView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self dibujaNaranja];
    [self dibujaRectPerc];
}

- (void)dibujaNaranja {
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    if (width <= height) {
        [[UIImage imageNamed:@"naranja.png"] drawInRect:CGRectMake(0, (height-width)/2, width, width)];
    
    } else {
        [[UIImage imageNamed:@"naranja.png"] drawInRect:CGRectMake((width-height)/2, 0, height, height)];
    }
}

- (void)dibujaRectPerc {
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGRect rect;
    if (width <= height) {
        rect = CGRectMake(0, 0, width, height*(1-self.percentage));
    } else {
        rect = CGRectMake(0, 0, width, height*(1-self.percentage));
    }
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:rect];
    [[UIColor whiteColor] setFill];
    [path fill];
}

@end
