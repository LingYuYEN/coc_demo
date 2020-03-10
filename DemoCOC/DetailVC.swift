//
//  DetailVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/13.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit
import Hero
import fbCharm

class DetailVC: UIViewController {
    
    @IBOutlet var scrollContView: UIView!
    @IBOutlet var closeBtn: MyButton!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var favoriteBtn: UIButton! {
        didSet {
            self.favoriteBtn.setAttributedTitle(.setAttributedString(string: self.favoriteBtn.titleLabel?.text ?? "", wordSpace: 3.75, textColor: .setMyLightMustard()), for: .normal)
            self.favoriteBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3.75 * 1.5, bottom: 1, right: 0)
        }
    }
    @IBOutlet var contactBtn: UIButton! {
        didSet {
            self.contactBtn.setAttributedTitle(.setAttributedString(string: self.contactBtn.titleLabel?.text ?? "", wordSpace: 3.75, textColor: .setMyLightMustard()), for: .normal)
            self.contactBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3.75 * 1.5, bottom: 1, right: 0)
        }
    }
    @IBOutlet var shareBtn: UIButton! {
        didSet {
            self.shareBtn.setAttributedTitle(.setAttributedString(string: self.shareBtn.titleLabel?.text ?? "", wordSpace: 3.75, textColor: .setMyLightMustard()), for: .normal)
            self.shareBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3.75 * 1.5, bottom: 1, right: 0)
        }
    }
    
    @IBOutlet var topNameLabel: UILabel! {
        didSet {
            self.topNameLabel.attributedText = .setAttributedString(string: self.topNameLabel.text ?? "", wordSpace: 3.18, textColor: .black)
        }
    }
    @IBOutlet var topSubNameLabel: UILabel! {
        didSet {
            self.topSubNameLabel.attributedText = .setAttributedString(string: self.topSubNameLabel.text ?? "", wordSpace: 3.67, textColor: .setMyGray())
        }
    }
    @IBOutlet var topLogoImageView: UIImageView!
    @IBOutlet var bodyLabel: UILabel! {
        didSet {
            self.bodyLabel.attributedText = .setAttributedString(string: self.bodyLabel.text ?? "", wordSpace: 3.67, textColor: .setMyGray())
        }
    }
    @IBOutlet var bottomNameLabel: UILabel! {
        didSet {
            self.bottomNameLabel.attributedText = .setAttributedString(string: self.bottomNameLabel.text ?? "", wordSpace: 5, textColor: .black)
        }
    }
    @IBOutlet var bottomSubNameLabel: UILabel! {
        didSet {
            self.bottomSubNameLabel.attributedText = .setAttributedString(string: self.bottomSubNameLabel.text ?? "", wordSpace: 3.67, textColor: .setMyGray())
        }
    }
    @IBOutlet var midImageView: UIImageView!
    @IBOutlet var bottomLogoImageView: UIImageView!
    @IBOutlet var bottomBtn: UIButton! {
        didSet {
            self.bottomBtn.setAttributedTitle(.setAttributedString(string: "我要轉推薦媒合", wordSpace: 5, textColor: .black), for: .normal)
            self.bottomBtn.set(image: UIImage(named: "transBtn"), title: "我要轉推薦媒合", titlePosition: .left, additionalSpacing: 5, state: .normal)
        }
    }
    
    
    var detailImageName: String?
    var topName: String?
    var topSubName: String?
    var bodyText: String?
    var subImageName: String?
    var logoImageName: String?
    var logoIsCornerRadius = false
    var bottomBtnBackgroundColor = UIColor.setMyLightMustard()
    var bottomBtnTextColor = UIColor.black
    var heroID = ""
    var heroID2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.isEnabled = true
//        scrollContView.heroID = heroID
        detailImage.heroID = heroID
        self.view.hero.modifiers = [.fade]
//        self.scrollContView.hero.modifiers = [.fade]
        let panGesture = UIPanGestureRecognizer(target: self,
                                                action: #selector(DetailVC.handlePan(reconizer:)))
        panGesture.delegate = self
        self.view.addGestureRecognizer(panGesture)
        
        setUI()
    }

    @IBAction func onCloseBtnClick(_ sender: MyButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUI() {
        let btnRadius = favoriteBtn.frame.size.height / 2
//        scrollView.contentInsetAdjustmentBehavior = .never
        favoriteBtn.layer.cornerRadius = btnRadius
        contactBtn.layer.cornerRadius = btnRadius
        shareBtn.layer.cornerRadius = btnRadius
        topLogoImageView.layer.cornerRadius = logoIsCornerRadius ? topLogoImageView.frame.height / 2 : 0
        bottomLogoImageView.layer.cornerRadius = logoIsCornerRadius ? bottomLogoImageView.frame.height / 2 : 0
        detailImage.image = UIImage(named: detailImageName ?? "detailImage")
        topNameLabel.text = topName
        topSubNameLabel.text = topSubName
        
        bottomNameLabel.text = topName
        bottomSubNameLabel.text = topSubName
        topLogoImageView.image = UIImage(named: logoImageName ?? "")
        bottomLogoImageView.image = UIImage(named: logoImageName ?? "")
        midImageView.image = UIImage(named: subImageName ?? "")
        bottomBtn.backgroundColor = bottomBtnBackgroundColor
        bottomBtn.setAttributedTitle(.setAttributedString(string: self.bottomBtn.titleLabel?.text ?? "", wordSpace: 5, textColor: bottomBtnTextColor), for: .normal)
        
        
        bodyLabel.font = UIFont(families: ["D-DIN", "NotoSansTC-Bold"], size: 15, weight: .bold)
        bodyLabel.attributedText = .setBodyTextAttriStr(string: bodyText!)
    }
    
    @objc func handlePan(reconizer: UIPanGestureRecognizer) {
        switch reconizer.state {
        case .began:
            hero_dismissViewController()
        case .changed:
            let translation = reconizer.translation(in: nil)
            let progress = translation.y / 2 / view.bounds.height
            Hero.shared.update(progress)
            
//            UIView.animate(withDuration: 0.2) {
//                self.view.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
//            }
            
        default:
            Hero.shared.finish()
        }
    }
    
    @IBAction func shareBtnClick(_ sender: UIButton) {
//        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
//            let defaultText = ""
//            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
//            self.present(activityController, animated: true, completion: nil)
//            completionHandler(true)
//        }
        
        let defaultText = ""
        let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
        
    }
    
}

extension DetailVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y > 350 {
            UIView.animate(withDuration: 1) {
                self.closeBtn.tintColor = .set(red: 197, green: 197, blue: 197)
            }
        } else {
            UIView.animate(withDuration: 1) {
                self.closeBtn.tintColor = .black
            }
        }

    }
}

extension DetailVC: UIGestureRecognizerDelegate {
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {

        
        if otherGestureRecognizer.view is UIScrollView {
            let velocity = scrollView.panGestureRecognizer.velocity(in: otherGestureRecognizer.view)
            if velocity.y > 0 {
                let point = scrollView.contentOffset
                return point.y == 0
            }
            return false
        }
        
        return false
    }
}

