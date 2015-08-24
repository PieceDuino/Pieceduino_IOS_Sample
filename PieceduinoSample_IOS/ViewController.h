//
//  ViewController.h
//  PieceduinoSample_IOS
//
//  Created by QooChuang on 2015/8/18.
//  Copyright (c) 2015年 Tronk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PieceduinoRemoteFramework/PieceduinoRemoteFramework.h>
@interface ViewController : UIViewController <PieceduinoRemoteDelegate>{
    PieceduinoRemote *remote;
}

@property (strong, nonatomic) IBOutlet UIButton *getClientsIdBtn;
@property (strong, nonatomic) IBOutlet UISwitch *ledSwitch;
@property (strong, nonatomic) IBOutlet UIButton *saveDataBtn;
@property (strong, nonatomic) IBOutlet UIButton *getDataBtn;
@property (strong, nonatomic) IBOutlet UITextView *apiMoniter;

@end

