//
//  NaviTitleView.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/17.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit


class NaviTitleView: UIView {

    @IBOutlet var contView: UIView!
    @IBOutlet var naviTitleBtn: UIButton!
    @IBOutlet var naviTitleImageBtn: UIButton!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Setup view from .xib file
        xibSetup()
        
    }

    func xibSetup() {
        let nib = UINib(nibName: "NaviTitleView", bundle: Bundle.init(for: NaviTitleView.self))
        contView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        contView.frame = bounds
        naviTitleBtn.setAttributedTitle(.setKernAttriStr(string: "全台需求", kern: 5), for: .normal)
//        naviTitleBtn.setAttributedTitle(.setNaviTitleAttriStr(string: "全台需求"), for: .normal)
        self.addSubview(contView)
    }
    
}
