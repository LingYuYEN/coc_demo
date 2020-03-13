//
//  MemberSettingCollectionViewCell.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/20.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class MemberSettingCollectionViewCell: UICollectionViewCell {

    @IBOutlet var contView: UIView!
    @IBOutlet var memoBtn: UIButton! {
        didSet {
            self.memoBtn.setAttributedTitle(.setAttributedString(string: "詳細", wordSpace: 3.75, textColor: .setMyLightMustard()), for: .normal)
            self.memoBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3.75 * 1.5, bottom: 1, right: 0)
        }
    }
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var datasLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }
    
    func setUI() {
        
        self.contentView.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 0.7, blur: 13, spread: 0)
        contView.layer.cornerRadius = 13.3 * screen.width / 414
        memoBtn.layer.cornerRadius = memoBtn.frame.height / 2
//        memoBtn.layer.masksToBounds = true
    }

}
