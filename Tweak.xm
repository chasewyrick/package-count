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
            NSLog(@"%@", amount);
            // NSString *&origin_ = MSHookIvar<NSString *>(self, "origin_");
            // origin_ = (NSString *)[NSString stringWithFormat:@"%@ (%@)", origin_, amount];

            MSHookIvar<NSString *>(origCell, "origin_") = [NSString stringWithFormat:@"%@ %@", amount, amount > [NSNumber numberWithInt:1] ? @"pkgs" : @"pkg"];
            // NSString *&str = MSHookIvar<NSString *>(origCell, "origin_"); 

            // str = [NSString stringWithFormat:@"%@ pkgs", amount];
        });
        
		return origCell;
	}
	return %orig;
}

%end


// %hook Source

// - (NSString *) name {
//     NSString *name = %orig;
//     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//         Database *db = MSHookIvar<Database *>(self, "database_");
//         NSURL *url = [NSURL URLWithString:[self label]];
//         NSNumber *amount = [PackageHandler getPackageCountForSource:[url host] withDatabase:db];
//         NSLog(@"%@", amount);
//         MSHookIvar<NSString *>(self, "name_") = [NSString stringWithFormat:@"%@ pkgs", name];
//     });

//     // NSString *&origin_ = MSHookIvar<NSString *>(self, "origin_");
//     // origin_ = (NSString *)[NSString stringWithFormat:@"%@ (%@)", origin_, amount];

//     return name;
// }

// %end