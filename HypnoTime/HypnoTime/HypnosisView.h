//
//  HypnosisView.h
//  Hypnosister
//
//  Created by Andrew Stevens on 23/07/12.
//  Copyright (c) 2012 DarksideSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface HypnosisView : UIView
{
    CALayer *boxLayer;
}
@property (nonatomic, strong) UIColor *circleColor;
@end
