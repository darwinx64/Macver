//
//  ASBridge.h
//  Macver
//
//  Created by tiramisu on 12/17/24.
//

#import "Cocoa/Cocoa.h"

@interface ASPlatformInfo

@property (nonnull, nonatomic, class, readonly) ASPlatformInfo *shared;
@property (nonnull, nonatomic, readonly) NSString *osTitleString;
@property (nonnull, nonatomic, readonly) NSString *osBuildString;

@end

@interface ASDisplayHardwareInfo

@property (nonnull, nonatomic, class, readonly) ASDisplayHardwareInfo *shared;
@property (nullable, nonatomic, readonly) NSString *mainGfxDisplayName;

@end
