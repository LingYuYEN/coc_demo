//
//  RegisteredVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/25.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit


class RegisteredVC: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var registerBtn: UIButton!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var noteTextView: UITextView!
    @IBOutlet var registerLogoImageView: UIImageView!
    @IBOutlet var originalBtn: UIButton! {
        didSet {
            self.originalBtn.layer.cornerRadius = self.originalBtn.frame.height / 2
        }
    }
    @IBOutlet var newBtn: UIButton! {
           didSet {
               self.newBtn.layer.cornerRadius = self.newBtn.frame.height / 2
           }
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTextView.delegate = self
        
        setUI()
        
    }
    
    func setUI() {
        registerLogoImageView.layer.borderWidth = 5
        registerLogoImageView.layer.borderColor = UIColor.lightGray.cgColor
        registerLogoImageView.layer.cornerRadius = 25 * screen.width / 414
        
        guard let url = URL(string: "https://conquers.co") else { return }
        let attributedStr = NSMutableAttributedString(string: "註冊完成即代表同意  康闓科技  服務條款  與  隱私權政策  。",
                                                      attributes: [.font : UIFont(name: "NotoSansTC-Bold", size: 10.7)!,
                                                                   .kern : 1.67,
                                                                   .foregroundColor : UIColor.set(red: 14, green: 5, blue: 55)])
        attributedStr.addAttribute(.link,
                                   value: url,
                                   range: NSRange(location: 17, length: 4))
        attributedStr.addAttribute(.link,
                                   value: url,
                                   range: NSRange(location: 26, length: 5))
        
        noteTextView.attributedText = attributedStr
        noteTextView.linkTextAttributes = [
            .foregroundColor: UIColor.set(red: 252, green: 216, blue: 64),
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        

//        let wordSpace = (134.3 * screen.width / 414  - (8 * 5)) / 5
        titleLabel.attributedText = .setKernAttriStr(string: "臺灣蕭氏宗親總會",
                                                     kern: 3)
        subTitleLabel.attributedText = .setKernAttriStr(string: "亞洲最大商業交流平台",
                                                        kern: 3)
//        titleLabel.attributedText = .setAttributedString(string: "臺灣蕭氏宗親總會",
//                                                         wordSpace: 5,
//                                                         textColor: .set(red: 14, green: 5, blue: 55))
        
        registerBtn.setAttributedTitle(.setAttributedString(string: "註冊", wordSpace: 2.34, textColor: UIColor.set(red: 252, green: 216, blue: 64)), for: .normal)
        loginBtn.setAttributedTitle(.setAttributedString(string: "登入", wordSpace: 2.34, textColor: UIColor.set(red: 252, green: 216, blue: 64)), for: .normal)
        
        registerBtn.layer.cornerRadius = 18 * screen.width / 414
        loginBtn.layer.cornerRadius = 18 * screen.width / 414
        
    }

    @IBAction func onRegisterBtnClick(_ sender: UIButton) {
        presentToNextVC(isRigister: true)
    }
    
    @IBAction func onLoginBtnClick(_ sender: UIButton) {
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "tabbarVC")
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
        presentToNextVC(isRigister: false)
    }
    
    func presentToNextVC(isRigister: Bool) {
        let vc = RegisteredSecVC(nibName: "RegisteredSecVC", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.isRegister = isRigister
        present(vc, animated: true, completion: nil)
    }
}

// 透過 TextView 代理，使用 shouldInteractWith URL 來取消點擊後前往網頁
// return false 則不前往網頁，並可再次定義動作
extension RegisteredVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        // 並可指定不同 Range 而不同動作
        if characterRange == NSRange(location: 17, length: 4) {
            let webVC = WebVC(nibName: "WebVC", bundle: nil)
            webVC.modalPresentationStyle = .fullScreen
            self.show(webVC, sender: self)
//            self.present(webVC, animated: true, completion: nil)
            return false
        } else {
            let anotherVC = AnotherVC(nibName: "AnotherVC", bundle: nil)
            anotherVC.modalPresentationStyle = .fullScreen
            self.present(anotherVC, animated: true, completion: nil)
            return false
        }
    }
}
