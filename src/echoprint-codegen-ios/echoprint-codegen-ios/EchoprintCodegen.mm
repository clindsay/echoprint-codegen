#import "EchoprintCodegen.h"
#import "Codegen.h"

@interface EchoprintCodegen ()
{
    std::auto_ptr<Codegen> _codegen;
}

@end

@implementation EchoprintCodegen

- (instancetype) initWithPCM: (const float*) pcm numSamples: (unsigned int) numSamples startOffset: (int) startOffset
{
    if ( self = [super init] )
    {
        _codegen.reset(new Codegen(pcm, numSamples, startOffset));
    }
    
    return self;
}

- (NSString *) codeString
{
    std::string cppString = _codegen->getCodeString();
    NSString* objcString = [NSString stringWithCString:cppString.c_str() encoding:[NSString defaultCStringEncoding]];
    return objcString;
}

- (int) numCodes
{
    return _codegen->getNumCodes();
}

+ (double) version
{
    return Codegen::getVersion();
}

@end
