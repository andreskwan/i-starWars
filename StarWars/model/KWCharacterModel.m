//
//  KWCharacterModel.m
//  StarWars
//
//  Created by Andres Kwan on 5/6/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import "KWCharacterModel.h"

@implementation KWCharacterModel : NSObject

#pragma mark - Class Methods
+(id) characterWithFirstName: (NSString *) aFirstName
               lastName: (NSString *) aLastName
                  alias: (NSString *) anAlias
               wikiPage: (NSURL *) aWikiPage
              soundData: (NSData *) aSoundData
                  photo: (UIImage *) aPhoto
{
    return [[self alloc]initWithFirstName:aFirstName
                          lastName:aLastName
                             alias:anAlias
                          wikiPage:aWikiPage
                         soundData:aSoundData
                             photo:aPhoto];

}


+(id) characterWithAlias: (NSString *) anAlias
                wikiPage: (NSURL *) aWikiPage
               soundData: (NSData *) aSoundData
                   photo: (UIImage *) aPhoto
{
    return [[self alloc]initWithAlias:anAlias
                             wikiPage:aWikiPage
                            soundData:aSoundData
                                photo:aPhoto];
}

#pragma mark - Init
-(id) initWithFirstName: (NSString *) aFirstName
               lastName: (NSString *) aLastName
                  alias: (NSString *) anAlias
               wikiPage: (NSURL *) aWikiPage
              soundData: (NSData *) aSoundData
                  photo: (UIImage *) aPhoto
{
    if (self = [super init]) {
        _firstName = aFirstName;
        _lastName  = aLastName;
        _alias     = anAlias;
        _wikiPage  = aWikiPage;
        _soundData = aSoundData;
        _photo     = aPhoto;
    }

    return self;
}

-(id) initWithAlias: (NSString *) anAlias
               wikiPage: (NSURL *) aWikiPage
              soundData: (NSData *) aSoundData
                  photo: (UIImage *) aPhoto
{
    if (self = [super init]) {
        _firstName = nil;
        _lastName  = nil;
        _alias     = anAlias;
        _wikiPage  = aWikiPage;
        _soundData = aSoundData;
        _photo     = aPhoto;
    }
    return self;
}

@end
