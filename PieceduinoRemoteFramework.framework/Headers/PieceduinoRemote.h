//
//  PieceduinoRemote.h
//  PieceduinoRemoteFramework
//
//  Created by QooChuang on 2015/8/18.
//  Copyright (c) 2015年 Tronk. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Version 1.0
#define ApiDomain @"http://www.pieceduino.com/PWSPanel/api/api.php"
@class NameValueParams;
@protocol PieceduinoRemoteDelegate;

@interface PieceduinoRemote : NSObject{
    __strong id mDelegate;
    
    NSString *token;
}
@property(strong) id<PieceduinoRemoteDelegate> delegate;

-(id) initWithPieceduinoToken:(NSString*)_token;
-(void) SetPieceduinoToken:(NSString*)_token;
-(void) FrameworkVersion;


-(void) GetClientsIdWithTaskId:(int) taskId;
-(void) SendDataAllWithTaskId:(int)taskId Key:(NSString*)key Value:(NSString*)value;
-(void) SaveDataWithTaskId:(int)taskId Data:(NameValueParams*)params;
-(void) GetDataWithTaskId:(int)taskId;
@end

@protocol PieceduinoRemoteDelegate
-(void) PieceduinoRemoteComplete:(NSDictionary*)result TaskId:(int) taskId;
-(void) PieceduinoRemoteFail:(NSDictionary*)result TaskId:(int) taskId;
-(void) PieceduinoRemoteError:(NSError*)error TaskId:(int) taskId;

@end


