//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Andrew Stevens on 24/07/12.
//  Copyright (c) 2012 DarksideSoftware. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    // Call the supercalss's designated initializer
    self = [super initWithNibName:nil
                           bundle:nil];
    
    if (self) {
        // Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        // Give it a label
        [tbi setTitle:@"Hypnosis"];
        
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        //Put the image on the tab bar item
        [tbi setImage:i];
    }
    
    return self;
}

-(void)loadView
{
    // Create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *v = [[HypnosisView alloc] initWithFrame:frame];
    
    // Set it as *the* view of this view controller
    [self setView:v];
}

@end
