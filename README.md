# Usage:

# 获取bundle资源文件路径
	NSString *path = clang_path_for_resource_from_bundle(@"Info", @"plist", nil, @"Test");
	NSLog(@"info.plist - path:%@", path);
	NSLog(@"info.plist - content:%@", [NSDictionary dictionaryWithContentsOfFile:path]);

# 加载bundle中的图片
	UIImage *image = clang_load_image_from_bundle(@"angle-mask", @"angle-mask.bundle", @"Test");
	NSLog(@"image: %@", image);
	
# 加载bundle中的图片，不缓存
	UIImage *image2 = clang_image_with_contents_of_file(@"angle-mask", nil, @"angle-mask.bundle", @"Test");
	NSLog(@"image2: %@", image2);

# 获取main bundle中的资源文件路径
	NSString *path2 = clang_path_for_resource_from_bundle(@"Info", @"plist", nil, nil);
	NSLog(@"info.plist2 - path2:%@", path2);
	NSLog(@"info.plist2 - content2:%@", [NSDictionary dictionaryWithContentsOfFile:path2]);

# 加载main bundle中的图片，不缓存
	UIImage *image3 = clang_image_with_contents_of_file(@"angle-mask", nil, nil, nil);
	NSLog(@"image3: %@", image3);
	
# 读取本地化内容
	NSLog(@"localized_string: %@", clang_localized_string(@"Lan_network_timeout", nil, @"en", @"language", @"Test"));
