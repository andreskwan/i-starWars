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
//    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0 green:0 blue:0.15 alpha:1];
    [self syncViewWithModel];
    
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

#pragma mark - UISplitViewControllerDelegate
-(void) splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

-(void)splitViewController:(UISplitViewController *)svc
    willShowViewController:(UIViewController *)aViewController
 invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.leftBarButtonItem = nil;
}

#pragma mark - KWCharactersViewControllerDelegate
-(void) charactersViewController:(KWCharactersViewController *)anVC
              didSelectCharacter:(KWCharacterModel *)aCharacter
{
    self.model = aCharacter;
    [self syncViewWithModel];
}

#pragma mark - Utils
-(void) syncViewWithModel
{
    self.title = self.model.alias;
    self.photoView.image = self.model.photo;
}

@end
