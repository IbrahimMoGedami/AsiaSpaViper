//
//  AppDelegate.swift
//  AsiaSpaViper
//
//  Created by Ibrahim Mo Gedami on 12/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            if Helper.getApiID() == nil {
                // goto Auth Screen
                let rootVC = LoginRouter.createModule()
                let nav = UINavigationController(rootViewController: rootVC)
                window.rootViewController = nav
                window.makeKeyAndVisible()
            }
            else{
                // goto Main Screen
                let rootVC = MainVC(nibName: "MainVC", bundle: nil)
                let nav = UINavigationController(rootViewController: rootVC)
                window.rootViewController = nav
                window.makeKeyAndVisible()
            }
            
        }
        UIViewController.preventPageSheetPresentation
        return true
    }


}

