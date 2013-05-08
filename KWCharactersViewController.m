//
//  KWCharactersViewController.m
//  StarWars
//
//  Created by Andres Kwan on 5/7/13.
//  Copyright (c) 2013 Kwan. All rights reserved.
//

#import "KWCharactersViewController.h"
#import "KWCharactersModel.h"
#import "KWCharacterViewController.h"

@interface KWCharactersViewController ()
@property (nonatomic, strong) KWCharactersModel * model;
@end

@implementation KWCharactersViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
              model:(KWCharactersModel *) aModel
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _model = aModel;
        self.title = @"StarWars";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    if (section == IMPERIAL_SECTION) {
        return @"Imperials";
    } else {
        return @"Rebels";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == IMPERIAL_SECTION) {
        return self.model.imperialCount;
    }else{
        return self.model.rebelCount;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    //averiguamos de que personaje se trata
    KWCharacterModel *character = nil;
    
    if (indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialCharacterAtIndex:indexPath.row];
    }else{
        character = [self.model rebelCharacterAtIndex:indexPath.row];
    }
    
    //reutilizamos la celda
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        //la tenemos que crear de cero
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    //la configuramos: sincronizamos vista y modelo
    
    cell.imageView.image = character.photo;
    cell.textLabel.text  = character.alias;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", character.firstName, character.lastName];
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Averigumos de que personaje se trata
    KWCharacterModel *character = nil;
    if (indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialCharacterAtIndex:indexPath.row];
    } else {
        character = [self.model rebelCharacterAtIndex:indexPath.row];
        
    }
    
    //avisamos al deldelgado
    
    //averiguamos si el delegado entiende el mensaje
    if ([self.delegate respondsToSelector:@selector(charactersViewController:didSelectCharacter:)]) {
        [self.delegate charactersViewController:self
                             didSelectCharacter:character ];
        [self.delegate performSelector:@selector(escapedPatternForString:) ];
    }
}

@end
