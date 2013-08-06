//
//  FactView.h
//  ChuckNorrisWroteThis
//
//  Created by Mike Berlin on 5/6/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImpactLabel.h"
#import "ChuckNorrisFact.h"

@interface FactView : UIView

@property (strong, nonatomic) IBOutlet ImpactLabel *lblTopText;
@property (strong, nonatomic) IBOutlet ImpactLabel *lblBottomText;
@property (strong, nonatomic) IBOutlet UIImageView *ivBackground;

- (id)initWithFrame:(CGRect)frame image:(UIImage *)image fact:(ChuckNorrisFact *)fact;
- (void)setProperties:(UIImage *)image fact:(ChuckNorrisFact *)fact;

@end