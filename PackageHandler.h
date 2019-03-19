@interface PackageHandler : NSObject {

}
+(NSNumber *)getPackageCountForSource:(NSString *)source withDatabase:(Database *)db;
@end