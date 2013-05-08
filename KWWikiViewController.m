//
//  KWWikiViewController.m
//  StarWars
//
//  Created by Andres Kwan on 5/7/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import "KWWikiViewController.h"
#import "KWCharactersViewController.h"

@interface KWWikiViewController ()

@end

@implementation KWWikiViewController

//el controlador puede ser delegado de varios, muchos jefes, pero un jefe solo un delegado
-(id)initWithModel: (KWCharacterModel*) aModel
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = aModel;
        self.title = @"Wiki";
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //nos damos de alta en las notificaciones
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(characterDidChange:)
               name:CHARACTER_DID_CHANGE_NOTIFICATION
             object:nil];
    
    //asignamos delegado
    [[self browser] setDelegate:self];
    
    //syncronizacion vista y modelo
    [self syncViewWithModel];

}

-(void) characterDidChange:(NSNotification *) notification
{
    //extraer el userInfo
    NSDictionary * info = [notification userInfo];
    
    //sacar el personaje del userInfo
    KWCharacterModel * character = [info objectForKey:CHARACTER_KEY];

    //Actualizar el modelo
    self.model = character;
    
    //Sincronizar las vistas co el modelo
    [self syncViewWithModel];
    
}

-(void) syncViewWithModel
{
    [self. browser loadRequest:[NSURLRequest
                                requestWithURL:[[self model]wikiPage]]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
          
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIWebViewDelegate
//
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
     [self.activityView  stopAnimating];
//     [self.activityView  startAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.activityView stopAnimating];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Contacte con el administrador"
                                                   message:[error localizedDescription]
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil];
    [alert show];
}

-(BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
navigationType:(UIWebViewNavigationType)navigationType
{
    
    if ((navigationType == UIWebViewNavigationTypeLinkClicked)||
        (navigationType == UIWebViewNavigationTypeFormSubmitted)) {
        

        
        
        
        return NO;
    }else{
        return YES;
    }
}

@end
