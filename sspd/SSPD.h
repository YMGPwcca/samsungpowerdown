//Import everything inside PSViewController
#import <Preferences/PSViewController.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSListItemsController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSSliderTableCell.h>
#import <Preferences/PSSwitchTableCell.h>
#import <Preferences/PSTableCell.h>
#import <spawn.h>

//Define things to make Tweak more stable and code more shorter
#define kPrefsBundlePath @"/Library/PreferenceBundles/sspd.bundle"

//Interface everything to make Implementation work
@interface SSPDBanner : PSTableCell
@property (nonatomic, strong) UIImageView *logoView;
@end

@interface SSPD : PSListController
@end
