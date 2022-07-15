//
//  ProfessionalFinalRegistrationViewController.m
//  Ment
//
//  Created by Julia Navarro Goldaraz on 7/4/22.
//

#import "ProfessionalFinalRegistrationViewController.h"
#import "Parse/Parse.h"
#import "userTypeViewController.h"


@interface ProfessionalFinalRegistrationViewController ()

@end

@implementation ProfessionalFinalRegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void) registerProfessional{
    PFUser *newUser = [PFUser user];
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@" PFUser for professional registered successfully");
            PFObject *profesionals = [PFObject objectWithClassName:@"Professionals"];
            profesionals[@"userID" ] = newUser.objectId;
            profesionals[@"Name"] = self.nameField.text;
            profesionals[@"username"] = self.usernameField.text;
            profesionals[@"Description"] = self.descriptionField.text;
            [profesionals saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                if (succeeded){
                    NSLog(@"Professional registered sucessfully");
                    [self performSegueWithIdentifier:@"filterInfoSegue" sender:nil];
                }else{
                    NSLog(@"Professional registration failed");
                    [self displayMessageToUser:error.localizedDescription];
                    //there is a problem
                }
            }];
        }
    }];
}

- (void)displayMessageToUser:(NSString*)message {
     UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Message"
                                                                    message:message
                                                             preferredStyle:UIAlertControllerStyleAlert];
     UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
     popPresenter.sourceView = self.view;
     UIAlertAction *Okbutton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

     }];
     [alert addAction:Okbutton];
     popPresenter.sourceRect = self.view.frame;
     alert.modalPresentationStyle = UIModalPresentationPopover;
     [self presentViewController:alert animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signupButton:(id)sender {
    [self registerProfessional];
}
@end
