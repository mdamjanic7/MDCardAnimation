//
//  ViewController.h
//  CardAnimation
//
//  Created by Misa on 7/27/12.
//  Copyright (c) 2012 Misa Damjanic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSMutableArray* cardsArray;
}

@property (nonatomic, retain) NSMutableArray* cardsArray;
@property (nonatomic, retain) NSArray* cardsAngles;
@property (nonatomic, assign) NSUInteger numberOfDisplayedCards;

@end
