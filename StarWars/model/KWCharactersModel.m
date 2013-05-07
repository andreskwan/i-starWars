//
//  KWCharactersModel.m
//  StarWars
//
//  Created by Andres Kwan on 5/7/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import "KWCharactersModel.h"

@interface KWCharactersModel ()
@property (strong, nonatomic) NSArray *rebels;
@property (strong, nonatomic) NSArray *imperials;

@end
@implementation KWCharactersModel
-(id)init
{
    if (self = [super init]) {
        ////////////////////////////////////
        //creamos modelo
        NSURL *vaderURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Darth_Vader"];
        NSData *vaderSound = [NSData dataWithContentsOfURL:[[NSBundle mainBundle]URLForResource:@"vader"
                                                                                  withExtension:@"caf"]];
        UIImage *vaderImage = [UIImage imageNamed:@"darthVader.jpg"];
        
        KWCharacterModel * vader = [KWCharacterModel characterModelWithFirstName:@"Anakin"
                                                                        lastName:@"Skywalker"
                                                                           alias:@"DarthVader"
                                                                        wikiPage:vaderURL
                                                                       soundData:vaderSound
                                                                           photo:vaderImage];
        //C3-PO
        ////////////////////////////////////
        //creamos modelo
        NSURL *c3poURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/C-3PO"];
        NSData *c3poSound = [NSData dataWithContentsOfURL:[[NSBundle mainBundle]URLForResource:@"c3po"
                                                                                 withExtension:@"caf"]];
        UIImage *c3poImage = [UIImage imageNamed:@"c3po.jpg"];
        
        KWCharacterModel * c3po = [KWCharacterModel characterModelWithAlias:@"C3-PO"
                                                                   wikiPage:c3poURL
                                                                  soundData:c3poSound
                                                                      photo:c3poImage];
        
        //Chewbacca
        ////////////////////////////////////
        //creamos modelo
        NSURL *chewieURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Chewbacca"];
        NSData *chewieSound = [NSData dataWithContentsOfURL:[[NSBundle mainBundle]URLForResource:@"chewbacca"
                                                                                   withExtension:@"caf"]];
        UIImage *chewieImage = [UIImage imageNamed:@"chewbacca.jpg"];
        
        KWCharacterModel * chewie = [KWCharacterModel characterModelWithAlias:@"Chewbacca"
                                                                     wikiPage:chewieURL
                                                                    soundData:chewieSound
                                                                        photo:chewieImage];
        
        //Yoda
        NSURL *yodaURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Yoda"];
        NSData *yodaSound = [NSData dataWithContentsOfURL:[[NSBundle mainBundle]URLForResource:@"yoda"
                                                                                 withExtension:@"caf"]];
        UIImage *yodaImage = [UIImage imageNamed:@"yoda.jpg"];
        KWCharacterModel * yoda = [KWCharacterModel characterModelWithFirstName:@"Minch"
                                                                       lastName:@"Yoda"
                                                                          alias:@"Master Yoda"
                                                                       wikiPage:yodaURL
                                                                      soundData:yodaSound
                                                                          photo:yodaImage];
        //Palpatine
        ////////////////////////////////////
        //creamos modelo
        NSURL *palpatineURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Palpatine"];
        NSData *palpatineSound = [NSData dataWithContentsOfURL:[[NSBundle mainBundle]URLForResource:@"palpatine"
                                                                                   withExtension:@"caf"]];
        UIImage *palpatineImage = [UIImage imageNamed:@"palpatine.jpg"];
        
        KWCharacterModel * palpatine = [KWCharacterModel characterModelWithFirstName:@""
                                                                            lastName:@"Palpatine"
                                                                        alias:@"Palpatine"
                                                                     wikiPage:palpatineURL
                                                                    soundData:palpatineSound
                                                                        photo:palpatineImage];

        //Rd2
        ////////////////////////////////////
        //creamos modelo
        NSURL *r2d2URL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/r2d2"];
        NSData *r2d2Sound = [NSData dataWithContentsOfURL:[[NSBundle mainBundle]URLForResource:@"r2-d2"
                                                                                      withExtension:@"caf"]];
        UIImage *r2d2Image = [UIImage imageNamed:@"R2-D2.jpg"];
        
        KWCharacterModel * r2d2 = [KWCharacterModel characterModelWithAlias:@"R2D2"
                                                                        wikiPage:r2d2URL
                                                                       soundData:r2d2Sound
                                                                           photo:r2d2Image];
        self.rebels = @[chewie, c3po, yoda, r2d2];
        self.imperials = @[palpatine,vader];
    }
    return self;
}

-(KWCharacterModel *) rebelCharacterAtIndex:(int)anIndex
{
    return [self.rebels objectAtIndex:anIndex];
}

-(KWCharacterModel *) imperialCharacterAtIndex:(int)anIndex
{
    return [self.imperials objectAtIndex:anIndex];
}



-(int)rebelCount
{
    return [self.rebels count];
}

-(int)imperialCount
{
    return [self.imperials count];
}
@end
