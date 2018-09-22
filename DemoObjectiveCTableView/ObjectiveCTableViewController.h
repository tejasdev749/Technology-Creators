//
//  ObjectiveCTableViewController.h
//  DemoObjectiveCTableView
//
//  Created by tejas.deogadkar on 24/07/18.
//  Copyright © 2018 tejas.deogadkar. All rights reserved.
//

#ifndef ObjectiveCTableViewController_h
#define ObjectiveCTableViewController_h


#endif /* ObjectiveCTableViewController_h */


#import <UIKit/UIKit.h>

@interface ObjectiveCTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (copy,nonatomic) NSArray *technologies;
@property (copy,nonatomic) NSArray *creators;

@end
