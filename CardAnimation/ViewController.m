//
//  ViewController.m
//  CardAnimation
//
//  Created by Misa on 7/27/12.
//  Copyright (c) 2012 Misa Damjanic. All rights reserved.
//

#import "ViewController.h"
#import "CardView.h"

#define CARD_WIDTH 400
#define CARD_HEIGHT 240
#define CARD_ORIGIN_X 40
#define CARD_ORIGIN_Y 40
#define CARD_POSITION_HIDDEN_OFFSET 30

#define ANIMATION_DURATION 0.5
#define ANIMATION_DELAY 0.5

#define TYPES_OF_DIFFERENT_ANGLES 3
#define ROTATION 0.04

#define NUMBER_OF_CARDS 4

@interface ViewController ()

@end


@implementation ViewController

@synthesize cardsArray;
@synthesize cardsAngles;
@synthesize numberOfDisplayedCards;

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self != nil) {
        self.cardsArray = [NSMutableArray array];
        self.cardsAngles = @[@0, [NSNumber numberWithFloat:ROTATION], [NSNumber numberWithFloat:-ROTATION]];
        self.numberOfDisplayedCards = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startWithStackFullyVisible];
    
    [self performSelector:@selector(slideInACard) withObject:nil afterDelay:0.5];
    [self performSelector:@selector(slideInACard) withObject:nil afterDelay:1.0];
    [self performSelector:@selector(slideInACard) withObject:nil afterDelay:1.5];
    [self performSelector:@selector(slideInACard) withObject:nil afterDelay:2.0];
    [self performSelector:@selector(slideInACard) withObject:nil afterDelay:2.5];
    
    [self performSelector:@selector(removeACard) withObject:nil afterDelay:3.0];
    [self performSelector:@selector(removeACard) withObject:nil afterDelay:3.5];
    [self performSelector:@selector(removeACard) withObject:nil afterDelay:4.0];
    [self performSelector:@selector(removeACard) withObject:nil afterDelay:4.5];
    [self performSelector:@selector(removeACard) withObject:nil afterDelay:5.0];
    [self performSelector:@selector(removeACard) withObject:nil afterDelay:5.5];
    [self performSelector:@selector(removeACard) withObject:nil afterDelay:6.0];
    [self performSelector:@selector(removeACard) withObject:nil afterDelay:6.5];
    [self performSelector:@selector(removeACard) withObject:nil afterDelay:7.0];
    [self performSelector:@selector(removeACard) withObject:nil afterDelay:7.5];

}

- (void)startWithStackFullyVisible {
    for (NSUInteger i = 0; i < NUMBER_OF_CARDS; i++) {
        CGRect startFrame = CGRectMake(CARD_ORIGIN_X, CARD_ORIGIN_Y, CARD_WIDTH, CARD_HEIGHT);
        NSNumber* rotation = [cardsAngles objectAtIndex:(numberOfDisplayedCards++ % TYPES_OF_DIFFERENT_ANGLES)];
        CardView* cardView = [[[CardView alloc] initWithFrame:startFrame andRotation:[rotation floatValue]] autorelease];
        [cardsArray addObject:cardView];
        [self.view addSubview:cardView];
    }
}

- (void)slideInACard {

    CGRect startFrame = CGRectMake(-(CARD_WIDTH + CARD_POSITION_HIDDEN_OFFSET), CARD_ORIGIN_Y, CARD_WIDTH, CARD_HEIGHT);
    NSNumber* rotation = [cardsAngles objectAtIndex:(numberOfDisplayedCards++ % TYPES_OF_DIFFERENT_ANGLES)];
    CardView* cardView = [[[CardView alloc] initWithFrame:startFrame andRotation:[rotation floatValue]] autorelease];
    [cardsArray addObject:cardView];
    [self.view addSubview:cardView];
    
    [UIView animateWithDuration:ANIMATION_DURATION delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        cardView.center = CGPointMake(cardView.center.x + CARD_WIDTH + CARD_POSITION_HIDDEN_OFFSET + CARD_ORIGIN_X, cardView.center.y);
    } completion:nil];

}

- (void)removeACard {
    if ([cardsArray count] == 0) {
        return;
    }
    
    CardView* cardView = [cardsArray lastObject];
    [cardsArray removeLastObject];
    
    [UIView animateWithDuration:ANIMATION_DURATION delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        cardView.center = CGPointMake(cardView.center.x + CARD_WIDTH + CARD_POSITION_HIDDEN_OFFSET + CARD_ORIGIN_X, cardView.center.y);
    } completion:^(BOOL finished) {        
        [cardView removeFromSuperview];
    }];    
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight));
}

@end
