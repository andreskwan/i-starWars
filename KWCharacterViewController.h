//
//  KWCharacterViewController.h
//  StarWars
//
//  Created by Andres Kwan on 5/6/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KWCharacterModel.h"


@interface KWCharacterViewController : UIViewController

@property (strong, nonatomic) KWCharacterModel   *model;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@end
