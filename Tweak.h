#import <spawn.h>
#define kImagesPath @"/Library/Application Support/SamsungPowerDown"

/*
    Interface + create UIViewController for PowerDownView
*/
@interface SBAlert : UIViewController
@end

@interface SBPowerDownController : SBAlert
-(void)cancel;
-(void)showView;
@end

@interface FBSystemService : NSObject
+(id)sharedInstance;
-(void)shutdownAndReboot:(BOOL)arg1;
@end

/*
    Add some Objective-C variables
*/
UIView *mainView;
UIVisualEffectView *mainEffectView;
UIView *shutdownView;
UIView *respringView;
UIView *safemodeView;
UIView *rebootView;
UILabel *rebootLabel;
UILabel *respringLabel;
UILabel *shutdownLabel;
UILabel *safemodeLabel;

/*
    Add some C variables
*/
static int buttonSize = 0;

static float buttonFloat = 80;
static float buttonDistance1 = 80;
static float buttonDistance2 = 240;

static float labelSafemode = 180;
static float labelRespring = 20;
static float labelShutdown = 140;
static float labelReboot = 300;
