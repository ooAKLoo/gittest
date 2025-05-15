//
//  CalculatorWrapper.h
//  swift_demo
//
//  Created by 杨东举 on 2025/4/15.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorWrapper : NSObject

- (instancetype)init;
- (double)addNumber:(double)a withNumber:(double)b;
- (double)subtractNumber:(double)a withNumber:(double)b;

@end

NS_ASSUME_NONNULL_END