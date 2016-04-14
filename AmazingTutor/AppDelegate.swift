//
//  AppDelegate.swift
//  AmazingTutor
//
//  Created by apple on 2016/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
//GIDSignInDelegate

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject:AnyObject]?) -> Bool {
        // Facebook signin
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.fbTokenChangeNoti(_:)), name: FBSDKAccessTokenDidChangeNotification, object: nil)

        return FBSDKApplicationDelegate.sharedInstance().application(application,didFinishLaunchingWithOptions: launchOptions)
        
        // Initialize google signin
//        var configureError: NSError?
//        GGLContext.sharedInstance().configureWithError(&configureError)
//        assert(configureError == nil, "Error configuring Google services: \(configureError)")
//        
//        GIDSignIn.sharedInstance().delegate = self
//        
//        return true
    }
    
    func fbTokenChangeNoti (noti:NSNotification){
        if FBSDKAccessToken.currentAccessToken() != nil{
            
            let LoginStoryboard = UIStoryboard(name: "Login", bundle: nil)
            let LoginController = LoginStoryboard.instantiateViewControllerWithIdentifier("LoginPage")
            let RootStoryboard = UIStoryboard(name: "TList", bundle: nil)
            let RootController = RootStoryboard.instantiateViewControllerWithIdentifier("TListPage")
            
            if self.window != nil{
                self.window!.rootViewController = RootController
            }else if FBSDKAccessToken.currentAccessToken() == nil{
                self.window!.rootViewController = LoginController
            }
        }
    }
    
     // Facebook
    func application(application: UIApplication, openURL url: NSURL,sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
//    // Google
//    func application(application: UIApplication, openURL url: NSURL, options: [String: AnyObject]) -> Bool {
//        return GIDSignIn.sharedInstance().handleURL(url, sourceApplication: options[UIApplicationOpenURLOptionsSourceApplicationKey] as? String, annotation: options[UIApplicationOpenURLOptionsAnnotationKey])
//    }
    
//    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
//        var options: [String: AnyObject] = [UIApplicationOpenURLOptionsSourceApplicationKey: sourceApplication,
//                                        UIApplicationOpenURLOptionsAnnotationKey: annotation]
//        return GIDSignIn.sharedInstance().handleURL(url, sourceApplication: sourceApplication, annotation: annotation)
//    }
//    
//    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
//        if (error == nil) {
//            // Perform any operations on signed in user here.
//            let userId = user.userID                  // For client-side use only!
//            let idToken = user.authentication.idToken // Safe to send to the server
//            let fullName = user.profile.name
//            let givenName = user.profile.givenName
//            let familyName = user.profile.familyName
//            let email = user.profile.email
//            // ...
//        } else {
//            print("\(error.localizedDescription)")
//        }
//    }
//    
//    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!, withError error: NSError!) {
//        // Perform any operations when the user disconnects from app here.
//        // ...
//    }
    

    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {

    }

    func applicationWillEnterForeground(application: UIApplication) {

    }

    func applicationDidBecomeActive(application: UIApplication) {

    }

    func applicationWillTerminate(application: UIApplication) {

    }

}