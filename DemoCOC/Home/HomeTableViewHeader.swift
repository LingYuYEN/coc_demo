//
//  HomeTableViewHeader.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/19.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit
// 點擊section達到展開/收合效果, 參考：https://medium.com/@mikru168/ios-%E7%94%A8-uitableview-%E8%BC%95%E9%AC%86%E5%AF%A6%E4%BD%9C%E9%BB%9E%E6%93%8A-section-%E9%81%94%E5%88%B0%E5%B1%95%E9%96%8B-%E7%B8%AE%E5%90%88%E7%9A%84%E5%8A%9F%E8%83%BD-233e175d56fa
protocol SectionViewDelegate: class {
    func sectionView(_ sectionView: HomeTableViewHeader, _ didPressTag: Int, _ isExpand: Bool)
}

class HomeTableViewHeader: UITableViewHeaderFooterView {
    
    @IBOutlet var localClassBtn: UIButton!
    weak var delegate: SectionViewDelegate?
    
    var buttonTag: Int!
    var isExpand: Bool! // cell 的(展開/縮合)狀態
    override func awakeFromNib() {
        localClassBtn.setAttributedTitle(.setKernAttriStr(string: "", kern: 3.67), for: .normal)
        super.awakeFromNib()
        
    }

    /// 點擊展開/縮合按鈕
    @IBAction func pressExpendButton(_ sender: UIButton) {
        self.delegate?.sectionView(self, self.buttonTag, self.isExpand)
    }
}
