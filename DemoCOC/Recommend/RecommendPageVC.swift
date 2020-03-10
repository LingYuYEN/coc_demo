//
//  RecommendPageVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/21.
//  Copyright © 2020 顏淩育. All rights reserved.
//

//
//  PageViewController.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/20.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit
protocol RecommendPageVCDelegate: class {
    
    /// 設定頁數
    ///
    /// - Parameters:
    ///   - pageViewController: _
    ///   - numberOfPage: _
    func pageViewController(_ pageViewController: RecommendPageVC, didUpdateNumberOfPage numberOfPage: Int)
    
    /// 當 pageViewController 切換頁數時，設定 pageControl 的頁數
    ///
    /// - Parameters:
    ///   - pageViewController: _
    ///   - pageIndex: _
    func pageViewController(_ pageViewController: RecommendPageVC, didUpdatePageIndex pageIndex: Int)
}

class RecommendPageVC: UIPageViewController {
    
    var viewControllerList: [UIViewController] = [UIViewController]()
    weak var pageViewControllerDelegate: RecommendPageVCDelegate?
    var mainViewController: RecommendDetailMainVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 依 storyboard ID 生成 viewController 並加到要用來顯示 pageViewController 畫面的陣列裡
        self.viewControllerList.append(RecommendDetailLeftVC(nibName: "RecommendDetailLeftVC", bundle: nil))
        self.viewControllerList.append(RecommendDetailVC(nibName: "RecommendDetailVC", bundle: nil))
        self.viewControllerList.append(RecommendDetailRightVC(nibName: "RecommendDetailRightVC", bundle: nil))
        
        self.dataSource = self
        self.delegate = self
        
        // 指定第一個顯示的頁面
        setViewControllers([viewControllerList.first!], direction: .forward, animated: true, completion: nil)
    }
    
    func showPage(byIndex index: Int) {
        let viewController = viewControllerList[index]
        setViewControllers([viewController], direction: .forward, animated: false, completion: nil)
    }
    
    /// 依 storybyardID 取得 viewController
    ///
    /// - Parameter storyboardID: _
    /// - Returns: _
//    fileprivate func getViewController(withStoryboardID storyboardID: String) -> UIViewController {
//        return UIStoryboard(name: "RecommendDetail", bundle: nil).instantiateViewController(withIdentifier: storyboardID)
//    }

}

extension RecommendPageVC: UIPageViewControllerDataSource {
    
    /// 上一頁
    ///
    /// - Parameters:
    ///   - pageViewController: _
    ///   - viewController: _
    /// - Returns: _
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // 取得當前頁數的 index(未翻頁前)
        let currentIndex: Int =  self.viewControllerList.firstIndex(of: viewController)!
        
        // 設定上一頁的 index
        let priviousIndex: Int = currentIndex - 1

        // 判斷上一頁的 index 是否小於 0，若小於 0 則停留在當前的頁數
        return priviousIndex < 0 ? nil : self.viewControllerList[priviousIndex]
    }
    
    /// 下一頁
    ///
    /// - Parameters:
    ///   - pageViewController: _
    ///   - viewController: _
    /// - Returns: _
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // 取得當前頁數的 index(未翻頁前)
        let currentIndex: Int =  self.viewControllerList.firstIndex(of: viewController)!
        
        // 設定下一頁的 index
        let nextIndex: Int = currentIndex + 1
        
        // 判斷下一頁的 index 是否大於總頁數，若大於則停留在當前的頁數
        return nextIndex > self.viewControllerList.count - 1 ? nil : self.viewControllerList[nextIndex]
    }
}

extension RecommendPageVC: UIPageViewControllerDelegate {
    /// 切換完頁數觸發的 func
    ///
    /// - Parameters:
    ///   - pageViewController: _
    ///   - finished: _
    ///   - previousViewControllers: _
    ///   - completed: _
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        // 取得當前頁數的 viewController
        let currentViewController: UIViewController = (self.viewControllers?.first)!
        
        // 取得當前頁數的 index
        let currentIndex: Int =  self.viewControllerList.firstIndex(of: currentViewController)!
        
        // 設定 RootViewController 上 PageControl 的頁數
        self.pageViewControllerDelegate?.pageViewController(self, didUpdatePageIndex: currentIndex)
    }
    
    
}

