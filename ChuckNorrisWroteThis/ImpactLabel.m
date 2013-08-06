//
//  ImpactLabel.m
//  ChuckNorrisWroteThis
//
//  Created by Mike Berlin on 5/4/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "ImpactLabel.h"

@implementation ImpactLabel

- (void)awakeFromNib {
    UIFont *font = [UIFont fontWithName:@"Impact" size:self.font.pointSize];
    self.font = font;
}

@end