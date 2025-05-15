//
//  CalculatorWrapper.m
//  swift_demo
//
//  Created by 杨东举 on 2025/4/15.
//


#import "CalculatorWrapper.h"
#include "Calculator.hpp"

@implementation CalculatorWrapper {
    Calculator* _calculator;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _calculator = new Calculator();
    }
    return self;
}

- (void)dealloc {
    delete _calculator;
}

- (double)addNumber:(double)a withNumber:(double)b {
    return _calculator->add(a, b);
}

- (double)subtractNumber:(double)a withNumber:(double)b {
    return _calculator->subtract(a, b);
}

@end