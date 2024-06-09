//
//  clang_api.h
//
//  Created by Tenfay on 15/8/14.
//  Copyright (c) Tenfay.
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

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/**
 *  比较同类型对象是否相等
 *
 *  @param obj1 对象1
 *  @param obj2 对象2
 *
 *  @return YES or NO
 */
FOUNDATION_EXPORT BOOL clang_equal(id obj1, id obj2);

/**
 *  比较字符串是否相等
 *
 *  @param str1 字符串1
 *  @param str2 字符串2
 *
 *  @return YES or NO
 */
FOUNDATION_EXPORT BOOL clang_equal_to_string(NSString *str1, NSString *str2);

/**
 *  选择器运行相应的方法
 *
 *  @param target 目标对象
 *  @param sel        SEL对象
 */
FOUNDATION_EXPORT void clang_perform_selector(id target, SEL sel);

/**
 *  选择器运行相应的方法
 *
 *  @param target 目标对象
 *  @param sel        SEL对象
 *  @param obj        参数对象
 */
FOUNDATION_EXPORT void clang_perform_selector_v2(id target, SEL sel, id obj);

/**
 *  选择器延时运行相应的方法
 *
 *  @param target 目标对象
 *  @param sel        SEL对象
 *  @param ti          延时时间
 */
FOUNDATION_EXPORT void clang_delay_perform_selector(id target, SEL sel, double ti);

/**
 *  选择器延时运行相应的方法
 *
 *  @param target 目标对象
 *  @param sel        SEL对象
 *  @param obj        参数对象
 *  @param ti          延时时间
 */
FOUNDATION_EXPORT void clang_delay_perform_selector_v2(id target, SEL sel, id obj, double ti);

/**
 *  返回图片(Main Bundle)
 *
 *  @param imgName 图片名称
 *
 *  @return An `UIImage` object
 */
UIKIT_EXTERN UIImage *clang_load_image(NSString *imgName);

/**
 *  返回图片
 *
 *  @param imgName    图片名称
 *  @param inDir        图片所在目录
 *  @param bundleName 不带扩展名的bundle名称, 如果bundleName为nil, 那么返回Main Bundle中的图片
 *
 *  @return An `UIImage` object
 */
UIKIT_EXTERN UIImage *clang_load_image_from_bundle(NSString *imgName, NSString *inDir, NSString *bundleName);

/**
 *  返回图片且数据不缓存内存, 如果找不到相应倍数(1x, 2x, 3x)的图片, 那么返回nil
 *
 *  @param imgName  图片名称
 *  @param ext           图片扩展名, 如果ext为nil, 那么ext默认为png
 *  @param inDir       图片所在目录
 *  @param bundleName 不带扩展名的bundle名称, 如果bundleName为nil, 那么返回Main Bundle中的图片
 *
 *  @return An `UIImage` object
 */
UIKIT_EXTERN UIImage *clang_image_with_contents_of_file(NSString *imgName, NSString *ext, NSString *inDir, NSString *bundleName);

/**
 *  获取资源文件路径
 *
 *  @param name       文件名称
 *  @param ext         文件扩展名
 *  @param inDir     文件所在目录
 *  @param bundleName 不带扩展名的bundle名称
 *
 *  @return An `NSString` object
 */
FOUNDATION_EXPORT NSString *clang_path_for_resource_from_bundle(NSString *name, NSString *ext, NSString *inDir, NSString *bundleName);

/**
 *  读取本地化字符串
 *
 *  @param key              字段
 *  @param tbl              strings文件名称, 如果文件名为Localizable.strings, 那么tbl为nil
 *  @param language   系统使用的语言
 *  @param inDir          文件所在目录
 *  @param bundleName 不带扩展名的bundle名称, 如果bundleName为nil, 那么从Main Bundle中读取内容
 *
 *  @return An `NSString` object
 */
FOUNDATION_EXPORT NSString *clang_localized_string(NSString *key, NSString *tbl, NSString *language, NSString *inDir, NSString *bundleName);

/**
 *  读取对象(UserDefaults)
 *
 *  @param key 字段
 *
 *  @return An `id` object
 */
FOUNDATION_EXPORT id clang_read_object(NSString *key);

/**
 *  存储对象(UserDefaults)
 *
 *  @param key          字段
 *  @param value      对象
 *  @param synchronized 是否同步
 */
FOUNDATION_EXPORT void clang_store_object(NSString *key, id value, BOOL synchronized);

/**
 *  移除对象(UserDefaults)
 *
 *  @param key          字段
 *  @param synchronized 是否同步
 */
FOUNDATION_EXPORT void clang_remove_object(NSString *key, BOOL synchronized);

/**
 *  添加通知观察者
 *
 *  @param observer 观察者
 *  @param sel            SEL对象
 *  @param name          通知名称
 *  @param object      参数对象
 */
FOUNDATION_EXPORT void clang_add_observer(id observer, SEL sel, NSString *name, id object);

/**
 *  移除通知观察者
 *
 *  @param observer  观察者
 */
FOUNDATION_EXPORT void clang_remove_observer(id observer);

/**
 *  移除通知观察者
 *
 *  @param observer  观察者
 *  @param name           通知名称
 *  @param object       参数对象
 */
FOUNDATION_EXPORT void clang_remove_observer_v2(id observer, NSString *name, id object);

/**
 *  发送通知
 *
 *  @param name      通知名称
 *  @param object  参数对象
 */
FOUNDATION_EXPORT void clang_post_notification_name(NSString *name, id object);

/**
 *  发送通知
 *
 *  @param name           通知名称
 *  @param object       参数对象
 *  @param userInfo   参数字典
 */
FOUNDATION_EXPORT void clang_post_notification_name_v2(NSString *name, id object, NSDictionary *userInfo);
