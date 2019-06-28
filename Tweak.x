/*
	Developed by DevNTNghia
	Created Date: 01/06/2019

	Project: Samsung PowerDown
*/

#import "Tweak.h"

%hook SBPowerDownController

-(void)viewDidLoad {
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	CGFloat screenWidth = screenRect.size.width;
	CGFloat screenHeight = screenRect.size.height;
	NSLog(@"SSPD_W:%f / H:%f", screenWidth, screenHeight);

	/*
		Create main view with blur effect
	*/
	mainView = [[UIView alloc]initWithFrame:screenRect];
	mainView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	mainEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
	mainEffectView.frame = mainView.bounds;
	mainEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
	/*
		Safemode Button
	*/
	safemodeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonFloat, buttonFloat)];

	NSString *safemodeImagePath = [kImagesPath stringByAppendingPathComponent:@"safemode.png"];
	UIImage *safemodeImage = [[UIImage alloc] initWithContentsOfFile:safemodeImagePath];
	UIImageView *safemodeImageView = [[UIImageView alloc] initWithImage:safemodeImage];
	safemodeImageView.frame = safemodeView.bounds;

	safemodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
	[safemodeLabel setText:@"Safe Mode"];
	[safemodeLabel setTextColor:[UIColor whiteColor]];
	safemodeLabel.textAlignment = NSTextAlignmentCenter;
	safemodeLabel.adjustsFontSizeToFitWidth = YES;
	safemodeLabel.numberOfLines = 1;

	/*
		Respring button
	*/
	respringView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonFloat, buttonFloat)];
	
	NSString *respringImagePath = [kImagesPath stringByAppendingPathComponent:@"respring.png"];
	UIImage *respringImage = [[UIImage alloc] initWithContentsOfFile:respringImagePath];
	UIImageView *respringImageView = [[UIImageView alloc] initWithImage:respringImage];
	respringImageView.frame = respringView.bounds;

	respringLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
	[respringLabel setText:@"Respring"];
	[respringLabel setTextColor:[UIColor whiteColor]];
	respringLabel.textAlignment = NSTextAlignmentCenter;
	respringLabel.adjustsFontSizeToFitWidth = YES;
	respringLabel.numberOfLines = 1;

	/*
		Shutdown button
	*/
	shutdownView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonFloat, buttonFloat)];
	
	NSString *shutdownImagePath = [kImagesPath stringByAppendingPathComponent:@"shutdown.png"];
	UIImage *shutdownImage = [[UIImage alloc] initWithContentsOfFile:shutdownImagePath];
	UIImageView *shutdownImageView = [[UIImageView alloc] initWithImage:shutdownImage];
	shutdownImageView.frame = shutdownView.bounds;
	
	shutdownLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
	[shutdownLabel setText:@"Power Off"];
	[shutdownLabel setTextColor:[UIColor whiteColor]];
	shutdownLabel.textAlignment = NSTextAlignmentCenter;
	shutdownLabel.adjustsFontSizeToFitWidth = YES;
	shutdownLabel.numberOfLines = 1;

	/*
		Reboot button
	*/
	rebootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonFloat, buttonFloat)];
	
	NSString *rebootImagePath = [kImagesPath stringByAppendingPathComponent:@"reboot.png"];
	UIImage *rebootImage = [[UIImage alloc] initWithContentsOfFile:rebootImagePath];
	UIImageView *rebootImageView = [[UIImageView alloc] initWithImage:rebootImage];
	rebootImageView.frame = rebootView.bounds;

	rebootLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
	[rebootLabel setText:@"Reboot"];
	[rebootLabel setTextColor:[UIColor whiteColor]];
	rebootLabel.textAlignment = NSTextAlignmentCenter;
	rebootLabel.adjustsFontSizeToFitWidth = YES;
	rebootLabel.numberOfLines = 1;

	if (screenWidth >= screenHeight) {
		// Landscape frames
		safemodeView.center = CGPointMake(CGRectGetMidX(screenRect)-buttonDistance2, CGRectGetMidY(screenRect));
		respringView.center = CGPointMake(CGRectGetMidX(screenRect)-buttonDistance1, CGRectGetMidY(screenRect));
		shutdownView.center = CGPointMake(CGRectGetMidX(screenRect)+buttonDistance1, CGRectGetMidY(screenRect));
		rebootView.center = CGPointMake(CGRectGetMidX(screenRect)+buttonDistance2, CGRectGetMidY(screenRect));

		safemodeLabel.center = CGPointMake(CGRectGetMidX(screenRect)-buttonDistance2, CGRectGetMidY(screenRect)+60);
		respringLabel.center = CGPointMake(CGRectGetMidX(screenRect)-buttonDistance1, CGRectGetMidY(screenRect)+60);
		shutdownLabel.center = CGPointMake(CGRectGetMidX(screenRect)+buttonDistance1, CGRectGetMidY(screenRect)+60);
		rebootLabel.center = CGPointMake(CGRectGetMidX(screenRect)+buttonDistance2, CGRectGetMidY(screenRect)+60);
	} else {
        // Portrait frames
		safemodeView.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)-buttonDistance2);
		respringView.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)-buttonDistance1);
		shutdownView.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)+buttonDistance1);
		rebootView.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)+buttonDistance2);

		safemodeLabel.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)-labelSafemode);
		respringLabel.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)-labelRespring);
		shutdownLabel.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)+labelShutdown);
		rebootLabel.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)+labelReboot);
	}
	
	UITapGestureRecognizer *safemodeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(safemodeAct)];
	[safemodeView addGestureRecognizer:safemodeTap];
	UITapGestureRecognizer *respringTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respringAct)];
	[respringView addGestureRecognizer:respringTap];
	UITapGestureRecognizer *shutdownTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shutdownAct)];
	[shutdownView addGestureRecognizer:shutdownTap];
	UITapGestureRecognizer *rebootTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rebootAct)];
	[rebootView addGestureRecognizer:rebootTap];

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

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	if (size.width >= size.height) {
		// Landscape frames
		safemodeView.center = CGPointMake(CGRectGetMidX(screenRect)-buttonDistance2, CGRectGetMidY(screenRect));
		respringView.center = CGPointMake(CGRectGetMidX(screenRect)-buttonDistance1, CGRectGetMidY(screenRect));
		shutdownView.center = CGPointMake(CGRectGetMidX(screenRect)+buttonDistance1, CGRectGetMidY(screenRect));
		rebootView.center = CGPointMake(CGRectGetMidX(screenRect)+buttonDistance2, CGRectGetMidY(screenRect));

		safemodeLabel.center = CGPointMake(CGRectGetMidX(screenRect)-buttonDistance2, CGRectGetMidY(screenRect)+60);
		respringLabel.center = CGPointMake(CGRectGetMidX(screenRect)-buttonDistance1, CGRectGetMidY(screenRect)+60);
		shutdownLabel.center = CGPointMake(CGRectGetMidX(screenRect)+buttonDistance1, CGRectGetMidY(screenRect)+60);
		rebootLabel.center = CGPointMake(CGRectGetMidX(screenRect)+buttonDistance2, CGRectGetMidY(screenRect)+60);
	} else {
        // Portrait frames
		safemodeView.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)-buttonDistance2);
		respringView.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)-buttonDistance1);
		shutdownView.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)+buttonDistance1);
		rebootView.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)+buttonDistance2);

		safemodeLabel.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)-labelSafemode);
		respringLabel.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)-labelRespring);
		shutdownLabel.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)+labelShutdown);
		rebootLabel.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)+labelReboot);
	}
}

/*
	Safemode Action + Cancel
*/
%new
-(void)safemodeAct {
	NSMutableDictionary *getpref = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/private/var/mobile/Library/Preferences/com.devntnghia.sspd.plist"];
	labelEnabled = [([getpref objectForKey:@"labelEnabled"] ?: @(YES)) boolValue];
	
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelSafemode)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		if (labelEnabled == YES) {
			safemodeView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
		} else {
			safemodeView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
		}
		safemodeLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)+80);
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
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	CGFloat screenWidth = screenRect.size.width;
	CGFloat screenHeight = screenRect.size.height;
	
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		if (screenWidth >= screenHeight) {
			safemodeView.center = CGPointMake(CGRectGetMidX(screenRect)-buttonDistance2, CGRectGetMidY(screenRect));
			safemodeLabel.center = CGPointMake(CGRectGetMidX(screenRect)-buttonDistance2, CGRectGetMidY(screenRect)+80);
		} else {
			safemodeView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-buttonDistance2);
			safemodeLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-labelSafemode);
		}
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
	NSMutableDictionary *getpref = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/private/var/mobile/Library/Preferences/com.devntnghia.sspd.plist"];
	labelEnabled = [([getpref objectForKey:@"labelEnabled"] ?: @(YES)) boolValue];
	
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelRespring)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		if (labelEnabled == YES) {
			respringView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-45);
		} else {
			respringView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
		}
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
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	CGFloat screenWidth = screenRect.size.width;
	CGFloat screenHeight = screenRect.size.height;

	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		if (screenWidth >= screenHeight) {
			respringView.center = CGPointMake(CGRectGetMidX(screenRect)-buttonDistance1, CGRectGetMidY(screenRect));
			respringLabel.center = CGPointMake(CGRectGetMidX(screenRect)-buttonDistance1, CGRectGetMidY(screenRect)+80);
		} else {
			respringView.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(self.view.bounds)-buttonDistance1);
			respringLabel.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(self.view.bounds)-labelRespring);
		}
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
	NSMutableDictionary *getpref = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/private/var/mobile/Library/Preferences/com.devntnghia.sspd.plist"];
	labelEnabled = [([getpref objectForKey:@"labelEnabled"] ?: @(YES)) boolValue];
	
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelShutdown)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		if (labelEnabled == YES) {
			shutdownView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-45);
		} else {
			shutdownView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
		}
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
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	CGFloat screenWidth = screenRect.size.width;
	CGFloat screenHeight = screenRect.size.height;

	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		if (screenWidth >= screenHeight) {
			shutdownView.center = CGPointMake(CGRectGetMidX(screenRect)+buttonDistance1, CGRectGetMidY(screenRect));
			shutdownLabel.center = CGPointMake(CGRectGetMidX(screenRect)+buttonDistance1, CGRectGetMidY(screenRect)+80);
		} else {
			shutdownView.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)+buttonDistance1);
			shutdownLabel.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)+labelShutdown);
		}
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
	NSMutableDictionary *getpref = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/private/var/mobile/Library/Preferences/com.devntnghia.sspd.plist"];
	labelEnabled = [([getpref objectForKey:@"labelEnabled"] ?: @(YES)) boolValue];
	
	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelReboot)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		if (labelEnabled == YES) {
			rebootView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)-45);
		} else {
			rebootView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
		}
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
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	CGFloat screenWidth = screenRect.size.width;
	CGFloat screenHeight = screenRect.size.height;

	UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
	[mainView addGestureRecognizer:mainTap];
	[UIView animateWithDuration:0.25 animations:^{
		if (screenWidth >= screenHeight) {
			rebootView.center = CGPointMake(CGRectGetMidX(screenRect)+buttonDistance2, CGRectGetMidY(screenRect));
			rebootLabel.center = CGPointMake(CGRectGetMidX(screenRect)+buttonDistance2, CGRectGetMidY(screenRect)+60);
		} else {
			rebootView.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)+buttonDistance2);
			rebootLabel.center = CGPointMake(CGRectGetMidX(screenRect), CGRectGetMidY(screenRect)+labelReboot);
		}
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

void reloadPreferences() {
	NSMutableDictionary *getpref = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/private/var/mobile/Library/Preferences/com.devntnghia.sspd.plist"];
	labelEnabled = [([getpref objectForKey:@"labelEnabled"] ?: @(YES)) boolValue];
	buttonSize = [([getpref objectForKey:@"buttonSize"] ?: @(0)) intValue];

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

/*
	Load tweak after Respring
*/
%ctor {
	reloadPreferences();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPreferences, CFSTR("com.devntnghia.sspd.preferencechanged"), NULL, kNilOptions);
}