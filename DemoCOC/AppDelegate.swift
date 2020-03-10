//
//  AppDelegate.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/13.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseFirestore
//import FirebaseCore

let screen = UIScreen.main.bounds.size


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    var dataList = [UserItem]()
    var hasUUID = false
    var uuid: String?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
//        let db = Firestore.firestore()
        
        
        // 先從 key chain 取得 UUID
        let query = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String : "DEVICE_UUID",
            kSecReturnData as String  : kCFBooleanTrue!,
            kSecMatchLimit as String  : kSecMatchLimitOne ] as [String : Any]

        var dataTypeRef: AnyObject? = nil
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        if status == noErr, let dataTypeRef = dataTypeRef as? Data, let uuid = String(data:dataTypeRef, encoding: .utf8) {
            print(uuid)
            self.uuid = uuid
        }
        
        // 再由 database 判斷有無此UUID
        
        Database.database().reference().child("users").queryOrdered(byChild: "DEVICE_UUID").queryEqual(toValue: self.uuid).observe(.value) { snapshot in
            if snapshot.exists() {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let rootVC = sb.instantiateViewController(withIdentifier: "tabbarVC")
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.rootViewController = rootVC
                self.window?.makeKeyAndVisible()
            } else {
                // Database 無此 UUID
                // 進入註冊頁面

                // 先建立 rootViewController
                let rootVC = RegisteredVC(nibName: "RegisteredVC", bundle: nil)
                // window 滿版
                self.window = UIWindow(frame: UIScreen.main.bounds)
                // 指定 rootViewController
                self.window?.rootViewController = rootVC
                // 顯示當前窗口
                self.window?.makeKeyAndVisible()
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

