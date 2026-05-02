#import <Foundation/Foundation.h>
@interface Utility : NSObject
+ (NSArray *)sortArray:(NSArray *)array;
+ (NSInteger)sumOfArray:(NSArray *)array;
+ (NSDictionary *)countOccurrences:(NSArray *)array;
@end
@implementation Utility
+ (NSArray *)sortArray:(NSArray *)array {
    return [array sortedArrayUsingSelector:@selector(compare:)];
}
+ (NSInteger)sumOfArray:(NSArray *)array {
    NSInteger sum = 0;
    for (NSNumber *number in array) {
        sum += [number integerValue];
    }
    return sum;
}
+ (NSDictionary *)countOccurrences:(NSArray *)array {
    NSMutableDictionary *counts = [NSMutableDictionary dictionary];
    for (id item in array) {
        if (counts[item]) {
            counts[item] = @([counts[item] integerValue] + 1);
        } else {
            counts[item] = @(1);
        }
    }
    return [counts copy];
}
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *numbers = @[@1, @2, @3, @2, @1];
        NSArray *sorted = [Utility sortArray:numbers];
        NSInteger sum = [Utility sumOfArray:numbers];
        NSDictionary *counts = [Utility countOccurrences:numbers];
        NSLog(@"Sorted: %@", sorted);
        NSLog(@"Sum: %ld", (long)sum);
        NSLog(@"Counts: %@", counts);
    }
    return 0;
}
