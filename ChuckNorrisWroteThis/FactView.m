//
//  FactView.m
//  ChuckNorrisWroteThis
//
//  Created by Mike Berlin on 5/6/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "FactView.h"
#import "ChuckNorrisFact.h"

@implementation FactView

- (id)initWithFrame:(CGRect)frame image:(UIImage *)image fact:(ChuckNorrisFact *)fact {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.lblTopText.text = [fact getTopTextFromFact];
        self.lblTopText.numberOfLines = 0;
        self.lblTopText.lineBreakMode = NSLineBreakByWordWrapping;

        self.lblBottomText.text = [fact getBottomTextFromFact];
        self.lblBottomText.numberOfLines = 0;
        self.lblBottomText.lineBreakMode = NSLineBreakByWordWrapping;
        
        self.ivBackground.image = image;
    }
    return self;
}

- (void)setProperties:(UIImage *)image fact:(ChuckNorrisFact *)fact {
    self.lblTopText.text = [fact getTopTextFromFact];
    self.lblTopText.numberOfLines = 0;
    self.lblTopText.lineBreakMode = NSLineBreakByWordWrapping;

    self.lblBottomText.text = [fact getBottomTextFromFact];
    self.lblBottomText.numberOfLines = 0;
    self.lblBottomText.lineBreakMode = NSLineBreakByWordWrapping;

    self.ivBackground.image = image;
}

- (ImpactLabel *)lblTopText {
    if (_lblTopText == nil) _lblTopText = [[ImpactLabel alloc] init];
    return _lblTopText;
}

- (ImpactLabel *)lblBottomText {
    if (_lblBottomText == nil) _lblBottomText = [[ImpactLabel alloc] init];
    return _lblBottomText;
}

- (UIImageView *)ivBackground {
    if (_ivBackground == nil) _ivBackground = [[UIImageView alloc] init];
    return _ivBackground;
}

@end