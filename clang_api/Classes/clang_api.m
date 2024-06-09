//
//  clang_api.m
//
//  Created by Tenfay on 15/8/14.
//  Copyright (c) 2015 Tenfay.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "clang_api.h"

void clang_perform_selector_v2(id target, SEL sel, id obj);
void clang_delay_perform_selector_v2(id target, SEL sel, id obj, double ti);

#define CLANG_EMPTY_STR  @""
#define BUNDLE_EXTENSION @"bundle"
#define LANGKIT_TYPE     @"lproj"

NSBundle *clang_bundle(NSString *bundleName) {
    NSString *path = [[NSBundle mainBundle] pathForResource:bundleName ofType:BUNDLE_EXTENSION];
    return [NSBundle bundleWithPath:path];
}

BOOL clang_equal(id obj1, id obj2) {
    return [obj1 isEqual:obj2];
}

BOOL clang_equal_to_string(NSString *str1, NSString *str2) {
    return [str1 isEqualToString:str2];
}

void clang_perform_selector(id target, SEL sel) {
    clang_perform_selector_v2(target, sel, nil);
}

void clang_perform_selector_v2(id target, SEL sel, id obj) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [target performSelector:sel withObject:obj];
#pragma clang diagnostic pop
}

void clang_delay_perform_selector(id target, SEL sel, double ti) {
    clang_delay_perform_selector_v2(target, sel, nil, ti);
}

void clang_delay_perform_selector_v2(id target, SEL sel, id obj, double ti) {
    [target performSelector:sel withObject:obj afterDelay:ti];
}

UIImage *clang_load_image(NSString *imgName) {
    return [UIImage imageNamed:imgName];
}

UIImage *clang_load_image_from_bundle(NSString *imgName, NSString *inDir, NSString *bundleName) {
    NSString *subpath = imgName;
    if (bundleName) {
        NSString *bundleFullName = [bundleName stringByAppendingPathExtension:BUNDLE_EXTENSION];
        if (inDir) {
            subpath = [inDir stringByAppendingPathComponent:subpath];
        }
        subpath = [bundleFullName stringByAppendingPathComponent:subpath];
    }
    return [UIImage imageNamed:subpath];
}

UIImage *clang_image_with_contents_of_file(NSString *imgName, NSString *ext, NSString *inDir, NSString *bundleName) {
    NSString *subpath = imgName;
    NSString *newExt = ext ? ext : @"png";
    int scale = (int)[UIScreen mainScreen].scale;
    if (scale > 1) {
        subpath = [subpath stringByAppendingFormat:@"@%dx.%@", scale, newExt];
    } else {
        subpath = [subpath stringByAppendingFormat:@".%@", newExt];
    }
    if (bundleName) {
        NSBundle *bundle = clang_bundle(bundleName);
        if (inDir) {
            subpath = [inDir stringByAppendingPathComponent:subpath];
        }
        subpath = [[bundle bundlePath] stringByAppendingPathComponent:subpath];
    }
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if (![fileMgr fileExistsAtPath:subpath]) {
        subpath = clang_path_for_resource_from_bundle(imgName, newExt, inDir, bundleName);
    }
    
    return [UIImage imageWithContentsOfFile:subpath];
}

NSString *clang_path_for_resource_from_bundle(NSString *name, NSString *ext, NSString *inDir, NSString *bundleName) {
    NSString *subpath = name;
    if (bundleName) {
        NSBundle *bundle = clang_bundle(bundleName);
        if (ext) {
            subpath = [subpath stringByAppendingPathExtension:ext];
        }
        if (inDir) {
            subpath = [inDir stringByAppendingPathComponent:subpath];
        }
        return [[bundle bundlePath] stringByAppendingPathComponent:subpath];
    }
    return [[NSBundle mainBundle] pathForResource:name ofType:ext];
}

NSString *clang_localized_string(NSString *key, NSString *tbl, NSString *language, NSString *inDir, NSString *bundleName) {
    if (bundleName) {
        NSString *path = nil;
        NSBundle *bundle = clang_bundle(bundleName);
        if (inDir) {
            path = [bundle pathForResource:language ofType:LANGKIT_TYPE inDirectory:inDir];
        } else {
            path = [bundle pathForResource:language ofType:LANGKIT_TYPE];
        }
        bundle = [NSBundle bundleWithPath:path];
        return [bundle localizedStringForKey:key value:CLANG_EMPTY_STR table:tbl];
    }
    return NSLocalizedStringFromTable(key, tbl, nil);
}

id clang_read_object(NSString *key) {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

void clang_store_object(NSString *key, id value, BOOL synchronized) {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    if (synchronized) {
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

void clang_remove_object(NSString *key, BOOL synchronized) {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    if (synchronized) {
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

void clang_add_observer(id observer, SEL sel, NSString *name, id object) {
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:sel name:name object:object];
}

void clang_remove_observer(id observer) {
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

void clang_remove_observer_v2(id observer, NSString *name, id object) {
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:name object:object];
}

void clang_post_notification_name(NSString *name, id object) {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object];
}

void clang_post_notification_name_v2(NSString *name, id object, NSDictionary *userInfo) {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
}
