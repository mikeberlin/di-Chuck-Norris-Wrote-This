//
//  ChuckNorrisFact.m
//  ChuckNorrisWroteThis
//
//  Created by Mike Berlin on 5/5/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "ChuckNorrisFact.h"

@implementation ChuckNorrisFact

- (id)initWithId:(NSInteger)id fact:(NSString *)fact {
    self = [super init];

    if (self) {
        // Initialization code
        self.id = id;
        self.text = fact;
    }

    return self;
}

- (NSString *)text {
    if (_text == nil) _text = [[NSString alloc] init];

    // TODO: Decode HTML within this object.
    return _text;
}

- (NSString *)getTopTextFromFact {
    NSInteger index = [self getIndexOfEndOfFirstSentence:self.text];
    return [self.text substringWithRange:NSMakeRange(0, index+1)];
}

- (NSString *)getBottomTextFromFact {
    NSInteger index = [self getIndexOfEndOfFirstSentence:self.text];
    return [self.text substringFromIndex:index+1];
}

- (NSInteger)getIndexOfEndOfFirstSentence:(NSString *)paragraphText {
    NSInteger index = [paragraphText rangeOfString:@"..."].location;
    if ((index > paragraphText.length) || (index == 0)) index = [paragraphText rangeOfString:@"?"].location;
    if ((index > paragraphText.length) || (index == 0)) index = [paragraphText rangeOfString:@"!"].location;
    if ((index > paragraphText.length) || (index == 0)) index = [paragraphText rangeOfString:@"."].location;

    return (index > paragraphText.length) ? 0 : index;
}

@end