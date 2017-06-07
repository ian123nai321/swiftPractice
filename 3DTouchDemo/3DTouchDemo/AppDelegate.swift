//
//  AppDelegate.swift
//  3DTouchDemo
//
//  Created by 吳政緯 on 2017/1/21.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    enum ShortcutIdentifier: String {
        case OpenScale
        case OpenPeek
        case OpenPop
        case ScaleBackground
        
        init?(fullIdentifier: String) {
            guard let shortIdentifier = fullIdentifier.components(separatedBy: ".").last else {
                return nil
            }
            self.init(rawValue: shortIdentifier)
        }
    }

    var window: UIWindow?

    //第一次開啟APP才會執行的func： didFinishLaunchingWithOptions
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        
        //Dynamic Quick Actions
        
        let shortcutChangeBackgorund = UIMutableApplicationShortcutItem(type: "ScaleBackground",
                                                                        localizedTitle: "Change the backgorund",
                                                                        localizedSubtitle: "更換磅秤背景顏色為藍色",
                                                                        icon: UIApplicationShortcutIcon(type: .cloud),
                                                                        userInfo: nil
        )
        UIApplication.shared.shortcutItems  = [shortcutChangeBackgorund]
        
       
        
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            //print(shortcutItem)
            
           
            handleShortcut(shortcutItem)
            return false
        }
        
        
        return true
    }
   
    
    func application(_ application: UIApplication,
                     performActionFor shortcutItem: UIApplicationShortcutItem,
                     completionHandler: @escaping (Bool) -> Void) {
        
        completionHandler(handleShortcut(shortcutItem))
    }
    
    
     func handleShortcut(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        
        let shortcutType = shortcutItem.type
        guard let shortcutIdentifier = ShortcutIdentifier(fullIdentifier: shortcutType) else {
            return false
        }
        
        return selectTabBarItemForIdentifier(shortcutIdentifier)
    }
    
     func selectTabBarItemForIdentifier(_ identifier: ShortcutIdentifier) -> Bool {
        
        guard let tabBarController = self.window?.rootViewController as? UITabBarController else {
            return false
        }
        
        switch (identifier) {
            
        case .OpenPeek:
            tabBarController.selectedIndex = 0
            return true
        case .OpenPop:
            tabBarController.selectedIndex = 1
            return true
        case .OpenScale:
            tabBarController.selectedIndex = 2
            return true
        case .ScaleBackground:
            notifyUser(message: "失敗了 看來這個Quick Action沒用 幫你刪掉！！")
             tabBarController.selectedIndex = 2
            
            UIApplication.shared.shortcutItems = []
             return true
        }
    }

    func notifyUser(message: String) {
        
        let alertController = UIAlertController(title: "Opps～",
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        
        alertController.addAction(okAction)
        
        window!.rootViewController?.present(alertController,
                                            animated: true, completion: nil)
        
     

    }
}

