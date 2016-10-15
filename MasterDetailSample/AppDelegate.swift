//
//  AppDelegate.swift
//  MasterDetailSample
//
//  Created by Jörg Tischer on 14.10.16.
//  Copyright © 2016 Jörg Tischer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var splitView:UISplitViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let leftNavController = splitViewController.viewControllers.first as! UINavigationController
        let masterViewController = leftNavController.topViewController as! MasterViewController
        let rightNavController = splitViewController.viewControllers.last as! UINavigationController
        /*let detailViewController = rightNavController.topViewController as! DetailViewController
        
        let firstMonster = masterViewController.monsters.first
        detailViewController.monster = firstMonster
        masterViewController.delegate = detailViewController
        
        //Pfeil-Button
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
    */
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        showOverlay()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    private func grabScreenshot()->UIImage {
    
        // create graphics context with screen size
        let screenRect = UIScreen.main.bounds
        UIGraphicsBeginImageContext(screenRect.size)
        let ctx = UIGraphicsGetCurrentContext()
        UIColor.black.set()
        ctx!.fill(screenRect);
        
        // grab reference to our window
        let window = UIApplication.shared.keyWindow
        
        // transfer content into our context
        window!.layer.render(in: ctx!)
        let screengrab = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return screengrab!
    }

    internal func showOverlay() {
    
        // grab a screenshot
        let screenshot = grabScreenshot()
    
        // create a new view controller with it
        let underlay = UIViewController()
        let background = UIImageView(image:screenshot);
        underlay.view = background;
        
        // grab the overlay controller
        let storyboard = UIStoryboard(name: "Overlay", bundle: nil)
        let overlay = storyboard.instantiateViewController(withIdentifier: "Overlay") as! UINavigationController
        //overlay.modalPresentationStyle = UIModalPresentationStyle.formSheet
        overlay.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        // swap the split view
        self.splitView = self.window!.rootViewController as? UISplitViewController;
        self.window!.rootViewController = underlay;
        
        // present the overlay
        underlay.present(overlay, animated: false, completion: nil)
    }
    
    internal func dismissOverlay() {
        
        // dismiss the overlay
        self.window!.rootViewController?.dismiss(animated: true, completion: { 
            self.window!.rootViewController = self.splitView
        })
    }

}

