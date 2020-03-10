//
//  MyTabBarController.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/17.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    
    @IBOutlet var naviTitleView: NaviTitleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviTitleView.center.x = (self.navigationItem.titleView?.center.x)!
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
