//
//  HomeViewController.h
//  ChuckNorrisWroteThis
//
//  Created by Mike Berlin on 5/4/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImpactLabel.h"

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet ImpactLabel *lblChuchNorris;
@property (weak, nonatomic) IBOutlet ImpactLabel *lblFacts;

@property (weak, nonatomic) IBOutlet UIImageView *imgChuckNorrisApproved;
@property (nonatomic, strong) IBOutlet UIButton *btnEducateYourself;

- (IBAction)btnEducateYourselfTap:(UIButton *)sender;

@end