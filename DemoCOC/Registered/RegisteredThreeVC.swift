//
//  RegisteredThreeVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/25.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit
import Firebase

class RegisteredThreeVC: UIViewController {
    
    @IBOutlet var largeTitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var verificationTextField: UITextField!
    @IBOutlet var nextStepBtn: UIButton!
    @IBOutlet var repeatLabel: UILabel!
    @IBOutlet var repeatBtn: UIButton!
    
//    var db: Firestore!
    var timer: Timer?
    let formatter = Formatter()
    // 新增節點
    let reference: DatabaseReference! = Database.database().reference().child("users")
    
    var secCount = 59
    var phoneNumber = ""
    var verificationCode = ""
    var largeTitleText = ""
    var isRegister = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        verificationTextField.delegate = self
//        verificationTextField.becomeFirstResponder()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeRepeat(_:)), userInfo: nil, repeats: true)
        
        
        
    }
    
    @objc func timeRepeat(_ time:Timer) -> Void {
        secCount -= 1
        
        
        if secCount >= 0 && secCount < 10 {
            repeatLabel.attributedText = .setAttributedString(string: "00:0\(secCount)  後可重新傳送驗證碼",
            wordSpace: 2.34,
            textColor: .set(red: 210, green: 209, blue: 218))
        } else {
            repeatLabel.attributedText = .setAttributedString(string: "00:\(secCount)  後可重新傳送驗證碼",
            wordSpace: 2.34,
            textColor: .set(red: 210, green: 209, blue: 218))
        }
        
        
        if secCount == 0 {
            repeatBtn.isHidden = false
            secCount = 60
            timer?.invalidate()
        }
    }
    
    
    func setUI() {
        repeatBtn.isHidden = true
        
        largeTitleLabel.attributedText = .setAttributedString(string: largeTitleText,
                                                              wordSpace: 4.33,
                                                              textColor: .set(red: 14, green: 5, blue: 55))
        titleLabel.attributedText = .setAttributedString(string: "傳送到  +886 \(phoneNumber)",
                                                         wordSpace: 3.97,
                                                         textColor: .set(red: 210, green: 209, blue: 218))
        verificationTextField.attributedText = .setAttributedString(string: "- - - - - -",
                                                                    wordSpace: 2.4,
                                                                    textColor: .set(red: 14, green: 5, blue: 55))
        nextStepBtn.setAttributedTitle(.setAttributedString(string: "下一步",
                                                            wordSpace: 2.34,
                                                            textColor: .set(red: 252, green: 216, blue: 64)), for: .normal)
        nextStepBtn.layer.cornerRadius = 18 * screen.width / 414
        
        repeatLabel.attributedText = .setAttributedString(string: "00:59  後可重新傳送驗證碼",
                                                          wordSpace: 2.34,
                                                          textColor: .set(red: 210, green: 209, blue: 218))
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributedStr = NSMutableAttributedString(string: "重新傳送")
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
        repeatBtn.setAttributedTitle(attributedStr, for: .normal)
        
    }
    @IBAction func onRepeatBtnClick(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeRepeat(_:)), userInfo: nil, repeats: true)
        self.repeatBtn.isHidden = true
        let randomNumber = Int(arc4random_uniform(899999) + 100000)
        let smsBody = "驗證碼： \(randomNumber)"
        verificationCode = "\(randomNumber)"
        DataManager.shared.getSMSCode(phoneNumber: "0\(phoneNumber)", smsBody: smsBody) {
            self.verificationTextField.attributedText = .setKernAttriStr(string: "", kern: 2.4)
            self.verificationTextField.becomeFirstResponder()
        }
        
    }
    
    @IBAction func onCloseBtnClick(_ sender: MyButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onNextBtnClick(_ sender: UIButton) {
        if let verificationText = verificationTextField.text {
            // 註冊 / 登入成功
            if verificationText == verificationCode {
                switch isRegister {
                case true:
                    // 將門號儲存至firebase，並產生 UUID，儲存到 KeyChain
                    addData(phoneNumber: phoneNumber)
                    
                    self.view.endEditing(true)
                    UIView.animate(withDuration: 0.3) {
                        self.view.transform = CGAffineTransform(translationX: 0, y: 0)
                    }
                case false:
                    break
                }
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = sb.instantiateViewController(withIdentifier: "tabbarVC")
                mainVC.modalPresentationStyle = .fullScreen
                self.present(mainVC, animated: false, completion: nil)
            } else {
                print("驗證碼錯誤")
            }
        }
        
    }
    /// 新增資料庫
    func addData(phoneNumber: String) {
        let DEVICE_UUID: String = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString  // 產生 UUID
        if let data = DEVICE_UUID.data(using: .utf8) {
            print(data)
            let query = [
                kSecClass as String       : kSecClassGenericPassword as String,
                kSecAttrAccount as String : "DEVICE_UUID",      // key
                kSecValueData as String   : data                // value
                ] as [String : Any]
            
            SecItemDelete(query as CFDictionary)
            SecItemAdd(query as CFDictionary, nil)
        }
        
        // 新增節點資料
        var user: [String : AnyObject] = [String : AnyObject]()
        user["phone"] = "0\(phoneNumber)" as AnyObject
        user["createDate"] = "2020/03/06" as AnyObject
        user["DEVICE_UUID"] = "\(DEVICE_UUID)" as AnyObject
        
        // 隨機生成的節點唯一識別碼，用來當儲存時的key值
        let childRef = reference.childByAutoId()
        let userReference = reference.child(childRef.key!)
        
        userReference.updateChildValues(user) { (error, ref) in
            if let error = error {
                print("error： \(error)")
                return
            }
            print(ref.description())
        }
    }
}

extension RegisteredThreeVC: UITextFieldDelegate {
    
    // 開始編輯 textField 時，鍵盤將會升起，故整個 View 向上位移
    func textFieldDidBeginEditing(_ textField: UITextField) {
        verificationTextField.attributedText = .setKernAttriStr(string: "", kern: 2.4)
        UIView.animate(withDuration: 0.3) {
            self.view.transform = CGAffineTransform(translationX: 0, y: -50)
            
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else { return true}
        textField.attributedText = .setKernAttriStr(string: text, kern: 2.4)
        
        let allowedCharacters = CharacterSet(charactersIn:"0123456789")
        let characterSet = CharacterSet(charactersIn: string)
        
        // 長度不得大於 6
        let count = text.count + string.count - range.length
        if count > 6 {
            return false
        } else {
            return allowedCharacters.isSuperset(of: characterSet)
        }
    }
    
    // 再次 touch 後，鍵盤收起，故整個 View 向下還原
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.3) {
            self.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        self.view.endEditing(true)
    }
    
    
}
