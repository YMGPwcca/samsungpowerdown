/*
	Developed by DevNTNghia
	Created Date: 01/06/2019

	Project: Samsung PowerDown
*/

#import "Tweak.h"

%group mainTweak
%hook SBPowerDownController
-(void)viewDidLoad {
	[self showView];
}

%new
-(void)showView {
	/*
		Create main view with blur effect
	*/
	mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	mainEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
	mainEffectView.frame = mainView.bounds;
	mainEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
	/*
		Safemode Button
	*/
	safemodeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonFloat, buttonFloat)];
	safemodeView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-buttonDistance2);
	UITapGestureRecognizer *safemodeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(safemodeAct)];
	[safemodeView addGestureRecognizer:safemodeTap];

	NSString *safemodeImagePath = [kImagesPath stringByAppendingPathComponent:@"safemode.png"];
	UIImage *safemodeImage = [[UIImage alloc] initWithContentsOfFile:safemodeImagePath];
	UIImageView *safemodeImageView = [[UIImageView alloc] initWithImage:safemodeImage];
	safemodeImageView.frame = safemodeView.bounds;

	safemodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
	safemodeLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-labelSafemode);
	[safemodeLabel setText:@"Safe Mode"];
	[safemodeLabel setTextColor:[UIColor whiteColor]];
	safemodeLabel.textAlignment = NSTextAlignmentCenter;
	safemodeLabel.adjustsFontSizeToFitWidth = YES;
	safemodeLabel.numberOfLines = 1;

	/*
		Respring button
	*/
	respringView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonFloat, buttonFloat)];
	respringView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-buttonDistance1);
	UITapGestureRecognizer *respringTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respringAct)];
	[respringView addGestureRecognizer:respringTap];
	
	NSString *respringImagePath = [kImagesPath stringByAppendingPathComponent:@"respring.png"];
	UIImage *respringImage = [[UIImage alloc] initWithContentsOfFile:respringImagePath];
	UIImageView *respringImageView = [[UIImageView alloc] initWithImage:respringImage];
	respringImageView.frame = respringView.bounds;

	respringLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
	respringLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-labelRespring);
	[respringLabel setText:@"Respring"];
	[respringLabel setTextColor:[UIColor whiteColor]];
	respringLabel.textAlignment = NSTextAlignmentCenter;
	respringLabel.adjustsFontSizeToFitWidth = YES;
	respringLabel.numberOfLines = 1;

	/*
		Shutdown button
	*/
	shutdownView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonFloat, buttonFloat)];
	shutdownView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+buttonDistance1);
	UITapGestureRecognizer *shutdownTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shutdownAct)];
	[shutdownView addGestureRecognizer:shutdownTap];

	NSString *shutdownImagePath = [kImagesPath stringByAppendingPathComponent:@"shutdown.png"];
	UIImage *shutdownImage = [[UIImage alloc] initWithContentsOfFile:shutdownImagePath];
	UIImageView *shutdownImageView = [[UIImageView alloc] initWithImage:shutdownImage];
	shutdownImageView.frame = shutdownView.bounds;
	
	shutdownLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
	shutdownLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+labelShutdown);
	[shutdownLabel setText:@"Power Off"];
	[shutdownLabel setTextColor:[UIColor whiteColor]];
	shutdownLabel.textAlignment = NSTextAlignmentCenter;
	shutdownLabel.adjustsFontSizeToFitWidth = YES;
	shutdownLabel.numberOfLines = 1;

	/*
		Reboot button
	*/
	rebootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonFloat, buttonFloat)];
	rebootView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+buttonDistance2);
	UITapGestureRecognizer *rebootTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rebootAct)];
	[rebootView addGestureRecognizer:rebootTap];

	NSString *rebootImagePath = [kImagesPath stringByAppendingPathComponent:@"reboot.png"];
	UIImage *rebootImage = [[UIImage alloc] initWithContentsOfFile:rebootImagePath];
	UIImageView *rebootImageView = [[UIImageView alloc] initWithImage:rebootImage];
	rebootImageView.frame = rebootView.bounds;

	rebootLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
	rebootLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+labelReboot);
	[rebootLabel setText:@"Reboot"];
	[rebootLabel setTextColor:[UIColor whiteColor]];
	rebootLabel.textAlignment = NSTextAlignmentCenter;
	rebootLabel.adjustsFontSizeToFitWidth = YES;
	rebootLabel.numberOfLines = 1;

	/*
		Make them visible slowly
	*/
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

/*
	Safemode Action + Cancel
*/
%new
-(void)safemodeAct {
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

%new
-(void)cancelSafemode {
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		safemodeView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-buttonDistance2);
		safemodeLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-labelDistance1);
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

%new
-(void)safemodeDo {
	pid_t pid;
    const char* args[] = {"killall", "-SEGV", "SpringBoard", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
}

/*
	Respring Action + Cancel
*/
%new
-(void)respringAct {
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

%new
-(void)cancelRespring {
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		respringView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-buttonDistance1);
		respringLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-labelDistance2);
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

%new
-(void)respringDo {
	pid_t pid;
    const char* args[] = {"killall", "-9", "SpringBoard", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
}

/*
	Shutdown Action + Cancel
*/
%new
-(void)shutdownAct {
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

%new
-(void)cancelShutdown {
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		shutdownView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+buttonDistance1);
		shutdownLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+labelDistance3);
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

%new
-(void)shutdownDo {
	[[objc_getClass("FBSystemService") sharedInstance] shutdownAndReboot:NO];
}

/*
	Reboot Action + Cancel
*/
%new
-(void)rebootAct {
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

%new
-(void)cancelReboot {
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		rebootView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+buttonDistance2);
		rebootLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+labelDistance4);
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

%new
-(void)rebootDo {
	[[objc_getClass("FBSystemService") sharedInstance] shutdownAndReboot:YES];
}


/*
	Close mainView
*/
%new
-(void)close {
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
%end
%end

void reloadPreferences() {
	NSMutableDictionary *getpref = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/private/var/mobile/Library/Preferences/com.devntnghia.sspd.plist"];
	buttonSize = [([getpref objectForKey:@"buttonSize"] ?: @(0)) intValue];

	safemodeButton = [([getpref objectForKey:@"safemodeButton"] ?: @(YES)) boolValue];
	respringButton = [([getpref objectForKey:@"respringButton"] ?: @(YES)) boolValue];
	poweroffButton = [([getpref objectForKey:@"poweroffButton"] ?: @(YES)) boolValue];
	rebootButton = [([getpref objectForKey:@"rebootButton"] ?: @(YES)) boolValue];

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

	if (safemodeButton = NO) {
		safemodeView = nil;
		safemodeLabel = nil;
	}
	else if (respringButton = NO) {
		
	}
	else if (poweroffButton = NO) {
		
	}
	else if (rebootButton = NO) {
		
	}
}

/*
	Load tweak after Respring
*/
%ctor {
	reloadPreferences();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPreferences, CFSTR("com.devntnghia.sspd.preferencechanged"), NULL, kNilOptions);
	
	%init(mainTweak);
}