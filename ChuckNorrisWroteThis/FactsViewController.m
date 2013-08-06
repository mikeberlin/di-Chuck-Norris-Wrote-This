//
//  FactsViewController.m
//  ChuckNorrisWroteThis
//
//  Created by Mike Berlin on 5/4/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "FactsViewController.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "ChuckNorrisFact.h"
#import "FactView.h"

#define JOKE_API_BASE_URL @"http://api.icndb.com/jokes/"

@interface FactsViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, strong) NSMutableArray *facts;   // of ChuckNorrisFact objects
@property (nonatomic, strong) NSArray *cnImages;

@end

@implementation FactsViewController

#pragma mark - UIViewController Delegate Messages

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
    self.cnImages = @[@"Chuck Norris Invasion USA denim.jpg",
                      @"chuck-norris-pictures-19.jpg",
                      @"chuck_norris-.jpg",
                      @"chucknorris.jpeg",
                      @"playing-chess-with-chuck-norris.jpg"];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [self loadChuckNorrisJokes:10];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate Messages

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.svFacts.frame.size.width;

    int page = floor((self.svFacts.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    NSLog(@"current page number: %d", page);
    self.pcFacts.currentPage = page;

    // if we're getting close to the end of the scroll view then load up another joke
    if ((self.pcFacts.numberOfPages - page) <= 2) {
        [self loadChuckNorrisJokes:5];
    }
}

- (IBAction)pcValueChanged:(UIPageControl *)sender {
    // update the scroll view to the appropriate page
    CGRect frame;
    frame.origin.x = self.svFacts.frame.size.width * self.pcFacts.currentPage;
    frame.origin.y = 0;
    frame.size = self.svFacts.frame.size;

    FactView *factView = (FactView *)[self.facts objectAtIndex:self.pcFacts.currentPage - 1];
    NSLog(@"Top Text: %@", factView.lblTopText.text);

    [self.svFacts scrollRectToVisible:frame animated:YES];
}

#pragma mark - Local Properties

- (NSMutableArray *)facts {
    if (_facts == nil) _facts = [[NSMutableArray alloc] init];
    return _facts;
}

#pragma mark - Local Messages

- (void)initHudSettings {
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.labelText = @"Loading";
}

- (void)loadChuckNorrisJokes:(NSInteger)numFacts {

    [self initHudSettings];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@random/%d", JOKE_API_BASE_URL, numFacts]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request

        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            NSString *responseType = [JSON valueForKey:@"type"];

            if ([responseType isEqualToString:@"success"]) {
                NSArray *responseJokesArray = [JSON valueForKey:@"value"];

                for (NSDictionary *fact in responseJokesArray) {
                    ChuckNorrisFact *cnFact = [[ChuckNorrisFact alloc] initWithId:(NSInteger)fact[@"id"] fact:fact[@"joke"]];
                    [self addViewToScrollView:cnFact];
                }

                [self.hud hide:YES];
            }
        }
        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            NSLog(@"There was an error from the url: %@. The error was:\n%@", url, error);
        }];

    [operation start];
}

- (void)addViewToScrollView:(ChuckNorrisFact *)fact {
    NSInteger pageFrameIndex = (self.facts.count <= 0) ? 0 : self.facts.count;
    NSLog(@"currentIndex: %d", pageFrameIndex);
    
    CGRect frame;
    frame.origin.x = self.svFacts.frame.size.width * pageFrameIndex;
    frame.origin.y = 0;
    frame.size = self.svFacts.frame.size;

    NSLog(@"frame.origin.x: %0.0f", frame.origin.x);

    UINib *factNib = [UINib nibWithNibName:@"Fact" bundle:[NSBundle mainBundle]];
    FactView *factView = [[factNib instantiateWithOwner:nil options:nil] lastObject];
    [factView setProperties:[self getRandomChuckNorrisImage] fact:fact];
    [factView setFrame:frame];

    /*
    NSLog(@"Full Text: %@", joke.text);
    NSLog(@"Top Text: %@", fact.lblTopText.text);
    NSLog(@"Bottom Text: %@", fact.lblBottomText.text);
    NSLog(@"Background Image: %@", fact.ivBackground.image.description);
    */

    [self.facts addObject:fact];
    [self.svFacts addSubview:factView];

    self.svFacts.contentSize = CGSizeMake(self.svFacts.frame.size.width * self.facts.count, self.svFacts.frame.size.height);
    self.pcFacts.numberOfPages = self.facts.count;

    NSLog(@"self.svFacts.contentSize: %0.0f", self.svFacts.contentSize.width);
}

- (UIImage *)getRandomChuckNorrisImage {
    NSInteger randomIndex = (arc4random() % self.cnImages.count);
    return [UIImage imageNamed:[self.cnImages objectAtIndex:randomIndex]];
}

@end