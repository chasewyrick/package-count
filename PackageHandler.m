#import "JBBulletinManager.h"
#import "PackageHandler.h"

static NSMutableDictionary<NSString *, NSNumber *> *cachedPackageAmountPerSource;

@implementation PackageHandler 

+(NSNumber *)getPackageCountForSource:(NSString *)source withDatabase:(Database *)db {
    // NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF.source.origin contains[cd] %@", source];
    NSNumber *value = cachedPackageAmountPerSource[source];
    if (value) {
        return value;
    } else {
        NSArray<Package *> *pkgs = [db packages];
        int amount = 0;
        for (Package *pkg in pkgs) {
            // Source *src = MSHookIvar<Source *>(pkg, "source_");
            NSString *origin = [[pkg source] host];

            if ([[origin stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:[source stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]] && [pkg installed]) amount++;

        }
        cachedPackageAmountPerSource[source] = [NSNumber numberWithInt:amount];
        // NSArray<Package *> *filtered = [pkgs filteredArrayUsingPredicate:bPredicate];
        // cachedPackageAmountPerSource[source] = amount;
        return [NSNumber numberWithInt:amount];
    }

}
@end