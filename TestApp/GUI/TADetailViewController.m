#import "TADetailViewController.h"

@interface TADetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@end

@implementation TADetailViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   self.navigationController.navigationBarHidden = NO;
   [self updateUI];
}

- (void)viewWillDisappear:(BOOL)animated
{
   [super viewWillDisappear:animated];
   self.navigationController.navigationBarHidden = YES;
}

- (void)updateUI
{
   if (self.detailItem) {
       self.descriptionLabel.text = [self.detailItem introduce];
   }
}

@end