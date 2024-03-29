//
//  KWWikiViewController.h
//  StarWars
//
//  Created by Andres Kwan on 5/7/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KWCharacterModel.h"
@interface KWWikiViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) KWCharacterModel *model;
@property (weak,nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(id)initWithModel: (KWCharacterModel *) aModel;

@end
