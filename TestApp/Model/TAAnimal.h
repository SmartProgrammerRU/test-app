#import <Foundation/Foundation.h>

// abstract
@interface TAAnimal : NSObject

@property (nonatomic, copy) NSString *kind;
@property (nonatomic, copy) NSString *food;
@property (nonatomic, copy) NSString *color;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *eat;

- (instancetype)initWithKind:(NSString *)kind nickname:(NSString *)nickname;
- (NSString *)introduce;

@end