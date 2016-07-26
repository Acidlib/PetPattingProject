//
//  PreferenceViewController.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/16/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "PreferenceViewController.h"
#import "SWRevealViewController.h"
#import "BreedsCell.h"
#import "PetColor.h"

@interface PreferenceViewController ()<UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *sizeTextField;
@property (nonatomic, weak) IBOutlet UITextField *lengthTextField;
@property (nonatomic, weak) IBOutlet UITextField *weightTextField;
@property (nonatomic, weak) IBOutlet UITextField *colorTextField;

@end

@implementation PreferenceViewController
{
    NSArray *arrayOfBreedsImage;
    NSArray *arrayOfBreedsDescription;
}
static NSString * const reuseIdentifier = @"BreedsCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUIAttribute];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)setupUIAttribute
{
    // Hamburger btn
    _backButtonOfPref.target = self.revealViewController;
    _backButtonOfPref.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    // GIF
    _catTypeImage.image = [UIImage animatedImageNamed:@"icn-fur-y-" duration:1.0f];

    // Bounce
    _scrollView.bounces = NO;
    
}

#pragma mark - Configuration

- (void)configureTextField {
    self.sizeTextField.placeholder = NSLocalizedString(@"Small / Mediem / Large", nil);
    self.sizeTextField.autocorrectionType = UITextAutocorrectionTypeYes;
    self.sizeTextField.returnKeyType = UIReturnKeyDone;
    self.sizeTextField.clearButtonMode = UITextFieldViewModeNever;

    self.lengthTextField.placeholder = NSLocalizedString(@"Centimeter (cm)", nil);
    self.lengthTextField.autocorrectionType = UITextAutocorrectionTypeYes;
    self.lengthTextField.returnKeyType = UIReturnKeyDone;
    self.lengthTextField.clearButtonMode = UITextFieldViewModeNever;

    self.weightTextField.placeholder = NSLocalizedString(@"Kilogram (Kg)", nil);
    self.weightTextField.autocorrectionType = UITextAutocorrectionTypeYes;
    self.weightTextField.returnKeyType = UIReturnKeyDone;
    self.weightTextField.clearButtonMode = UITextFieldViewModeNever;

    self.colorTextField.placeholder = NSLocalizedString(@"Color Name", nil);
    self.colorTextField.autocorrectionType = UITextAutocorrectionTypeYes;
    self.colorTextField.returnKeyType = UIReturnKeyDone;
    self.colorTextField.clearButtonMode = UITextFieldViewModeNever;

}

#pragma mark - Keyboard Event Notifications

- (void)handleKeyboardNotification:(NSNotification *)notification {
//    NSDictionary *userInfo = notification.userInfo;
//
//    // Get information about the animation.
//    NSTimeInterval animationDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    UIViewAnimationOptions animationCurve = [userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
//
//    // Convert the keyboard frame from screen to view coordinates.
//    CGRect keyboardScreenBeginFrame = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
//    CGRect keyboardScreenEndFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//
//    CGRect keyboardViewBeginFrame = [self.view convertRect:keyboardScreenBeginFrame fromView:self.view.window];
//    CGRect keyboardViewEndFrame = [self.view convertRect:keyboardScreenEndFrame fromView:self.view.window];
//
//    // Determine how far the keyboard has moved up or down.
//    CGFloat originDelta = keyboardViewEndFrame.origin.y - keyboardViewBeginFrame.origin.y;
//
//    // Calculate new scroll indicator and content insets for the table view.
//    UIEdgeInsets newIndicatorInsets = self.PrefTableView.scrollIndicatorInsets;
//    newIndicatorInsets.bottom -= originDelta;
//
//    UIEdgeInsets newContentInsets = self.PrefTableView.contentInset;
//    newContentInsets.bottom -= originDelta;
//
//    // Update the insets on the table view with the new values.
//    self.PrefTableView.scrollIndicatorInsets = newIndicatorInsets;
//    self.PrefTableView.contentInset = newContentInsets;
//
//    // Inform the view that its the layout should be updated.
//    [self.view setNeedsLayout];
//
//    // Animate updating the view's layout by calling `layoutIfNeeded` inside a `UIView` animation block.
//    UIViewAnimationOptions animationOptions = animationCurve | UIViewAnimationOptionBeginFromCurrentState;
//    [UIView animateWithDuration:animationDuration delay:0 options:animationOptions animations:^{
//        [self.view layoutIfNeeded];
//    } completion:nil];
}

#pragma mark - UITextFieldDelegate (set in Interface Builder)

//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [textField resignFirstResponder];
//
//    return YES;
//}


# pragma mark - TableView (Table view to describe preference items)

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.prefType count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *breedsIdentifier = @"BreedsIdentifier";
    UITableViewCell *prefbreadscell = [tableView dequeueReusableCellWithIdentifier:breedsIdentifier];
    if (prefbreadscell == nil){
        prefbreadscell = [[ UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:breedsIdentifier];
    }
    prefbreadscell.textLabel.text = self.prefType[indexPath.row];
    prefbreadscell.detailTextLabel.text = self.detailType[indexPath.row];

    prefbreadscell.textLabel.textColor = [UIColor grayColor];
    prefbreadscell.textLabel.font = [UIFont systemFontOfSize:16];

    return prefbreadscell;

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [arrayOfBreedsImage count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    BreedsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [[cell breedsImage]setImage:[UIImage imageNamed:[arrayOfBreedsImage objectAtIndex:indexPath.item]]];
    [[cell breedsDescription]setText:[arrayOfBreedsDescription objectAtIndex:indexPath.item]];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

-(void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{

}

-(void) collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{

}

-(void) collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
