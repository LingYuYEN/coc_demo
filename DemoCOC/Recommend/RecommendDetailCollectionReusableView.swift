//
//  RecommendDetailCollectionReusableView.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/15.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class RecommendDetailCollectionReusableView: UICollectionReusableView {

    @IBOutlet var classNameLabel: UILabel! {
        didSet {
            self.classNameLabel.attributedText = .setAttributedString(string: self.classNameLabel.text ?? "", wordSpace: 4.68, textColor: .white)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
