//
//  KWCharacterViewController.m
//  StarWars
//
//  Created by Andres Kwan on 5/6/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import "KWCharacterViewController.h"

@implementation KWCharacterViewController

//add a property to allowme to communitcate with the model

-(id) initWithModel: (KWCharacterModel *) aModel
{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = aModel;
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //sincronizamos controlador y vistas
    //how to communicate with the view
}
@end
