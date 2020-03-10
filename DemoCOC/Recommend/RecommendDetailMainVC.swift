//
//  RecommendDetailMainVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/21.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class RecommendDetailMainVC: UIViewController {

    @IBOutlet var contView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var recommendBtn: UIButton!
    @IBOutlet var promotedBtn: UIButton!
    @IBOutlet var activityBtn: UIButton!
    
    @IBOutlet var separatorView: UIView!
    
    var pageViewController: RecommendPageVC!
    var transWidth: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    func setUI() {
        
        titleLabel.attributedText = .setAttributedString(string: "今日資源推薦", wordSpace: 6.25, textColor: .white)
        recommendBtn.setAttributedTitle(.setTitleAttriStr(string: "推薦交流"), for: .normal)
        promotedBtn.setAttributedTitle(.setTitleAttriStr(string: "提拔晚輩"), for: .normal)
        activityBtn.setAttributedTitle(.setTitleAttriStr(string: "聚會活動"), for: .normal)
        
        
        recommendBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        promotedBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        activityBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        
        transWidth = (promotedBtn.center.x - recommendBtn.center.x) * screen.width / 414
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecommendContainerViewSegue" {
            pageViewController = segue.destination as? RecommendPageVC
            pageViewController.pageViewControllerDelegate = self
            pageViewController.mainViewController = self
        }
    }
    
    
    @IBAction func onCloseBtnClick(_ sender: MyButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onRecommendBtnClick(_ sender: UIButton) {
        
        titleLabel.attributedText = .setAttributedString(string: "今日資源推薦", wordSpace: 6.25, textColor: .white)
        
        pageViewController.showPage(byIndex: 0)
        
        recommendBtn.tintColor = UIColor.white
        promotedBtn.tintColor = UIColor.white.withAlphaComponent(0.5)
        activityBtn.tintColor = UIColor.white.withAlphaComponent(0.5)
        
//        separatorViewCenterX.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.separatorView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.contView.backgroundColor = .set(red: 125, green: 218, blue: 255)
        }
        
    }
    @IBAction func onPromotedBtnClick(_ sender: UIButton) {
        titleLabel.attributedText = .setAttributedString(string: "今日人才推薦", wordSpace: 6.25, textColor: .white)
        
        pageViewController.showPage(byIndex: 1) 
        
        recommendBtn.tintColor = UIColor.white.withAlphaComponent(0.5)
        promotedBtn.tintColor = UIColor.white
        activityBtn.tintColor = UIColor.white.withAlphaComponent(0.5)
        
        UIView.animate(withDuration: 0.3) {
            self.separatorView.transform = CGAffineTransform(translationX: self.transWidth, y: 0)
            self.contView.backgroundColor = .set(red: 8, green: 26, blue: 70)
        }
        
    }
    @IBAction func onActivityBtnClick(_ sender: UIButton) {
//        changeTab(to: activityBtn)
        titleLabel.attributedText = .setAttributedString(string: "近期宗親活動推薦", wordSpace: 6.25, textColor: .white)
        
        pageViewController.showPage(byIndex: 2)
        
        recommendBtn.tintColor = UIColor.white.withAlphaComponent(0.5)
        promotedBtn.tintColor = UIColor.white.withAlphaComponent(0.5)
        activityBtn.tintColor = UIColor.white
        
        UIView.animate(withDuration: 0.3) {
            self.separatorView.transform = CGAffineTransform(translationX: self.transWidth * 2, y: 0)
            self.contView.backgroundColor = .set(red: 207, green: 46, blue: 46)
        }
        
    }
}

extension RecommendDetailMainVC: RecommendPageVCDelegate {
    func pageViewController(_ pageViewController: RecommendPageVC, didUpdateNumberOfPage numberOfPage: Int) {
        
    }
    
    func pageViewController(_ pageViewController: RecommendPageVC, didUpdatePageIndex pageIndex: Int) {
        
        switch pageIndex {
        case 0:
            titleLabel.attributedText = .setAttributedString(string: "今日資訊推薦", wordSpace: 6.25, textColor: .white)
            UIView.animate(withDuration: 0.3, animations: {
                self.separatorView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.contView.backgroundColor = .set(red: 125, green: 218, blue: 255)
                self.recommendBtn.tintColor = UIColor.white
                self.promotedBtn.tintColor = UIColor.white.withAlphaComponent(0.5)
                self.activityBtn.tintColor = UIColor.white.withAlphaComponent(0.5)
            }) { _ in
            }
            
        case 1:
            titleLabel.attributedText = .setAttributedString(string: "今日人才推薦", wordSpace: 6.25, textColor: .white)
            UIView.animate(withDuration: 0.3, animations: {
                self.separatorView.transform = CGAffineTransform(translationX: self.transWidth, y: 0)
                self.contView.backgroundColor = .set(red: 8, green: 26, blue: 70)
                self.recommendBtn.tintColor = UIColor.white.withAlphaComponent(0.5)
                self.promotedBtn.tintColor = UIColor.white
                self.activityBtn.tintColor = UIColor.white.withAlphaComponent(0.5)
                
            }) { _ in
            }
            
        default:
            titleLabel.attributedText = .setAttributedString(string: "近期宗親活動推薦", wordSpace: 6.25, textColor: .white)
            UIView.animate(withDuration: 0.3, animations: {
                self.separatorView.transform = CGAffineTransform(translationX: self.transWidth * 2, y: 0)
                self.contView.backgroundColor = .set(red: 207, green: 46, blue: 46)
                self.recommendBtn.tintColor = UIColor.white.withAlphaComponent(0.5)
                self.promotedBtn.tintColor = UIColor.white.withAlphaComponent(0.5)
                self.activityBtn.tintColor = UIColor.white
            }) { _ in
            }
            
        }
    }
    
    
}
