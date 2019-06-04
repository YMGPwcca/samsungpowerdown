/*
	The heart of the tweak!
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

#define kImagesPath @"/Library/Application Support/SamsungPowerDown"

/*
    Add some variables
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

static int buttonSize = 0;
static float buttonFloat = 80;
static float buttonDistance1 = 80;
static float buttonDistance2 = 240;

static float labelDistance1 = 180;
static float labelDistance2 = 20;
static float labelDistance3 = 140;
static float labelDistance4 = 300;
