//
//  MemberSettingVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/17.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class MemberSettingVC: UIViewController {
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            self.titleLabel.attributedText = .setAttributedString(string: "個人資料", wordSpace: 5, textColor: .black)
        }
    }
    @IBOutlet var aboutBtn: UIButton!
    @IBOutlet var activityBtn: UIButton!
    @IBOutlet var rankingBtn: UIButton!
    @IBOutlet var localBtn: UIButton!
    @IBOutlet var returnBtn: MyButton!
    
    @IBOutlet var separatorView: UIView!
    @IBOutlet var separatorViewCenterX: NSLayoutConstraint!
    
    var returnBtnIsHidden = true
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.delegate = self
        returnBtn.addTarget(self, action: #selector(onReturnBtnClick), for: .touchUpInside)
        setUI()
    }
    
    func setUI() {
        returnBtn.isHidden = returnBtnIsHidden
        
        aboutBtn.setAttributedTitle(.setTitleAttriStr(string: "關於"), for: .normal)
        activityBtn.setAttributedTitle(.setTitleAttriStr(string: "聚會"), for: .normal)
        rankingBtn.setAttributedTitle(.setTitleAttriStr(string: "排行"), for: .normal)
        localBtn.setAttributedTitle(.setTitleAttriStr(string: "地區"), for: .normal)
        
        aboutBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3.75 * 1.5, bottom: 0, right: 0)
        activityBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3.75 * 1.5, bottom: 0, right: 0)
        rankingBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3.75 * 1.5, bottom: 0, right: 0)
        localBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3.75 * 1.5, bottom: 0, right: 0)
    }

    @IBAction func onPageBtnClick(_ sender: UIButton) {
        aboutBtn.tintColor = UIColor.black.withAlphaComponent(0.5)
        activityBtn.tintColor = UIColor.black.withAlphaComponent(0.5)
        rankingBtn.tintColor = UIColor.black.withAlphaComponent(0.5)
        localBtn.tintColor = UIColor.black.withAlphaComponent(0.5)
        
        separatorViewCenterX.constant = sender.center.x - aboutBtn.center.x
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            sender.tintColor = UIColor.black
        }
        


        
    }
    
    @objc func onReturnBtnClick() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MemberSettingVC: UITabBarControllerDelegate {
    // tabBar控制, 為了前往 RecommendDetailVC 後, 能返回到原先前往的tabBarVC（不show出不希望的RecommendVC）
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is RecommendVC {
            let storyboard = UIStoryboard(name: "RecommendDetail", bundle: nil)
            let recommendDetailVC = storyboard.instantiateViewController(withIdentifier: "RecommendPageVC")
            recommendDetailVC.modalPresentationStyle = .overFullScreen
            present(recommendDetailVC, animated: true, completion: nil)
            return false
        }
        return true
    }
}
