#import "ObjCBIP158.h"

#import "blockfilter.h"

@interface BIP158 () {
    GCSFilter *_filter;
}

@end

@implementation BIP158

- (instancetype)initWithEncodedFilter:(NSData *)filter
{
    self = [super init];
    if (self) {
        std::vector<unsigned char> filter_vector;
        filter_vector.resize(filter.length);
        for(size_t i=0; i<filter.length; i++) {
            filter_vector[i] = ((const unsigned char *)filter.bytes)[i];
        }
        _filter = new GCSFilter({0, 0, 20, 1 << 20}, filter_vector);
    }
    return self;
}

- (BOOL)matchHash:(NSData *)hash
{
    GCSFilter::Element element(hash.length);
    for(int j=0;j<hash.length;j++)
    {
        element[j] = ((const uint8_t *)hash.bytes)[j];
    }

    return _filter->Match(element);
}

- (BOOL)matchAny:(NSArray<NSData *> *)hashes
{
    GCSFilter::ElementSet elements;
        
    for (int i = 0; i < hashes.count; ++i)
    {
        GCSFilter::Element element(hashes[i].length);
        for(int j=0;j<hashes[i].length;j++)
        {
            element[j] = ((const uint8_t *)hashes[i].bytes)[j];
        }
        elements.insert(std::move(element));
    }
    
    return _filter->MatchAny(elements);
}

@end
