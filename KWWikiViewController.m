//
//  KWWikiViewController.m
//  StarWars
//
//  Created by Andres Kwan on 5/7/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import "KWWikiViewController.h"

@interface KWWikiViewController ()

@end

@implementation KWWikiViewController


-(id)initWithModel: (KWCharacterModel*) aModel
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = aModel;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.browser loadRequest:[NSURLRequest requestWithURL:self.model.wikiPage]];
}
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
