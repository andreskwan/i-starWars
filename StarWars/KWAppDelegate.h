//
//  KWAppDelegate.h
//  StarWars
//
//  Created by Andres Kwan on 5/6/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KWAppDelegate : UIResponder <UIApplicationDelegate>

//UIWIndows : UIView
//nonatomic - insecure, or not synchronized

@property (strong, nonatomic) UIWindow *window;

//extra info for the compiler to create the setter and the getter

@end
