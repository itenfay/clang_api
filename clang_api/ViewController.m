//
//  ViewController.m
//  clang_api
//
//  Created by Tenfay on 15/8/14.
//  Copyright (c) 2015年 Tenfay. All rights reserved.
//

#import "ViewController.h"
#import "clang_api.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = clang_path_for_resource_from_bundle(@"Info", @"plist", nil, @"Test");
    NSLog(@"Info.plist's path: %@", path);
    NSLog(@"Info.plist's content: %@", [NSDictionary dictionaryWithContentsOfFile:path]);
    
    UIImage *image = clang_load_image_from_bundle(@"angle-mask", @"angle-mask.bundle", @"Test");
    NSLog(@"Image: %@", image);
    
    NSLog(@"Localized string: %@", clang_localized_string(@"Lan_network_timeout", nil, @"en", @"language", @"Test"));
    
    UIImage *image2 = clang_image_with_contents_of_file(@"angle-mask", nil, @"angle-mask.bundle", @"Test");
    NSLog(@"Image2: %@", image2);
    
    NSString *path2 = clang_path_for_resource_from_bundle(@"Info", @"plist", nil, nil);
    NSLog(@"Info.plist's path2: %@", path2);
    NSLog(@"Info.plist's content2: %@", [NSDictionary dictionaryWithContentsOfFile:path2]);
    
    UIImage *image3 = clang_image_with_contents_of_file(@"angle-mask", nil, nil, nil);
    NSLog(@"Image3: %@", image3);
    
    BOOL y1 = clang_equal(@1, @3);
    NSLog(@"y1: %d", y1);
    BOOL y2 = clang_equal_to_string(@"try", @"try");
    NSLog(@"y2: %d", y2);
    
    clang_perform_selector(self, @selector(run));
    clang_perform_selector_v2(self, @selector(runWithArg:), @10);
    clang_delay_perform_selector(self, @selector(update), 1.0);
    clang_delay_perform_selector_v2(self, @selector(updateWithArg:), @"update", 1.0);
    
    clang_store_object(@"AppID", @"g7482293", YES);
    NSString *appID = clang_read_object(@"AppID");
    NSLog(@"appID: %@", appID);
    //clang_remove_object(@"AppID", YES);
    
    clang_add_observer(self, @selector(logInWithResult:), @"kLoginNotification", nil);
    //clang_remove_observer_v2(self, @"kLoginNotification", nil);
    //clang_remove_observer(self);
    clang_post_notification_name(@"kLoginNotification", @1);
    clang_post_notification_name_v2(@"kLoginNotification", nil, @{@"ret": @0});
}

- (void)run {
    NSLog(@"%s", __FUNCTION__);
}

- (void)runWithArg:(NSNumber *)arg {
    NSLog(@"%s, %d", __FUNCTION__, arg.intValue);
}

- (void)update {
    NSLog(@"%s", __FUNCTION__);
}

- (void)updateWithArg:(NSString *)arg {
    NSLog(@"%s, arg: %@", __FUNCTION__, arg);
}

- (void)logInWithResult:(NSNotification *)noti {
    NSLog(@"%s, %@", __FUNCTION__, noti.object ?: noti.userInfo);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
