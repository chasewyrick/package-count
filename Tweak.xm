#import "JBBulletinManager.h"
#import "PackageHandler.h"

%hook SourcesController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section != 0) {
        UITableViewCell *origCell = %orig;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
            Database *db = MSHookIvar<Database *>(self, "database_");
            NSURL *url = [NSURL URLWithString:MSHookIvar<NSString *>(origCell, "label_")];
            NSNumber *amount = [PackageHandler getPackageCountForSource:[url host] withDatabase:db];


            MSHookIvar<NSString *>(origCell, "origin_") = [NSString stringWithFormat:@"%@ %@", amount, amount > [NSNumber numberWithInt:1] ? @"pkgs" : @"pkg"];
        });
        
		return origCell;
	}
	return %orig;
}

%end