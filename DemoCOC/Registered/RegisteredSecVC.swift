//
//  RegisteredSecVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/25.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit
import Firebase

class RegisteredSecVC: UIViewController {
    
    @IBOutlet var largeTitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var areaCodeTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var nextStepBtn: UIButton!
    @IBOutlet var noteTextView: UITextView!
    @IBOutlet var closeBtn: MyButton!
    @IBOutlet var memoLabel: UILabel!
    @IBOutlet var errorLabel: UILabel!
    
    var randomNumber: Int!
    var isRegister = false
    var hasPhoneNumber = false
    var canLogin = false
    
    
    let registerText = "已擁有帳號 即可直接"
    let loginText = "尚未擁有帳號  請輸入手機號碼"
    var dataList = [UserItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberTextField.delegate = self
        
        setUI()
    }
    func setUI() {
        guard let url = URL(string: "https://conquers.co") else { return }
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        var attributedStr = NSMutableAttributedString(string: "註冊完成即代表同意  康闓科技  服務條款  與  隱私權政策  。 ",
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
        
        largeTitleLabel.attributedText = .setAttributedString(string: "來交流做個好生意吧",
                                                              wordSpace: 4.33,
                                                              textColor: .set(red: 14, green: 5, blue: 55))
        
        attributedStr = NSMutableAttributedString(string: isRegister ? "請輸入手機號碼註冊" : "請輸入手機號碼登入",
                                                  attributes: [.kern : 3.97,
                                                               .foregroundColor : UIColor.set(red: 210, green: 209, blue: 218)])
        attributedStr.addAttribute(.foregroundColor,
                                   value: UIColor.set(red: 180, green: 179, blue: 188),
                                   range: NSRange(location: 7, length: 2))
        attributedStr.addAttribute(.font,
                                   value: UIFont(name: "NotoSansTC-Bold", size: 18)!,
                                   range: NSRange(location: 7, length: 2))
        
        titleLabel.attributedText = attributedStr
        
        
        //        titleLabel.attributedText = .setAttributedString(string: isRegister ? "請輸入手機號碼註冊" : "請輸入手機號碼登入",
        //                                                         wordSpace: 3.97,
        //                                                         textColor: .set(red: 210, green: 209, blue: 218))
        
        
        areaCodeTextField.attributedText = .setAttributedString(string: "+ 886",
                                                                wordSpace: 2.33,
                                                                textColor: .set(red: 14, green: 5, blue: 55))
        phoneNumberTextField.attributedText = .setAttributedString(string: "912345678",
                                                                   wordSpace: 2.4,
                                                                   textColor: .set(red: 14, green: 5, blue: 55))
        
        areaCodeTextField.layer.cornerRadius = 18 * screen.width / 414
        phoneNumberTextField.layer.cornerRadius = 18 * screen.width / 414
        
        
        // leftView 可將文本框文字位置偏移
        phoneNumberTextField.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 28 * screen.width / 414, height: 0))
        phoneNumberTextField.leftViewMode = .always
        
        attributedStr = NSMutableAttributedString(string: isRegister ? "登入" : "註冊")
        attributedStr.addAttribute(.kern,
                                   value: 2.66,
                                   range: NSRange(location: 0,
                                                  length: attributedStr.length))
        attributedStr.addAttribute(.foregroundColor,
                                   value: UIColor.set(red: 252, green: 216, blue: 64),
                                   range: NSRange(location: 0,
                                                  length: attributedStr.length))
        attributedStr.addAttributes(underlineAttribute,
                                    range: NSRange(location: 0,
                                                   length: attributedStr.length))
        loginBtn.setAttributedTitle(attributedStr, for: .normal)
        
        nextStepBtn.setAttributedTitle(.setAttributedString(string: "下一步",
                                                            wordSpace: 2.34,
                                                            textColor: .set(red: 252, green: 216, blue: 64)), for: .normal)
        nextStepBtn.layer.cornerRadius = 18 * screen.width / 414
        memoLabel.attributedText = .setKernAttriStr(string: isRegister ? registerText : loginText, kern: 2.34)
        errorLabel.attributedText = .setKernAttriStr(string: isRegister ? "該門號已註冊  請前往登入畫面" : "該門號尚未註冊  請前往註冊頁面", kern: 2.34)
        errorLabel.isHidden = true
    }
    
    @IBAction func onCloseBtnClick(_ sender: MyButton) {
        //        var rootVC = self.presentingViewController
        //        while let parent = rootVC?.presentingViewController {
        //            rootVC = parent
        //        }
        //
        //        // 釋放所有下級視圖
        //        rootVC?.dismiss(animated: true, completion: nil)
        let vc = RegisteredVC(nibName: "RegisteredVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.view.transform = CGAffineTransform(translationX: 0, y: screen.height)
        }) { _ in
            self.present(vc, animated: false, completion: nil)
        }
        
    }
    
    @IBAction func onLoginBtnClick(_ sender: MyButton) {
        switch isRegister {
        case true:
            let vc = RegisteredSecVC(nibName: "RegisteredSecVC", bundle: nil)
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            vc.isRegister = false
            self.present(vc, animated: true, completion: nil)
        case false:
            let vc = RegisteredSecVC(nibName: "RegisteredSecVC", bundle: nil)
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            vc.isRegister = true
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func onNextStepBtnClick(_ sender: UIButton) {
        print("是否註冊： ", isRegister)
        switch isRegister {
        case true:
            registerAction()
        case false:
            loginAction()
        }
        
    }
    /// 登入動作
    func loginAction() {
        let phoneNumber = "0\(phoneNumberTextField.text!)"
        UIView.animate(withDuration: 0.3) {
            self.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        self.view.endEditing(true)
        
        if  phoneNumberTextField.text?.count == 9 {
            // 查詢門號是否已註冊
            let ref = Database.database().reference().child("users")
            ref.queryOrdered(byChild: "phone").queryEqual(toValue: phoneNumber).observe(.value) { snapshot in
                if snapshot.exists() {
                    print("exist")
                    // 進入登入流程
                    self.randomNumber = Int(arc4random_uniform(899999) + 100000)
                    if let randomNumber = self.randomNumber {
                        let smsBody = "註冊驗證碼： \(randomNumber)"
                        print(smsBody)
                        
                        // 發送驗證簡訊
                        DataManager.shared.getSMSCode(phoneNumber: phoneNumber, smsBody: smsBody) {
                            let nextVC = RegisteredThreeVC(nibName: "RegisteredThreeVC", bundle: nil)
                            nextVC.modalPresentationStyle = .fullScreen
                            nextVC.phoneNumber = self.phoneNumberTextField.text!
                            nextVC.verificationCode = "\(randomNumber)"
                            nextVC.largeTitleText = "請輸入登入驗證碼"
                            nextVC.isRegister = false
                            self.present(nextVC, animated: true, completion: nil)
                        }
                    }
                } else {
                    print("not exist")
                    self.errorLabel.isHidden = false
                }
            }
        } else {
            print("請輸入正確手機號碼")
        }
    }
    
    /// 註冊動作
    func registerAction() {
        let phoneNumber = "0\(phoneNumberTextField.text!)"
        UIView.animate(withDuration: 0.3) {
            self.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        self.view.endEditing(true)
        
        if  phoneNumberTextField.text?.count == 9 {
            
            Database.database().reference().child("users").queryOrdered(byChild: "phone").queryEqual(toValue: phoneNumber).observe(.value) { snapshot in
                if snapshot.exists() {
                    self.errorLabel.isHidden = false
                } else {
                    // Database 無此門號，至下一頁取得驗證碼註冊
                    // 進入註冊流程
                    self.randomNumber = Int(arc4random_uniform(899999) + 100000)
                    if let randomNumber = self.randomNumber {
                        let smsBody = "註冊驗證碼： \(randomNumber)"
                        print(smsBody)
                        
                        // 發送驗證簡訊
                        DataManager.shared.getSMSCode(phoneNumber: phoneNumber, smsBody: smsBody) {
                            let nextVC = RegisteredThreeVC(nibName: "RegisteredThreeVC", bundle: nil)
                            nextVC.modalPresentationStyle = .fullScreen
                            nextVC.phoneNumber = self.phoneNumberTextField.text!
                            nextVC.verificationCode = "\(randomNumber)"
                            nextVC.largeTitleText = "請輸入註冊驗證碼"
                            nextVC.isRegister = true
                            self.present(nextVC, animated: true, completion: nil)
                        }
                    }
                }
            }
        } else {
            print("請輸入正確手機號碼")
        }
    }
}

extension RegisteredSecVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.phoneNumberTextField.attributedText = .setKernAttriStr(string: "", kern: 2.4)
        UIView.animate(withDuration: 0.3) {
            self.view.transform = CGAffineTransform(translationX: 0, y: -50)
        }
        self.errorLabel.isHidden = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else { return true}
        textField.attributedText = .setKernAttriStr(string: text, kern: 2.4)
        
        let allowedCharacters = CharacterSet(charactersIn:"0123456789")
        let characterSet = CharacterSet(charactersIn: string)
        
        // 長度不得大於 9
        let count = text.count + string.count - range.length
        if count > 9 {
            return false
        } else {
            return allowedCharacters.isSuperset(of: characterSet)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.3) {
            self.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        self.view.endEditing(true)
    }
    
    
}
