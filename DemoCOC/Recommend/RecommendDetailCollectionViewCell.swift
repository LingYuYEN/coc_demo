//
//  RecommendDetailCollectionViewCell.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/15.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

// 自訂protocol方法參考：https://mmsze51899.blogspot.com/2018/11/ios-tableview-cell-tableview-cell-button.html
protocol RecommendDetailCollectionViewCellDelegate {
    func collectionViewCellDidTap(_ sender: RecommendDetailCollectionViewCell)
}

class RecommendDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet var detailView1: DetailView!
    @IBOutlet var view1Btn: UIButton!
    @IBOutlet var detailView2: DetailView!
    @IBOutlet var view2Btn: UIButton!
    
    var delegate: RecommendDetailCollectionViewCellDelegate?
    var cellBtnTag = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 13.3 * screen.width / 414
        detailView1.memoBtn.tag = 101
        detailView2.memoBtn.tag = 102
        view1Btn.tag = 103
        view2Btn.tag = 104
        
        detailView1.memoBtn.addTarget(self, action: #selector(onBtnAction(_:)), for: .touchUpInside)
        detailView2.memoBtn.addTarget(self, action: #selector(onBtnAction(_:)), for: .touchUpInside)
        view1Btn.addTarget(self, action: #selector(onBtnAction(_:)), for: .touchUpInside)
        view2Btn.addTarget(self, action: #selector(onBtnAction(_:)), for: .touchUpInside)
    }

    @objc func onBtnAction(_ sender: UIButton) {
        switch sender.tag {
        case 101:
            cellBtnTag = sender.tag
        case 102:
            cellBtnTag = sender.tag
        case 103:
            cellBtnTag = sender.tag
        case 104:
            cellBtnTag = sender.tag
        default:
            break
        }
        delegate?.collectionViewCellDidTap(self)
    }
}
