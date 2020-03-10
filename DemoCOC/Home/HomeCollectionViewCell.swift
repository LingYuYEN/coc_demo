//
//  HomeCollectionViewCell.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/13.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

// 自訂protocol方法參考：https://mmsze51899.blogspot.com/2018/11/ios-tableview-cell-tableview-cell-button.html
protocol CollectionViewCellDelegate {
    func collectionViewCellDidTap(_ sender: HomeCollectionViewCell)
}

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet var contView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var subImageView: DetailView!
    @IBOutlet var blurEffect: UIVisualEffectView!

    var delegate: CollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subImageView.memoBtn.addTarget(self, action: #selector(onBtnAction(_:)), for: .touchUpInside)
        setupUI()
    }

    func setupUI() {
        self.contentView.layer.applySketchShadow()
        self.contView.layer.cornerRadius = 13.3 * screen.height / 736
    }
    
    @objc func onBtnAction(_ sender: UIButton) {
        delegate?.collectionViewCellDidTap(self)
    }
}


