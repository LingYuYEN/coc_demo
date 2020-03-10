//
//  MemberSettingPage1VC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/20.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class MemberSettingPage1VC: UIViewController {
    
    let titleNames = ["已媒合筆數", "被推薦筆數", "滿意度比例", "收藏筆數"]
    let datas = ["1090", "2850", "96.5", "285"]
    let collectionIconNames = ["collectionIcon1", "collectionIcon2", "collectionIcon3", "collectionIcon4"]

    @IBOutlet var contView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var photoView: UIImageView! {
        didSet {
            self.photoView.layer.cornerRadius = self.photoView.frame.height / 2
        }
    }
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            self.nameLabel.attributedText = .setAttributedString(string: self.nameLabel.text ?? "", wordSpace: 3.18, textColor: .black)
        }
    }
    @IBOutlet var subNameLabel: UILabel! {
        didSet {
            self.subNameLabel.attributedText = .setAttributedString(string: self.subNameLabel.text ?? "", wordSpace: 1.3, textColor: .setMyGray())
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "MemberSettingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MemberSettingCollectionViewCell")
        collectionView.register(UINib(nibName: "RecommendDetailCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "RecommendDetailCollectionReusableView")
        setUI()
    }
    

    func setUI() {
        contView.layer.borderColor = UIColor.set(red: 211, green: 211, blue: 211).cgColor
        contView.layer.borderWidth = 0.3
    }

}

extension MemberSettingPage1VC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "RecommendDetailCollectionReusableView", for: indexPath) as! RecommendDetailCollectionReusableView
        header.classNameLabel.attributedText = .setAttributedString(string: "黃金榮譽", wordSpace: 3.18, textColor: .black)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemberSettingCollectionViewCell", for: indexPath) as! MemberSettingCollectionViewCell
        cell.titleLabel.attributedText = .setAttributedString(string: titleNames[indexPath.row], wordSpace: 1.3, textColor: .black)
        cell.iconImage.image = UIImage(named: collectionIconNames[indexPath.row])
        cell.datasLabel.attributedText = .setAttributedString(string: datas[indexPath.row], wordSpace: 1.7, textColor: .setMyLightMustard())
        return cell
    }
    
}

extension MemberSettingPage1VC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: screen.width, height: 48 * screen.height / 736)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180 * screen.width / 414, height: 185 * screen.height / 736)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10 * screen.width / 414, left: 20.5 * screen.width / 414, bottom: 20.5 * screen.width / 414, right: 20.5 * screen.width / 414)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13.3 * screen.width / 414
    }
}

