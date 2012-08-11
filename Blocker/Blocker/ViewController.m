//
//  ViewController.m
//  Blocker
//
//  Created by Andrew Stevens on 8/08/12.
//  Copyright (c) 2012 DarksideSoftware. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // initialize the game model
    gameModel = [[BlockerModel alloc] init];
    
    // Iterate over the blocks in the model, drawing them
    for (BlockView* bv in gameModel.blocks) {
        // Add the block to the view
        [self.view addSubview:bv];
    }
    
    // Draw the paddle
    paddle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paddle.png"]];
    
    // Set the paddle position based on the model
    [paddle setFrame:gameModel.paddleRect];
    
    [self.view addSubview:paddle];
    
    // Draw the ball
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    
    [ball setFrame:gameModel.ballRect];
    
    [self.view addSubview:ball];
    
    // Configuring the CADisplayLink (i.e. the game timer) for animation
    gameTimer = [CADisplayLink displayLinkWithTarget:self
                                            selector:@selector(updateDisplay:)];
    
    // Add the display link to the current run loop
    [gameTimer addToRunLoop:[NSRunLoop currentRunLoop]
                    forMode:NSDefaultRunLoopMode];
}

-(void) updateDisplay:(CADisplayLink *)sender
{
    // This message is called by the gameTimer each time the display should update
    
    // Update the display
    [gameModel updateModelWithTime:sender.timestamp];
    
    // Update the display
    [ball setFrame:gameModel.ballRect];
    [paddle setFrame:gameModel.paddleRect];
    
    if ([gameModel.blocks count] == 0) {
        // No more blocks, end the game
        [self endGameWithMessage:@"You destroyed all of the blocks!"];
    }
}

-(void) endGameWithMessage:(NSString *)message
{
    // Call this method to end the game
    // Invalidate the timer
    [gameTimer invalidate];
    
    // Show an alert with the results
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Iterate over all touches
    for (UITouch* t in touches) {
        CGFloat delta = [t locationInView:self.view].x -
            [t previousLocationInView:self.view].x;
        
        CGRect newPaddleRect = gameModel.paddleRect;
        newPaddleRect.origin.x += delta;
        gameModel.paddleRect = newPaddleRect;
    }
}

@end
