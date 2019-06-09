#line 1 "Tweak.x"







#import "Tweak.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBPowerDownController; 
static void (*_logos_orig$_ungrouped$SBPowerDownController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$showView(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$safemodeAct(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$cancelSafemode(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$safemodeDo(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$respringAct(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$cancelRespring(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$respringDo(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$shutdownAct(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$cancelShutdown(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$shutdownDo(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$rebootAct(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$cancelReboot(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$rebootDo(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$close(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); 

#line 10 "Tweak.x"

static void _logos_method$_ungrouped$SBPowerDownController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	[self showView];
}


static void _logos_method$_ungrouped$SBPowerDownController$showView(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	


	mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	mainEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
	mainEffectView.frame = mainView.bounds;
	mainEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
	


	safemodeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonFloat, buttonFloat)];
	safemodeView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-buttonDistance2);
	UITapGestureRecognizer *safemodeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(safemodeAct)];
	[safemodeView addGestureRecognizer:safemodeTap];

	NSString *safemodeImagePath = [kImagesPath stringByAppendingPathComponent:@"safemode.png"];
	UIImage *safemodeImage = [[UIImage alloc] initWithContentsOfFile:safemodeImagePath];
	UIImageView *safemodeImageView = [[UIImageView alloc] initWithImage:safemodeImage];
	safemodeImageView.frame = safemodeView.bounds;

	safemodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
	safemodeLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-labelSafemode);
	[safemodeLabel setText:@"Safe Mode"];
	[safemodeLabel setTextColor:[UIColor whiteColor]];
	safemodeLabel.textAlignment = NSTextAlignmentCenter;
	safemodeLabel.adjustsFontSizeToFitWidth = YES;
	safemodeLabel.numberOfLines = 1;

	


	respringView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonFloat, buttonFloat)];
	respringView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-buttonDistance1);
	UITapGestureRecognizer *respringTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respringAct)];
	[respringView addGestureRecognizer:respringTap];
	
	NSString *respringImagePath = [kImagesPath stringByAppendingPathComponent:@"respring.png"];
	UIImage *respringImage = [[UIImage alloc] initWithContentsOfFile:respringImagePath];
	UIImageView *respringImageView = [[UIImageView alloc] initWithImage:respringImage];
	respringImageView.frame = respringView.bounds;

	respringLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
	respringLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-labelRespring);
	[respringLabel setText:@"Respring"];
	[respringLabel setTextColor:[UIColor whiteColor]];
	respringLabel.textAlignment = NSTextAlignmentCenter;
	respringLabel.adjustsFontSizeToFitWidth = YES;
	respringLabel.numberOfLines = 1;

	


	shutdownView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonFloat, buttonFloat)];
	shutdownView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+buttonDistance1);
	UITapGestureRecognizer *shutdownTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shutdownAct)];
	[shutdownView addGestureRecognizer:shutdownTap];

	NSString *shutdownImagePath = [kImagesPath stringByAppendingPathComponent:@"shutdown.png"];
	UIImage *shutdownImage = [[UIImage alloc] initWithContentsOfFile:shutdownImagePath];
	UIImageView *shutdownImageView = [[UIImageView alloc] initWithImage:shutdownImage];
	shutdownImageView.frame = shutdownView.bounds;
	
	shutdownLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
	shutdownLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+labelShutdown);
	[shutdownLabel setText:@"Power Off"];
	[shutdownLabel setTextColor:[UIColor whiteColor]];
	shutdownLabel.textAlignment = NSTextAlignmentCenter;
	shutdownLabel.adjustsFontSizeToFitWidth = YES;
	shutdownLabel.numberOfLines = 1;

	


	rebootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonFloat, buttonFloat)];
	rebootView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+buttonDistance2);
	UITapGestureRecognizer *rebootTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rebootAct)];
	[rebootView addGestureRecognizer:rebootTap];

	NSString *rebootImagePath = [kImagesPath stringByAppendingPathComponent:@"reboot.png"];
	UIImage *rebootImage = [[UIImage alloc] initWithContentsOfFile:rebootImagePath];
	UIImageView *rebootImageView = [[UIImageView alloc] initWithImage:rebootImage];
	rebootImageView.frame = rebootView.bounds;

	rebootLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
	rebootLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+labelReboot);
	[rebootLabel setText:@"Reboot"];
	[rebootLabel setTextColor:[UIColor whiteColor]];
	rebootLabel.textAlignment = NSTextAlignmentCenter;
	rebootLabel.adjustsFontSizeToFitWidth = YES;
	rebootLabel.numberOfLines = 1;

	


	mainView.alpha = 0.0f;
	self.view = mainView;
	[UIView animateWithDuration:0.25 animations:^()
	{
		[mainView addSubview:mainEffectView];
		[mainView addSubview:safemodeView];
		[mainView addSubview:safemodeLabel];
		[safemodeView addSubview:safemodeImageView];
		[mainView addSubview:respringView];
		[mainView addSubview:respringLabel];
		[respringView addSubview:respringImageView];
		[mainView addSubview:shutdownView];
		[mainView addSubview:shutdownLabel];
		[shutdownView addSubview:shutdownImageView];
		[mainView addSubview:rebootView];
		[mainView addSubview:rebootLabel];
		[rebootView addSubview:rebootImageView];
		self.view.alpha = 1.0f;
	}
	completion:nil];
}





static void _logos_method$_ungrouped$SBPowerDownController$safemodeAct(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelSafemode)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		safemodeView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-45);
		safemodeLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+45);
		safemodeView.transform = CGAffineTransformMakeScale(1.5, 1.5);
		safemodeLabel.transform = CGAffineTransformMakeScale(1.5, 1.5);
		mainView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];

		shutdownView.alpha = 0.0f;
		respringView.alpha = 0.0f;
		rebootView.alpha = 0.0f;
		rebootLabel.alpha = 0.0f;
		respringLabel.alpha = 0.0f;
		shutdownLabel.alpha = 0.0f;

		UITapGestureRecognizer *safemodeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(safemodeDo)];
		[safemodeView addGestureRecognizer:safemodeTap];
	}
	completion:nil];
}


static void _logos_method$_ungrouped$SBPowerDownController$cancelSafemode(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		safemodeView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-buttonDistance2);
		safemodeLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-labelSafemode);
		safemodeView.transform = CGAffineTransformMakeScale(1.0, 1.0);
		safemodeLabel.transform = CGAffineTransformMakeScale(1.0, 1.0);
		mainView.backgroundColor = [UIColor clearColor];

		shutdownView.alpha = 1.0f;
		respringView.alpha = 1.0f;
		rebootView.alpha = 1.0f;
		rebootLabel.alpha = 1.0f;
		respringLabel.alpha = 1.0f;
		shutdownLabel.alpha = 1.0f;

		UITapGestureRecognizer *safemodeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(safemodeAct)];
		[safemodeView addGestureRecognizer:safemodeTap];
	}
	completion:nil];
}


static void _logos_method$_ungrouped$SBPowerDownController$safemodeDo(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	pid_t pid;
    const char* args[] = {"killall", "-SEGV", "SpringBoard", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
}





static void _logos_method$_ungrouped$SBPowerDownController$respringAct(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelRespring)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		respringView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-45);
		respringLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+45);
		respringView.transform = CGAffineTransformMakeScale(1.5, 1.5);
		respringLabel.transform = CGAffineTransformMakeScale(1.5, 1.5);
		mainView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];

		shutdownView.alpha = 0.0f;
		safemodeView.alpha = 0.0f;
		rebootView.alpha = 0.0f;
		rebootLabel.alpha = 0.0f;
		shutdownLabel.alpha = 0.0f;
		safemodeLabel.alpha = 0.0f;

		UITapGestureRecognizer *respringTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respringDo)];
		[respringView addGestureRecognizer:respringTap];
	}
	completion:nil];
}


static void _logos_method$_ungrouped$SBPowerDownController$cancelRespring(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		respringView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-buttonDistance1);
		respringLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-labelRespring);
		respringView.transform = CGAffineTransformMakeScale(1.0, 1.0);
		respringLabel.transform = CGAffineTransformMakeScale(1.0, 1.0);
		mainView.backgroundColor = [UIColor clearColor];

		shutdownView.alpha = 1.0f;
		safemodeView.alpha = 1.0f;
		rebootView.alpha = 1.0f;
		rebootLabel.alpha = 1.0f;
		shutdownLabel.alpha = 1.0f;
		safemodeLabel.alpha = 1.0f;

		UITapGestureRecognizer *respringTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respringAct)];
		[respringView addGestureRecognizer:respringTap];
	}
	completion:nil];
}


static void _logos_method$_ungrouped$SBPowerDownController$respringDo(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	pid_t pid;
    const char* args[] = {"killall", "-9", "SpringBoard", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
}





static void _logos_method$_ungrouped$SBPowerDownController$shutdownAct(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelShutdown)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		shutdownView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-45);
		shutdownLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+45);
		shutdownView.transform = CGAffineTransformMakeScale(1.5, 1.5);
		shutdownLabel.transform = CGAffineTransformMakeScale(1.5, 1.5);
		mainView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];

		respringView.alpha = 0.0f;
		safemodeView.alpha = 0.0f;
		rebootView.alpha = 0.0f;
		rebootLabel.alpha = 0.0f;
		respringLabel.alpha = 0.0f;
		safemodeLabel.alpha = 0.0f;

		UITapGestureRecognizer *shutdownTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shutdownDo)];
		[shutdownView addGestureRecognizer:shutdownTap];
	}
	completion:nil];
}


static void _logos_method$_ungrouped$SBPowerDownController$cancelShutdown(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		shutdownView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+buttonDistance1);
		shutdownLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+labelShutdown);
		shutdownView.transform = CGAffineTransformMakeScale(1.0, 1.0);
		shutdownLabel.transform = CGAffineTransformMakeScale(1.0, 1.0);
		mainView.backgroundColor = [UIColor clearColor];

		respringView.alpha = 1.0f;
		safemodeView.alpha = 1.0f;
		rebootView.alpha = 1.0f;
		rebootLabel.alpha = 1.0f;
		respringLabel.alpha = 1.0f;
		safemodeLabel.alpha = 1.0f;

		UITapGestureRecognizer *shutdownTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shutdownAct)];
		[shutdownView addGestureRecognizer:shutdownTap];
	}
	completion:nil];
}


static void _logos_method$_ungrouped$SBPowerDownController$shutdownDo(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	[[objc_getClass("FBSystemService") sharedInstance] shutdownAndReboot:NO];
}





static void _logos_method$_ungrouped$SBPowerDownController$rebootAct(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelReboot)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		rebootView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-45);
		rebootLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+45);
		rebootView.transform = CGAffineTransformMakeScale(1.5, 1.5);
		rebootLabel.transform = CGAffineTransformMakeScale(1.5, 1.5);
		mainView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];

		shutdownView.alpha = 0.0f;
		respringView.alpha = 0.0f;
		safemodeView.alpha = 0.0f;
		respringLabel.alpha = 0.0f;
		shutdownLabel.alpha = 0.0f;
		safemodeLabel.alpha = 0.0f;

		UITapGestureRecognizer *rebootTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rebootDo)];
		[rebootView addGestureRecognizer:rebootTap];
	}
	completion:nil];
}


static void _logos_method$_ungrouped$SBPowerDownController$cancelReboot(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		rebootView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+buttonDistance2);
		rebootLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+labelReboot);
		rebootView.transform = CGAffineTransformMakeScale(1.0, 1.0);
		rebootLabel.transform = CGAffineTransformMakeScale(1.0, 1.0);
		mainView.backgroundColor = [UIColor clearColor];

		shutdownView.alpha = 1.0f;
		respringView.alpha = 1.0f;
		safemodeView.alpha = 1.0f;
		respringLabel.alpha = 1.0f;
		shutdownLabel.alpha = 1.0f;
		safemodeLabel.alpha = 1.0f;

		UITapGestureRecognizer *rebootTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rebootAct)];
		[rebootView addGestureRecognizer:rebootTap];
	}
	completion:nil];
}


static void _logos_method$_ungrouped$SBPowerDownController$rebootDo(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	[[objc_getClass("FBSystemService") sharedInstance] shutdownAndReboot:YES];
}






static void _logos_method$_ungrouped$SBPowerDownController$close(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	[UIView animateWithDuration:0.25 animations:^()
	{
		self.view.alpha = 0.0f;
	}
	completion:^ (BOOL finished) {
	  if (finished) {
	   		[self cancel];
		}
	}];
}


void reloadPreferences() {
	NSMutableDictionary *getpref = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/private/var/mobile/Library/Preferences/com.devntnghia.sspd.plist"];
	
	buttonSize = [([getpref objectForKey:@"buttonSize"] ?: @(0)) intValue];
	labelEnabled = [([getpref objectForKey:@"labelEnabled"] ?: @(YES)) boolValue];
	
	if (buttonSize == 0) {
		buttonFloat = 80;
		buttonDistance1 = 80;
		buttonDistance2 = 240;
	}
	else if (buttonSize == 1) {
		buttonFloat = 70;
		buttonDistance1 = 70;
		buttonDistance2 = 210;

		labelSafemode = 150;
		labelRespring = 10;
		labelShutdown = 130;
		labelReboot = 270;
	}
	else if (buttonSize == 2) {
		buttonFloat = 60;
		buttonDistance1 = 60;
		buttonDistance2 = 180;
		
		labelSafemode = 130;
		labelRespring = 10;
		labelShutdown = 110;
		labelReboot = 230;
	}

	if (labelEnabled == NO) {
		labelWidth = 0;
		labelHeight = 0;
	}

}




static __attribute__((constructor)) void _logosLocalCtor_6d6cac4b(int __unused argc, char __unused **argv, char __unused **envp) {
	reloadPreferences();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPreferences, CFSTR("com.devntnghia.sspd.preferencechanged"), NULL, kNilOptions);
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBPowerDownController = objc_getClass("SBPowerDownController"); MSHookMessageEx(_logos_class$_ungrouped$SBPowerDownController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SBPowerDownController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SBPowerDownController$viewDidLoad);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(showView), (IMP)&_logos_method$_ungrouped$SBPowerDownController$showView, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(safemodeAct), (IMP)&_logos_method$_ungrouped$SBPowerDownController$safemodeAct, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(cancelSafemode), (IMP)&_logos_method$_ungrouped$SBPowerDownController$cancelSafemode, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(safemodeDo), (IMP)&_logos_method$_ungrouped$SBPowerDownController$safemodeDo, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(respringAct), (IMP)&_logos_method$_ungrouped$SBPowerDownController$respringAct, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(cancelRespring), (IMP)&_logos_method$_ungrouped$SBPowerDownController$cancelRespring, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(respringDo), (IMP)&_logos_method$_ungrouped$SBPowerDownController$respringDo, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(shutdownAct), (IMP)&_logos_method$_ungrouped$SBPowerDownController$shutdownAct, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(cancelShutdown), (IMP)&_logos_method$_ungrouped$SBPowerDownController$cancelShutdown, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(shutdownDo), (IMP)&_logos_method$_ungrouped$SBPowerDownController$shutdownDo, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(rebootAct), (IMP)&_logos_method$_ungrouped$SBPowerDownController$rebootAct, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(cancelReboot), (IMP)&_logos_method$_ungrouped$SBPowerDownController$cancelReboot, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(rebootDo), (IMP)&_logos_method$_ungrouped$SBPowerDownController$rebootDo, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBPowerDownController, @selector(close), (IMP)&_logos_method$_ungrouped$SBPowerDownController$close, _typeEncoding); }} }
#line 428 "Tweak.x"
