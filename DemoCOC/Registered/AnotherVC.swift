//
//  AnotherVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/27.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class AnotherVC: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var textView: UITextView!
    
    let privacyPolicyStr = "歡迎您使用商會系統（以下簡稱本APP），為了讓您能夠安心的使用本APP的各項服務與資訊，特此向您說明本APP的隱私權保護政策，以保障您的權益，請您詳閱下列內容：\n\n一、隱私權保護政策的適用範圍\n\n隱私權保護政策內容，包括本APP如何處理在您使用APP服務時收集到的個人識別資料。隱私權保護政策不適用於本APP以外的相關連結網站，也不適用於非本APP所委託或參與管理的人員。\n\n二、個人資料的蒐集、處理及利用方式\n\n當您造訪本APP或使用本APP所提供之功能服務時，我們將視該服務功能性質，請您提供必要的個人資料，並在該特定目的範圍內處理及利用您的個人資料；非經您書面同意，本APP不會將個人資料用於其他用途。於一般瀏覽時，系統會自行記錄相關行徑，包括您使用連線設備的IP位址、使用時間記錄等，做為我們增進網站服務的參考依據，此記錄為內部應用，決不對外公佈。為提供精確的服務，我們會將收集的問卷調查內容進行統計與分析，分析結果之統計數據或說明文字呈現，除供內部研究外，我們會視需要公佈統計數據及說明文字，但不涉及特定個人之資料。\n\n三、資料之保護\n\n本APP主機均設有防火牆、防毒系統等相關的各項資訊安全設備及必要的安全防護措施，加以保護網站及您的個人資料採用嚴格的保護措施，只由經過授權的人員才能接觸您的個人資料，相關處理人員皆簽有保密合約，如有違反保密義務者，將會受到相關的法律處分。如因業務需要有必要委託其他單位提供服務時，本APP亦會嚴格要求其遵守保密義務，並且採取必要檢查程序以確定其將確實遵守。\n\n四、網站對外的相關連結\n\n本APP內提供其他網站的網路連結，您也可經由本APP所提供的連結，點選進入其他網站。但該連結網站不適用本APP的隱私權保護政策，您必須參考該連結網站中的隱私權保護政策。\n\n五、與第三人共用個人資料之政策\n\n本APP絕不會提供、交換、出租或出售任何您的個人資料給其他個人、團體、私人企業或公務機關，但有法律依據或合約義務者，不在此限。前項但書之情形包括不限於：\n\n• 經由您書面同意。\n• 法律明文規定。\n• 為免除您生命、身體、自由或財產上之危險。\n• 與公務機關或學術研究機構合作，基於公共利益為統計或學術研究而有必要，且資料經過提供者處理或蒐集者依其揭露方式無從識別特定之當事人。\n• 當您在本APP的行為，違反服務條款或可能損害或妨礙網站與其他使用者權益或導致任何人遭受損害時，經網站管理單位研析揭露您的個人資料是為了辨識、聯絡或採取法律行動所必要者。\n• 有利於您的權益。\n• 本APP委託廠商協助蒐集、處理或利用您的個人資料時，將對委外廠商或個人善盡監督管理之責。\n\n六、隱私權保護政策之修正\n\n本APP隱私權保護政策將因應需求隨時進行修正，修正後的條款將刊登於網站上。"
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        textView.text = privacyPolicyStr
        
        var attrStr = NSMutableAttributedString(string: privacyPolicyStr)
        attrStr.addAttribute(.kern, value: 1.9, range: NSRange(location: 0, length: attrStr.length))
        attrStr.addAttribute(.font, value: UIFont(name: "NotoSansTC-Medium", size: 15)!, range: NSRange(location: 0, length: attrStr.length))
        attrStr.addAttribute(.foregroundColor, value: UIColor.setMyGray(), range: NSRange(location: 0, length: attrStr.length))
        textView.attributedText = attrStr
        
        
        attrStr = NSMutableAttributedString(string: "隱私權政策")
        attrStr.addAttribute(.kern, value: 5, range: NSRange(location: 0, length: attrStr.length))
        attrStr.addAttribute(.font, value: UIFont(name: "NotoSansTC-Bold", size: 25)!, range: NSRange(location: 0, length: attrStr.length))
        attrStr.addAttribute(.foregroundColor, value: UIColor.darkGray, range: NSRange(location: 0, length: attrStr.length))
        titleLabel.attributedText = attrStr
//        titleLabel.attributedText = .setKernAttriStr(string: "隱私權政策", kern: 5)
//        textView.attributedText = .setKernAttriStr(string: privacyPolicyStr, kern: 1.9)
    }

    @IBAction func onCloseBtnClick(_ sender: MyButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
