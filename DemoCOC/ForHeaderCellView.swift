//
//  ForHeaderCellView.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/13.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit


class ForHeaderCellView: UIView {

    @IBOutlet var contView: UIView!
    @IBOutlet var iconBtn: UIButton! {
        didSet {
            self.iconBtn.layer.cornerRadius = self.iconBtn.frame.height / 2 * screen.width / 414
            self.iconBtn.layer.borderColor = UIColor.set(red: 230, green: 230, blue: 230).cgColor
            self.iconBtn.layer.borderWidth = 1.7 * screen.width / 414
        }
    }
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            self.titleLabel.attributedText = .setTitleAttriStr(string: "今日訂單情報")
        }
    }
    @IBOutlet var largeTitleLabel: UILabel! {
        didSet {
            self.largeTitleLabel.attributedText = .setLargeTitleAttriStr(string: "商務媒合")
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Setup view from .xib file
        xibSetup()
        
    }
    func xibSetup() {
        let nib = UINib(nibName: "ForHeaderCellView", bundle: Bundle.init(for: ForHeaderCellView.self))
        contView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        contView.frame = bounds
        
        titleLabel.text = "今日訂單情報"
        largeTitleLabel.text = "商務媒合"
        self.addSubview(contView)
    }
}
