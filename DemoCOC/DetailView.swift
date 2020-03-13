//
//  DetailView.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/13.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit
//import QuartzCore

class DetailView: UIView {
    
    @IBOutlet var contView: UIView!
    @IBOutlet var imageView: UIImageView! {
        didSet {
            self.imageView.layer.cornerRadius = self.imageView.frame.height / 2
        }
    }
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            self.nameLabel.attributedText = .setDetailCellNameAttriStr(string: "")
        }
    }
    @IBOutlet var subNameLabel: UILabel! {
        didSet {
            self.subNameLabel.attributedText = .setDetailCellSubNameAttriStr(string: "")
        }
    }
    @IBOutlet var memoBtn: UIButton!
        {
        didSet {
            self.memoBtn.setAttributedTitle(.setCenterAttributedString(string: "詳情", wordSpace: 3.75, textColor: .setMyLightMustard()), for: .normal)
            self.memoBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3.75 * 1.5, bottom: 1, right: 0)
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
        let nib = UINib(nibName: "DetailView", bundle: Bundle.init(for: DetailView.self))
        contView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        contView.frame = bounds
        memoBtn.layer.cornerRadius = self.memoBtn.frame.height / 2
        memoBtn.layer.masksToBounds = true
        self.addSubview(contView)
    }
    
}
