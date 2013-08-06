//
//  FactsViewController.h
//  ChuckNorrisWroteThis
//
//  Created by Mike Berlin on 5/4/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *svFacts;
@property (weak, nonatomic) IBOutlet UIPageControl *pcFacts;

- (IBAction)pcValueChanged:(UIPageControl *)sender;

@end