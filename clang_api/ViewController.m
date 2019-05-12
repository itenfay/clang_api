//
//  ViewController.m
//  clang_api
//
//  Created by dyf on 15/8/14.
//  Copyright (c) 2015年 dyf. All rights reserved.
//

#import "ViewController.h"
#import "clang_api.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
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
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
