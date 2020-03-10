//
//  SceneDelegate.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/13.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var dataList = [UserItem]()
    var hasUUID = false
    var uuid: String?
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
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
                print("有比對到 UUID")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let rootVC = sb.instantiateViewController(withIdentifier: "tabbarVC")
                self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
                self.window?.windowScene = windowScene
                self.window?.rootViewController = rootVC
                self.window?.makeKeyAndVisible()
            } else {
                print("無比對到 UUID")
                // Database 無此 UUID
                // 進入註冊頁面
                
                // 先建立 Main SB
                let rootVC = RegisteredVC(nibName: "RegisteredVC", bundle: nil)
                // 訂定 window 的 frame ( iOS 13 )
                self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
                self.window?.windowScene = windowScene
                self.window?.rootViewController = rootVC
                self.window?.makeKeyAndVisible()
            }
        }
    }
    @available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    @available(iOS 13.0, *)
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    @available(iOS 13.0, *)
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    @available(iOS 13.0, *)
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    @available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

