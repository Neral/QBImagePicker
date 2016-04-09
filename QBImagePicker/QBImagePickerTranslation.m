//
//  QBImagePickerTranslation.m
//  QBImagePickerControllerDemo
//
//  Created by Nerijus Lasauskas on 04/07/16.
//  Copyright (c) 2015 Katsuma Tanaka. All rights reserved.
//

#import "QBImagePickerTranslation.h"

@interface QBImagePickerTranslation ()

@property (nonatomic, strong) NSBundle *assetBundle;

@end

@implementation QBImagePickerTranslation

+ (QBImagePickerTranslation *)sharedInstance
{
    static QBImagePickerTranslation *translator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        translator = [[QBImagePickerTranslation alloc] init];
        [translator loadBundle];
    });
    return translator;
}

- (void)loadBundle
{
    // Get asset bundle
    self.assetBundle = [NSBundle bundleForClass:[self class]];
    NSString *bundlePath = [self.assetBundle pathForResource:@"QBImagePicker" ofType:@"bundle"];
    if (bundlePath) {
        self.assetBundle = [NSBundle bundleWithPath:bundlePath];
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        __weak typeof(self) weakSelf = self;
        self.translationHandler = ^(NSString *translationKey) {
            return [weakSelf defaultTranslationForKey:translationKey];
        };
    }
    return self;
}


- (NSString *)translationForKey:(NSString *)translationKey
{
    if (!self.translationHandler) {
        return @"missing_translation";
    }
    return self.translationHandler(translationKey);
}


- (NSString *)defaultTranslationForKey:(NSString *)translationKey
{
    return NSLocalizedStringFromTableInBundle(translationKey, @"QBImagePicker", self.assetBundle, nil);
}


@end
