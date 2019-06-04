#include "SSPD.h"

@implementation SSPDBanner
- (id)initWithSpecifier:(PSSpecifier *)specifier {
	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Logo" specifier:specifier];
	if (self) {
		self.backgroundColor = UIColor.clearColor;

		NSString *path = [NSString stringWithFormat:@"%@/Banner.png", kPrefsBundlePath];
		UIImage *logo = [UIImage imageWithContentsOfFile:path];
		UIImageView *logoView = [[UIImageView alloc] initWithImage:logo];
		logoView.center = self.contentView.center;
		logoView.contentMode = UIViewContentModeCenter;
		logoView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;

		[self.contentView addSubview:logoView];
	}
	return self;
}

- (CGFloat)preferredHeightForWidth:(CGFloat)height {
	return 100.0f;
}
@end

@implementation SSPD

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"SSPD" target:self];
	}

	return _specifiers;
}

-(void)respring {
	pid_t pid;
    const char* args[] = {"killall", "-9", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
}

@end
