//
//  ViewController.h
//  Blocker
//
//  Created by Andrew Stevens on 8/08/12.
//  Copyright (c) 2012 DarksideSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "BlockView.h"
#import "BlockerModel.h"

@interface ViewController : UIViewController
{
    BlockerModel* gameModel;
    UIImageView* ball;
    UIImageView* paddle;
    CADisplayLink* gameTimer; // need this to do the game loop so that everything updates in realtime
                              // otherwise hand developing a timer is too slow and unpredictable
}

-(void) updateDisplay:(CADisplayLink*)sender;
-(void) endGameWithMessage:(NSString*)message;

@end
