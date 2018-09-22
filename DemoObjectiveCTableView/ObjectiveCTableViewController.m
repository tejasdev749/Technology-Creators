//
//  ObjectiveCTableViewController.m
//  DemoObjectiveCTableView
//
//  Created by tejas.deogadkar on 24/07/18.
//  Copyright © 2018 tejas.deogadkar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ObjectiveCTableViewController.h"
#import "CustomTableViewCell.h"
#import "StartAgainCell.h"

@interface ObjectiveCTableViewController ()

@property (weak,nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ObjectiveCTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.technologies = @[@"C",@"C++",@"Java",@"PHP",@"MySQL",@"Linux System Programming",@"WIN32 SDK",@"Android App Development",@"iPhone Software Development",@"Swift",@"Objective - C",@"Javascript",@"ReactJS",@"Redux",@"NodeJS"];
    
    self.creators = @[@"Dennis Ritchie",@"Bjarne Straustroup",@"James Gosling",@"Rasmus Lerdoff",@"Widenius and Axmark",@"Linus Torvalds",@"Charles Petzold",@"Andy Rubin",@"Steve Jobs",@"Chris Lattner",@"Brad Cox",@"Brendan Eich",@"Jordan Walke",@"Dan Abramov",@"Ryan Dahl"];
    
    self.tableView = (id)[self.view viewWithTag:1];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.technologies count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleId = @"CUSTOM_CELL_ID";
    
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleId forIndexPath:indexPath];
    
    cell.batchLabel.text = _technologies[indexPath.row];
    
    cell.guessCreator.text = @"Guess Creator";
    [cell.guessCreator setTextAlignment:NSTextAlignmentRight];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
    selectedCell.guessCreator.text = [NSString stringWithFormat:@" - %@",_creators[indexPath.row]];
    [selectedCell.guessCreator setTextAlignment:NSTextAlignmentLeft];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    NSString *startCellID = @"START_AGAIN_CELL_ID";
    
    StartAgainCell *footerCell = (StartAgainCell *)[tableView dequeueReusableCellWithIdentifier:startCellID];
    footerCell.startAgain.text = @"Guess Again";
    
    UITapGestureRecognizer *startAgainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startAgainGestureHandler:)];
    startAgainTap.numberOfTouchesRequired = 1;
    startAgainTap.numberOfTapsRequired = 1;
    [footerCell.startAgain addGestureRecognizer:startAgainTap];
    footerCell.startAgain.userInteractionEnabled = YES;
    
    return footerCell;
}

-(IBAction) startAgainGestureHandler:(UIGestureRecognizer *)gestureRecognizer
{
    
    [self.tableView reloadData];
    
}


@end
