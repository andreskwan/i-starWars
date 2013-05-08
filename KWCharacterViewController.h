//
//  KWCharacterViewController.h
//  StarWars
//
//  Created by Andres Kwan on 5/6/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KWCharacterModel.h"
#import "CafPlayer.h"
#import "KWCharactersViewController.h"

@interface KWCharacterViewController : UIViewController <UISplitViewControllerDelegate,KWCharactersViewControllerDelegate>

@property (strong, nonatomic) KWCharacterModel   *model;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) CafPlayer          *player;

-(id) initWithModel: (KWCharacterModel *) aModel;
-(IBAction)playSound:(id)sender;
-(IBAction)displayWiki:(id)sender;

@end
