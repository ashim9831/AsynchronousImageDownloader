//
//  ILDownloadManager.m
//  ImageLoader
//
//  Created by Ashim Samanta on 10/12/12.
//  Copyright (c) 2012 ashim9831@gmail.com. All rights reserved.
//

#import "ILDownloadManager.h"
#import "ILData.h"

@implementation ILDownloadManager

-(void)setDownloadBlock:(downloadCompleted)_downloadBlock{
    if(downloadBlock){
        [downloadBlock release];
    }
    
    downloadBlock = [_downloadBlock copy];
}

-(void)startDownloading:(NSMutableArray *)arrOfObject
{
    dispatch_queue_t queue = dispatch_queue_create("ILDownloader", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue,^{
        NSInteger index = 0;
        for(ILData *ildata in arrOfObject){
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:ildata._link]];
            if(data){
                ildata._image = [UIImage imageWithData:data];
            }else{
                ildata._image = nil;
            }
            downloadBlock(index);
            index++;
        }
    });
    dispatch_release(queue);
}
@end
