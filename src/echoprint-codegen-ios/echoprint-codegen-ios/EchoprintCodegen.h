#import <Foundation/Foundation.h>

@interface EchoprintCodegen : NSObject

- (instancetype) initWithPCM: (const float*) pcm numSamples: (unsigned int) numSamples startOffset: (int) startOffset;

- (NSString *) codeString;
- (int) numCodes;
+ (double) version;

@end
