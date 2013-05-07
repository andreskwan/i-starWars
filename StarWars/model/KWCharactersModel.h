//
//  KWCharactersModel.h
//  StarWars
//
//  Created by Andres Kwan on 5/7/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KWCharacterModel.h"

@interface KWCharactersModel : NSObject
@property (nonatomic) int rebelCount;
@property (nonatomic) int imperialCount;

-(KWCharacterModel *) rebelCharacterAtIndex: (int) anIndex;
-(KWCharacterModel *) imperialCharacterAtIndex: (int) anIndex;

@end
