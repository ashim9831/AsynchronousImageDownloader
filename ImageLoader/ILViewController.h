//
//  ILViewController.h
//  ImageLoader
//
//  Created by Ashim Samanta on 21/11/12.
//  Copyright (c) 2012 ashim9831@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ILViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    
}
@property (retain, nonatomic) IBOutlet UITableView *aTableView;

@property (nonatomic, retain) NSMutableArray *data;
@end
