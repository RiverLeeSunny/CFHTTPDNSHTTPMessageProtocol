//
//  NSURLRequest+NSURLProtocolExtension.h
//  JLWebView
//
//  Created by liJiang on 2017/10/28.
//  Copyright © 2017年 liJiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (NSURLProtocolExtension)
- (NSURLRequest *)httpdns_getPostRequestIncludeBody;
@end
