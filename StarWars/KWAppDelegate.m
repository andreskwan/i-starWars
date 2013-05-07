//
//  KWAppDelegate.m
//  StarWars
//
//  Created by Andres Kwan on 5/6/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import "KWAppDelegate.h"
#import "KWCharacterModel.h"
#import "KWCharacterViewController.h"
#import "KWWikiViewController.h"
@implementation KWAppDelegate

//method from the delegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

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
    
    ////////////////////////////////////
    // creamos un controlador
    KWCharacterViewController * charVC = [[KWCharacterViewController alloc] initWithModel:vader];
    
    KWWikiViewController * wikiVC = [[KWWikiViewController alloc]initWithModel:vader];
  
    
    ////////////////////////////////////
  //creamos el combinador
    UITabBarController *tabVC  = [[UITabBarController alloc]init];
    [tabVC setViewControllers:@[charVC,wikiVC]];
    ////////////////////////////////////
    //mostramos en pantalla
    [[self window] setRootViewController:tabVC];
    
    
    self.window.backgroundColor = [UIColor orangeColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

//
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//OS: I'm gonna kill you, you have done something wrong
//eating too much MEM
//the last one to be kill the actual app
- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
