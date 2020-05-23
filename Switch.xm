#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface KeyRepeatSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSKeyRepeatEnabled();
extern "C" void _AXSSetKeyRepeatEnabled(BOOL);

@implementation KeyRepeatSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSKeyRepeatEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSSetKeyRepeatEnabled(newState == FSSwitchStateOn);
}

@end
