//
//  ViewController.m
//  clang_api
//
//  Created by Eastze on 15/8/14.
//  Copyright (c) 2015年 Eastze. All rights reserved.
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
	NSLog(@"info.plist - path:%@", path);
	NSLog(@"info.plist - content:%@", [NSDictionary dictionaryWithContentsOfFile:path]);
	
	UIImage *image = clang_load_image_from_bundle(@"angle-mask", @"angle-mask.bundle", @"Test");
	NSLog(@"image: %@", image);
	
	NSLog(@"localized_string: %@", clang_localized_string(@"Lan_network_timeout", nil, @"en", @"language", @"Test"));
	
	UIImage *image2 = clang_image_with_contents_of_file(@"angle-mask", nil, @"angle-mask.bundle", @"Test");
	NSLog(@"image2: %@", image2);
	
	NSString *path2 = clang_path_for_resource_from_bundle(@"Info", @"plist", nil, nil);
	NSLog(@"info.plist2 - path2:%@", path2);
	NSLog(@"info.plist2 - content2:%@", [NSDictionary dictionaryWithContentsOfFile:path2]);
	
	UIImage *image3 = clang_image_with_contents_of_file(@"angle-mask", nil, nil, nil);
	NSLog(@"image3: %@", image3);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
