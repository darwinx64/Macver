//
//  ASIBridge.h
//  Macver
//
//  Created by tiramisu on 12/16/24.
//

#import "Cocoa/Cocoa.h"

CFStringRef ASI_CopyCurrentCPUDescription(void);
CFStringRef ASI_CopyCurrentRAMDescriptionWithType(void);
CFStringRef ASI_CopyFormattedSerialNumber(void);
