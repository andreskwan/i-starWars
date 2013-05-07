//
//  KWCharactersViewController.h
//  StarWars
//
//  Created by Andres Kwan on 5/7/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KWCharactersModel.h"
#define IMPERIAL_SECTION 0
#define REBEL_SECTION 1

@interface KWCharactersViewController : UITableViewController
- (id)initWithStyle:(UITableViewStyle)style
              model:(KWCharactersModel *) aModel;

@end
