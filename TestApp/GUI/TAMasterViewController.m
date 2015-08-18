#import "TAMasterViewController.h"
#import "TADetailViewController.h"

static NSString *const cellIdentifier = @"MyCell";
static NSString *const kDetailSegue =  @"showDetail";
static NSString *const kCachedObjects =  @"cachedObjects";

@interface TAMasterViewController () <UITableViewDataSource, UITableViewDelegate>
@property NSArray *objects;
@end

@implementation TAMasterViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
   [self setupData];
}

// hardcoded data
- (void)setupData
{
   if (!self.objects) {
      self.objects = [[NSMutableArray alloc] init];
   }
   
   TAMilkAnimal *cat = [[TAMilkAnimal alloc] initWithKind:@"кот" nickname:@"леопольд"];
   TAMilkAnimal *cat2 = [[TAMilkAnimal alloc] initWithKind:@"кот" nickname:@"хитрый кот"];
   TAMilkAnimal *dog = [[TAMilkAnimal alloc] initWithKind:@"собака"  nickname:@"собачка"];
   TAMilkAnimal *dog2 = [[TAMilkAnimal alloc] initWithKind:@"собака"  nickname:@"дворняжка"];
   TAMilkAnimal *caw = [[TAMilkAnimal alloc] initWithKind:@"корова"  nickname:@"коровка"];
   TAMeetAnimal *wolf = [[TAMeetAnimal alloc] initWithKind:@"волк"  nickname:@"серый волк"];
   TAMeetAnimal *wolf2 = [[TAMeetAnimal alloc] initWithKind:@"волк"  nickname:@"белый волк"];
   TAMeetAnimal *lisa = [[TAMeetAnimal alloc] initWithKind:@"лиса"  nickname:@"патрикеевна"];
   TAMeetAnimal *lisa2 = [[TAMeetAnimal alloc] initWithKind:@"лиса"  nickname:@"хитрая"];
   TAGrassAnimal *rabbit = [[TAGrassAnimal alloc] initWithKind:@"заяц" nickname:@"белый"];
   TAGrassAnimal *horse = [[TAGrassAnimal alloc] initWithKind:@"лошадь"  nickname:@"лошадка"];
   TAGrassAnimal *horse2 = [[TAGrassAnimal alloc] initWithKind:@"лошадь"  nickname:@"тягач"];
   TAAnimal *chebyrashka = [[TAAnimal alloc] init];

   self.objects = @[cat, cat2, dog, dog2, caw, wolf, wolf2, lisa, lisa2, rabbit, horse, horse2, chebyrashka];
}


#pragma mark - UITableView Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return [self.objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
   
   if (!cell) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
   }
   
   cell.backgroundColor = [UIColor clearColor];
   cell.textLabel.textAlignment = NSTextAlignmentCenter;
   cell.textLabel.font = [UIFont systemFontOfSize:14];
   cell.textLabel.numberOfLines = 0;

   TAAnimal *animal = self.objects[indexPath.row];
   cell.textLabel.text = [NSString stringWithFormat:@"%@\n%@", [animal nickname], [animal kind]];

   return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   TADetailViewController *detailVC = (TADetailViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"TADetailViewController"];
   TAAnimal *animal = self.objects[indexPath.row];
   [detailVC setDetailItem:animal];

   [self.navigationController pushViewController:detailVC animated:YES];
}

@end