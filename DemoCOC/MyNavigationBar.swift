//
//  MyNavigationBar.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/17.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class MyNavigationBar: UINavigationBar {

    @IBOutlet var contView: UIView!
    
    
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
        let nib = UINib(nibName: "MyNavigationBar", bundle: Bundle.init(for: MyNavigationBar.self))
        contView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        contView.frame = bounds
        self.addSubview(contView)
    }

}
