//
//  NSURLRequest+NSURLProtocolExtension.m
//  JLWebView
//
//  Created by liJiang on 2017/10/28.
//  Copyright © 2017年 liJiang. All rights reserved.
//

#import "NSURLRequest+NSURLProtocolExtension.h"

@implementation NSURLRequest (NSURLProtocolExtension)
- (NSURLRequest *)httpdns_getPostRequestIncludeBody {
    return [[self httpdns_getMutablePostRequestIncludeBody] copy];
}
- (NSMutableURLRequest *)httpdns_getMutablePostRequestIncludeBody {
    NSMutableURLRequest * req = [self mutableCopy];
    if ([self.HTTPMethod isEqualToString:@"POST"]) {
        if (!self.HTTPBody) {
            uint8_t d[1024] = {0};
            NSInputStream *stream = self.HTTPBodyStream;
            NSMutableData *data = [[NSMutableData alloc] init];
            [stream open];
            while ([stream hasBytesAvailable]) {
                NSInteger len = [stream read:d maxLength:1024];
                if (len > 0 && stream.streamError == nil) {
                    [data appendBytes:(void *)d length:len];
                }
            }
            req.HTTPBody = [data copy];
            [stream close];
        }
    }
    return req;
}
@end
