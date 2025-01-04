//
//  CUIBridge.h
//  Macver
//
//  Created by paige on 12/15/24.
//

#import "CoreGraphics/CGImage.h"
#import <Foundation/Foundation.h>

@interface CUINamedImage

@property (nonatomic, readonly, nullable) CGImageRef image;

@end

@interface CUICatalog : NSObject

- (nullable CUINamedImage*)imageWithName:(nonnull NSString *)arg1 scaleFactor:(double)arg2;
- (nullable instancetype)initWithURL:(nonnull NSURL *)arg1 error:(nullable NSError *)arg2;

@end
