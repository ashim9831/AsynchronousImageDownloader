//
//  ILViewController.m
//  ImageLoader
//
//  Created by Ashim Samanta on 21/11/12.
//  Copyright (c) 2012 ashim9831@gmail.com. All rights reserved.
//

#import "ILViewController.h"
#import "ILData.h"
#import "ILDownloadManager.h"

#define Release(object) [object release]; object = nil

@interface ILViewController ()

@end

@implementation ILViewController
@synthesize aTableView;
@synthesize data;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.data = [[NSMutableArray alloc] init];
    
    ILData *ilData = [[ILData alloc] init];
    ilData._name = @"book-icon";
    ilData._link = @"http://icons.iconarchive.com/icons/skuzigraphic/library/48/book-icon.png";
    [self.data addObject:ilData];
    Release(ilData);
    
    ilData = [[ILData alloc] init];
    ilData._name = @"Address-Book-Mac-icon";
    ilData._link = @"http://icons.iconarchive.com/icons/deleket/book/48/Address-Book-Mac-icon.png";
    [self.data addObject:ilData];
    Release(ilData);
    
    ilData = [[ILData alloc] init];
    ilData._name = @"System-Apps-Address-Book-icon";
    ilData._link = @"http://icons.iconarchive.com/icons/flameia/xrabbit/48/System-Apps-Address-Book-icon.png";
    [self.data addObject:ilData];
    Release(ilData);
    
    ilData = [[ILData alloc] init];
    ilData._name = @"System-Apps-Address-Book-icon";
    ilData._link = @"http://icons.iconarchive.com/icons/flameia/xrabbit/48/System-Apps-Explorer-man-icon.png";
    [self.data addObject:ilData];
    Release(ilData);
    
    ilData = [[ILData alloc] init];
    ilData._name = @"System-Apps-Image-Capture-icon";
    ilData._link = @"http://icons.iconarchive.com/icons/flameia/xrabbit/48/System-Apps-Image-Capture-icon.png";
    [self.data addObject:ilData];
    Release(ilData);
    
    ilData = [[ILData alloc] init];
    ilData._name = @"System-Apps-Calculator-icon";
    ilData._link = @"http://icons.iconarchive.com/icons/flameia/xrabbit/48/System-Apps-Calculator-icon.png";
    [self.data addObject:ilData];
    Release(ilData);
    
    ILDownloadManager *downloader = [[ILDownloadManager alloc] init];
    [downloader setDownloadBlock:^(NSInteger index){
        dispatch_queue_t queue = dispatch_get_main_queue();
        dispatch_sync(queue, ^{
            if(index != NSNotFound)
                [aTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
        });
    }];
    [downloader startDownloading:self.data];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setATableView:nil];
    self.data = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark __
#pragma mark __ Table view Delegate & data source.

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    ILData *iData = [self.data objectAtIndex:indexPath.row];
    cell.textLabel.text = iData._name;
    if(iData._image)
        cell.imageView.image = iData._image;
    return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [aTableView release];
    [data release];
    [super dealloc];
}
@end
