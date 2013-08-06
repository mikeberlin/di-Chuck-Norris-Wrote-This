//
//  HomeViewController.m
//  ChuckNorrisWroteThis
//
//  Created by Mike Berlin on 5/4/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "HomeViewController.h"
#import "FactsViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
    UIFont *font = [UIFont fontWithName:@"Impact" size:self.btnEducateYourself.titleLabel.font.pointSize];
    self.btnEducateYourself.titleLabel.font = font;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnEducateYourselfTap:(UIButton *)sender {
    FactsViewController *vcFacts = [[FactsViewController alloc] initWithNibName:@"FactsViewController" bundle:[NSBundle mainBundle]];
    vcFacts.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    [self presentViewController:vcFacts animated:YES completion:nil];
}

@end