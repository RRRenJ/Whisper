//
//  AppDelegate.swift
//  Whisper
//
//  Created by RRR on 2023/5/31.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        
        if let uuid = mManager.uuid {
            self.window?.rootViewController = WSPMainViewController()
        }else{
            let vc = WSPSignInViewController.wsp_initWithStoryBoard("Login")
            self.window?.rootViewController = WSPBaseNavigationVC(rootViewController:vc )
        }
        
       
        self.window?.makeKeyAndVisible()
        
        WSPSDKManager.wsp_loadSDK()
        
        return true
    }

   

}

