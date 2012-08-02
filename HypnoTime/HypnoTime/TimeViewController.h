//
//  TimeViewController.h
//  HypnoTime
//
//  Created by Andrew Stevens on 25/07/12.
//  Copyright (c) 2012 DarksideSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController
{
    IBOutlet UILabel *timeLabel;
}

-(IBAction)showCurrentTime:(id)sender;

-(void)spinTimeLabel;

-(void)bounceTimeLabel;

@end
