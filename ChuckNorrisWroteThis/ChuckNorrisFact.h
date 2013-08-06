//
//  ChuckNorrisFact.h
//  ChuckNorrisWroteThis
//
//  Created by Mike Berlin on 5/5/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChuckNorrisFact : NSObject

@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *text;

- (id)initWithId:(NSInteger)id fact:(NSString *)fact;

- (NSString *)getTopTextFromFact;
- (NSString *)getBottomTextFromFact;

@end