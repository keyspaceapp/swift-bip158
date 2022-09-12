#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BIP158 : NSObject

- (instancetype)initWithEncodedFilter:(NSData *)filter;

- (BOOL)matchHash:(NSData *)hash;
- (BOOL)matchAny:(NSArray<NSData *> *)hashes;

@end

NS_ASSUME_NONNULL_END
