This project is very simple and easy to use.

For asynchronous dwonload of image used GCD. 

How to use in your project
--------------------------
add the 4 files

1)ILData.h
2)ILData.m
3)ILDownloadManager.h
4)ILDownloadManager.m

then fill your data to ILData object and add it to a nsmutable array
then call

ILDownloadManager *downloader = [[ILDownloadManager alloc] init];
    [downloader setDownloadBlock:^(NSInteger rowIndex){
        dispatch_queue_t queue = dispatch_get_main_queue();
        dispatch_sync(queue, ^{
            if(index != NSNotFound)
                [aTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:rowIndex inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
        });
    }];
    [downloader startDownloading:self.data]; //self.data is a NSMutableArray contains all ILData object fill with data.
    
    If you have still problem plase download the project and test it or contact me at ashim9831@gmail.com
    
