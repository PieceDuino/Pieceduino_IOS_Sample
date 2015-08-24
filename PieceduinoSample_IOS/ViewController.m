//
//  ViewController.m
//  PieceduinoSample_IOS
//
//  Created by QooChuang on 2015/8/18.
//  Copyright (c) 2015年 Tronk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    remote = [[PieceduinoRemote alloc] initWithPieceduinoToken:@"787d12b0dc95653d80548d90be630155"];
    [remote setDelegate:self];
    [remote FrameworkVersion];
    
    [self.getClientsIdBtn addTarget:self action:@selector(onGetClientsIdBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.ledSwitch addTarget:self action:@selector(onLedSwitch:) forControlEvents:UIControlEventTouchUpInside];
    [self.saveDataBtn addTarget:self action:@selector(onSaveDataBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.getDataBtn addTarget:self action:@selector(onGetDataBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void) onGetClientsIdBtnPress:(id)target{
    [remote GetClientsIdWithTaskId:1];
}
-(void) onLedSwitch:(id) target{
    [remote SendDataAllWithTaskId:2 Key:@"A" Value:[NSString stringWithFormat:@"%d", self.ledSwitch.isOn]];
}
-(void) onSaveDataBtnPress:(id)target{
    NameValueParams *params = [[NameValueParams alloc] init];
    [params addKey:@"time" Value:[NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]]];
    [params addKey:@"clickTimes" Value:[NSString stringWithFormat:@"%ld", (long)self.saveDataBtn.tag]];
    
    [remote SaveDataWithTaskId:3 Data:params];
}
-(void) onGetDataBtnPress:(id)target{
    [remote GetDataWithTaskId:4];
}

-(void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) PieceduinoRemoteComplete:(NSDictionary *)result TaskId:(int)taskId{
    NSLog(@"PieceduinoRemote Complete: %@", result);
    [self.apiMoniter setText:[NSString stringWithFormat:@"%@", result]];
}
-(void) PieceduinoRemoteFail:(NSDictionary *)result TaskId:(int)taskId{
    NSLog(@"PieceduinoRemote Fail: %@", result);
    [self.apiMoniter setText:[NSString stringWithFormat:@"%@", result]];
}
-(void) PieceduinoRemoteError:(NSError *)error TaskId:(int)taskId{
    NSLog(@"PieceduinoRemote Error: %@", error);
}
@end
