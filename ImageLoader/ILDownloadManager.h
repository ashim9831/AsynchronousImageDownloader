//
//  ILDownloadManager.h
//  ImageLoader
//
//  Created by Ashim Samanta on 10/12/12.
//  Copyright (c) 2012 ashim9831@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^downloadCompleted)(NSInteger index);

@interface ILDownloadManager : NSObject{
    downloadCompleted downloadBlock;
}

-(void)setDownloadBlock:(downloadCompleted)_downloadBlock;
-(void)startDownloading:(NSMutableArray *)arrOfObject;

@end
