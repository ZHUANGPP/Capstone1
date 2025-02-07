//
//  DetailFeedViewController.h
//  Ment
//
//  Created by Julia Navarro Goldaraz on 7/5/22.
//

#import <UIKit/UIKit.h>
#import "Profile.h"
#import "Parse/Parse.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailFeedViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *detailName;
@property (weak, nonatomic) IBOutlet UILabel *detailUsername;

@property (strong, nonatomic) Profile *profile;

@end

NS_ASSUME_NONNULL_END
