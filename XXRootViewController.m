#import "XXRootViewController.h"
#import <dlfcn.h>
#import <objc/objc-runtime.h>
#import <AppSupport/CPDistributedMessagingCenter.h>

@implementation XXRootViewController {
	NSMutableArray *_objects;
}

static void alert(NSString *format, ...) {
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];  
    va_end(args);

    [[[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

- (void)loadView {
	[super loadView];

	self.view.backgroundColor = [UIColor whiteColor];
	self.title = @"Press [+] button to call ChatSpeaker";
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addRightButtonTapped:)] autorelease];
}

- (void)addRightButtonTapped:(id)sender {
	NSDictionary *message = @{@"Message" : @"Speak any message here...", @"Testing" : [NSNumber numberWithBool:NO]};
    CPDistributedMessagingCenter *messagingCenter = [objc_getClass("CPDistributedMessagingCenter") centerNamed:@"prasa.chatspeaker"];
    [messagingCenter sendMessageName:@"speakmessage" userInfo:message];

    alert(@"You have pressed [+] button");
}
@end
