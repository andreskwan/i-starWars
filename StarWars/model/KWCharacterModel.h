//
//  KWCharacterModel.h
//  StarWars
//
//  Created by Andres Kwan on 5/6/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWCharacterModel : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *alias;
//how to access to a local/remote resource
@property (strong, nonatomic) NSURL    *wikiPage;
//to read a binary file, any data
@property (strong, nonatomic) NSData   *soundData;
//manipulate but do not display
@property (strong, nonatomic) UIImage  *photo;

-(id) initWithFirstName: (NSString *) aFirstName
               lastName: (NSString *) aLastName
                  alias: (NSString *) anAlias
               wikiPage: (NSURL *) aWikiPage
              soundData: (NSData *) aSoundData
                  photo: (UIImage *) aPhoto;

//ctrl + i to indent
-(id) initWithAlias: (NSString *) anAlias
           wikiPage: (NSURL *) aWikiPage
          soundData: (NSData *) aSoundData
              photo: (UIImage *) aPhoto;


@end
