#import "TAAnimal.h"

@implementation TAAnimal

- (instancetype)initWithKind:(NSString *)kind nickname:(NSString *)nickname
{
   if (self = [self init]) {
      _kind = kind;
      _nickname = nickname;
      _color = [self colorForAnimal];
   }
   
   return self;
}

// default
- (instancetype)init
{
   if (self = [super init]) {
      _kind = @"чебурашка";
      _nickname = @"не знаю как";
      _eat = @"не знаю как ем";
      _food = @"не знаю что";
   }
   
   return self;
}

- (NSString *)introduce
{
   NSString *color = !self.color ? [NSString stringWithFormat:@"мой цвет %@,", [self randomcolor]] : @"";
   return [NSString stringWithFormat:@"Привет, я %@, %@ меня зовут %@, я %@ %@", self.kind,
           color, self.nickname, self.eat, self.food];
}


#pragma mark - Helpers

- (NSString *)colorForAnimal
{
   NSString *color = nil;
   if ([self.kind isEqualToString:@"волк"] || [self.kind isEqualToString:@"заяц"]) {
      color = @"серый";
   } else if ([self.kind isEqualToString:@"лиса"]) {
      color = @"рыжий";
   }
   
   return color;
}

- (NSString *)randomcolor
{
   NSArray *availableColors = @[@"белый", @"желтый", @"синий", @"серый",
                                @"черный", @"черно-белый", @"черно-серый"];
   NSString *randomColor = availableColors[arc4random() % [availableColors count]];
   return randomColor;
}

@end