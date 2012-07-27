//
//  CardView.m
//  CardAnimation
//
//  Created by Misa on 7/27/12.
//  Copyright (c) 2012 Misa Damjanic. All rights reserved.
//

#import "CardView.h"
#import <QuartzCore/CALayer.h>

#define SHADOW_RADIUS 7
#define SHADOW_OPACITY 0.25
#define SHADOW_ORIGIN_X -5
#define SHADOW_ORIGIN_Y 0
#define SHADOW_ADDITIONAL_WIDTH 10
#define SHADOW_ADDITIONAL_HEIGHT 10

@interface CardView()

@property (nonatomic, assign) CGFloat rotation;

@end

@implementation CardView

@synthesize rotation;

- (id)initWithFrame:(CGRect)frame andRotation:(CGFloat)rotationValue {
    self = [super initWithFrame:frame];
    if (self) {
        self.rotation = rotationValue;
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame andRotation:0];
}


- (void)drawRect:(CGRect)rect {
    CALayer* layer = self.layer;
    layer.masksToBounds = false;
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = SHADOW_RADIUS;
    layer.shadowOpacity = SHADOW_OPACITY;
    layer.shadowPath = CGPathCreateWithRect(CGRectMake(SHADOW_ORIGIN_X, SHADOW_ORIGIN_Y, self.frame.size.width + SHADOW_ADDITIONAL_WIDTH, self.frame.size.height + SHADOW_ADDITIONAL_HEIGHT), nil);
    
    layer.borderWidth = 1;
    layer.borderColor = [[UIColor clearColor] CGColor];
    layer.shouldRasterize = true;
        
    layer.transform = CATransform3DRotate(CATransform3DIdentity, self.rotation, 0.0, 0.0, 1);
}


@end
