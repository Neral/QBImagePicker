//
//  QBImagePickerTranslation.h
//  QBImagePickerControllerDemo
//
//  Created by Nerijus Lasauskas on 04/07/16.
//  Copyright (c) 2015 Katsuma Tanaka. All rights reserved.
//

#import <Foundation/Foundation.h>

#define QBTranslation(key) [[QBImagePickerTranslation sharedInstance] translationForKey:key]

@interface QBImagePickerTranslation : NSObject

@property (nonatomic, copy) NSString *(^translationHandler)(NSString *translationKey);

+ (QBImagePickerTranslation *)sharedInstance;
- (NSString *)translationForKey:(NSString *)translationKey;

@end
