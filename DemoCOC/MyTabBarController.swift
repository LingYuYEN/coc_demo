//
//  MyTabBarController.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/17.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

enum Devices: CGSize {
    case iphoneSE = "{320, 568}"
    case iphone8 = "{375, 667}"
    case iphone8Plus = "{414, 736}"
    case iphone11Pro = "{375, 812}"
    case iphone11ProMax = "{414, 896}"
}

var isSetting = false

class MyTabBarController: UITabBarController {
    
    @IBOutlet var naviTitleView: NaviTitleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviTitleView.center.x = (self.navigationItem.titleView?.center.x)!
        
        
        print(screen)
        
        
        let  devices: Devices = Devices(rawValue: screen)!
        switch devices {
        case .iphoneSE:
            print("iphoneSE： \(screen)")
            isSetting = true
            
            if let tabbarItems = tabBar.items {
                for tabbarItem in tabbarItems {
                    tabbarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
                }
            }
        case .iphone8:
            print("iphone8： \(screen)")
        case .iphone8Plus:
            print("iphone8Plus： \(screen)")
        case .iphone11Pro:
            print("iphone11Pro： \(screen)")
            isSetting = true
            
            if let tabbarItems = tabBar.items {
                for tabbarItem in tabbarItems {
                    tabbarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -12, right: 0)
                }
            }
        case .iphone11ProMax:
            print("iphone11ProMax： \(screen)")
            isSetting = true
            
            if let tabbarItems = tabBar.items {
                for tabbarItem in tabbarItems {
                    tabbarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -12, right: 0)
                }
            }
        }
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        if #available(iOS 13.0, *) {
//            self.tabBar.items?[0].imageInsets = .zero
//            self.tabBar.items?[1].imageInsets = .zero
//            self.tabBar.items?[2].imageInsets = .zero
//            self.tabBar.items?[3].imageInsets = .zero
//            self.tabBar.items?[4].imageInsets = .zero
//        }
//    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        clearTitles()
    }
    
    func clearTitles() {
        guard let items = tabBar.items else { return }
        for (index, _) in items.enumerated(){
            tabBar.items![index].title = nil
        }
    }

}
