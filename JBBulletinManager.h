@interface JBBulletinManager : NSObject
+(id)sharedInstance;
-(id)showBulletinWithTitle:(NSString *)title message:(NSString *)message bundleID:(NSString *)bundleID;
-(id)showBulletinWithTitle:(NSString *)title message:(NSString *)message bundleID:(NSString *)bundleID soundPath:(NSString *)soundPath;
-(id)showBulletinWithTitle:(NSString *)title message:(NSString *)message bundleID:(NSString *)bundleID soundID:(int)inSoundID;
-(id)showBulletinWithTitle:(NSString *)title message:(NSString *)message overrideBundleImage:(UIImage *)overridBundleImage;
-(id)showBulletinWithTitle:(NSString *)title message:(NSString *)message overrideBundleImage:(UIImage *)overridBundleImage soundPath:(NSString *)soundPath;
-(id)showBulletinWithTitle:(NSString *)title message:(NSString *)message overridBundleImage:(UIImage *)overridBundleImage soundID:(int)inSoundID;
-(id)showBulletinWithTitle:(NSString *)title message:(NSString *)message bundleID:(NSString *)bundleID hasSound:(BOOL)hasSound soundID:(int)soundID vibrateMode:(int)vibrate soundPath:(NSString *)soundPath attachmentImage:(UIImage *)attachmentImage overrideBundleImage:(UIImage *)overrideBundleImage;
@end


@interface Source : NSObject {

}
-(NSString *)label;
-(NSString *)origin;
-(NSString *)host;
-(NSString *)name;

@end

@interface Package : NSObject {

}
-(Source *) source;
-(BOOL) installed;
@end

@interface Database : NSObject {

}
+(id)sharedInstance;
-(id)sources;
-(NSArray<Package *> *)packages;
-(Source *)sourceWithKey:(id)arg1 ;
-(int)globalPKGCount;

@end



@interface SourceCell : UITableViewCell {
    UIImage *icon_;
    NSString *origin_;
    NSString *description_;
    NSString *label_;
}

@end


