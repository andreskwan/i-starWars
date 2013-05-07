//
//  KWCharacterViewController.m
//  StarWars
//
//  Created by Andres Kwan on 5/6/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import "KWCharacterViewController.h"
#import "CafPlayer.h"
#import "KWWikiViewController.h"

@implementation KWCharacterViewController

//add a property to allow me to communitcate with the model
-(id) initWithModel: (KWCharacterModel *) aModel
{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = aModel;
        self.title = aModel.alias;
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //sincronizamos controlador y vistas
    //how to communicate with the view
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0 green:0 blue:0.15 alpha:1];
    self.photoView.image = self.model.photo;
}

#pragma mark - Actions
-(IBAction)playSound:(id)sender
{
    self.player = [CafPlayer cafPlayer];
    [self.player playSoundData:self.model.soundData];
    
    
}

-(IBAction)displayWiki:(id)sender
{
    KWWikiViewController * wikiVC = [[KWWikiViewController alloc] initWithModel:self.model];
    [self.navigationController pushViewController:wikiVC animated:YES];
}
@end
