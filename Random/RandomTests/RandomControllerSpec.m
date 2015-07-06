#import "Kiwi.h"
#import "RandomController.h"

SPEC_BEGIN(MathSpec)

describe(@"RandomController", ^{
    
    context(@"when init", ^{
        __block RandomController *randomController;
        
        beforeEach(^{
            randomController = [[RandomController alloc] init];
        });
        
        it(@"should have a NonNil textField", ^{
            [[randomController.textField should] beNonNil];
        });
    });
});

SPEC_END
