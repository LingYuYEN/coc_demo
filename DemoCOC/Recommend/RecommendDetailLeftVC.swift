//
//  RecommendDetailLeftVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/20.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class RecommendDetailLeftVC: UIViewController {

    @IBOutlet var gradientView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    let names = ["尋求新事業合作商", "整體品牌規劃需求", "尋求新事業合作商", "整體品牌規劃需求",
                 "尋求新事業合作商", "整體品牌規劃需求", "尋求新事業合作商", "整體品牌規劃需求",
                 "尋求新事業合作商", "整體品牌規劃需求", "尋求新事業合作商", "整體品牌規劃需求",
                 "尋求新事業合作商", "整體品牌規劃需求", "尋求新事業合作商", "整體品牌規劃需求",
                 "尋求新事業合作商", "整體品牌規劃需求", "尋求新事業合作商", "整體品牌規劃需求",
                 "尋求新事業合作商", "整體品牌規劃需求", "尋求新事業合作商", "整體品牌規劃需求",
                 "尋求新事業合作商", "整體品牌規劃需求", "尋求新事業合作商", "整體品牌規劃需求"]
    let subNames = ["南良集團", "茶文化有限公司", "南良集團", "茶文化有限公司",
                    "南良集團", "茶文化有限公司", "南良集團", "茶文化有限公司",
                    "南良集團", "茶文化有限公司", "南良集團", "茶文化有限公司",
                    "南良集團", "茶文化有限公司", "南良集團", "茶文化有限公司",
                    "南良集團", "茶文化有限公司", "南良集團", "茶文化有限公司",
                    "南良集團", "茶文化有限公司", "南良集團", "茶文化有限公司",
                    "南良集團", "茶文化有限公司", "南良集團", "茶文化有限公司"]
    let headPhotos = ["group11","group10", "group11","group10",
                      "group11","group10", "group11","group10",
                      "group11","group10", "group11","group10",
                      "group11","group10", "group11","group10",
                      "group11","group10", "group11","group10",
                      "group11","group10", "group11","group10",
                      "group11","group10", "group11","group10"]
    
    let bodyText = "本公司最早於日據時代由 蕭順正先生擔任醬油廠技術員，1945年台灣光復後於嘉義縣布袋鎮成立新來源醬園，以傳統家庭式生產醬料。1965年本公司董事長蕭戊堅先生成立新來源醬園有限公司，廠址設於高雄市四維一路144號，初期主要經營醬油及醬瓜等產品，為因應市場需求量增加，於1980年遷廠至高雄縣大發工業區大有二街29號，佔地近2000坪，並改制為新來源醬園股份有限公司，目前員工人數約50人。\n\n近年來積極轉型並委託食品專業顧問公司輔導，著重於人員培訓，品質管制，生產技術提昇，硬體設備擴充改善，並取得ISO 22000、HACCP驗證。\n\n行銷通路透過參加台北世貿國際食品展覽而更寬廣，目前合作的對象為國防部、知名超商、量販店、連鎖超市及團膳批發業者，並於2009年開始外銷美 國、南非，將來目標為行銷全世界。"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        setUI()
    }
    
    func setUI() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [UIColor.set(red: 102, green: 196, blue: 233).cgColor,
                                UIColor.set(red: 125, green: 218, blue: 255).cgColor]
        gradientView.layer.addSublayer(gradientLayer)
    }
}

extension RecommendDetailLeftVC: CollectionViewCellDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionViewCellDidTap(_ sender: HomeCollectionViewCell) {
        guard let tapIndexPath = collectionView.indexPath(for: sender) else { return }
        let detailVC = DetailVC(nibName: "DetailVC", bundle: nil)
        detailVC.modalPresentationStyle = .overFullScreen
        
        if tapIndexPath.section == 0 {
            detailVC.topName = "主打熱門商品"
            detailVC.topSubName = "創意傢飾股份有限公司"
            detailVC.bodyText = bodyText
            detailVC.logoImageName = headPhotos[tapIndexPath.row]
            detailVC.subImageName = "detailSubImage"
        } else {
            detailVC.topName = names[tapIndexPath.row]
            detailVC.topSubName = subNames[tapIndexPath.row]
            detailVC.bodyText = bodyText
            detailVC.logoImageName = headPhotos[tapIndexPath.row]
            detailVC.subImageName = "detailSubImage"
        }
        self.present(detailVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailVC(nibName: "DetailVC", bundle: nil)
        detailVC.modalPresentationStyle = .overFullScreen
        
        if indexPath.section == 0 {
            detailVC.topName = "主打熱門商品"
            detailVC.topSubName = "創意傢飾股份有限公司"
            detailVC.bodyText = bodyText
            detailVC.logoImageName = headPhotos[indexPath.row]
            detailVC.subImageName = "detailSubImage"
        } else {
            detailVC.topName = names[indexPath.row]
            detailVC.topSubName = subNames[indexPath.row]
            detailVC.bodyText = bodyText
            detailVC.logoImageName = headPhotos[indexPath.row]
            detailVC.subImageName = "detailSubImage"
        }
        self.present(detailVC, animated: true, completion: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return names.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.subImageView.imageView.layer.cornerRadius = 0
        if indexPath.section == 0 {
            cell.subImageView.nameLabel.attributedText = .setDetailCellNameAttriStr(string: "主打熱門商品")
            cell.subImageView.subNameLabel.attributedText = .setDetailCellSubNameAttriStr(string: "創意傢飾股份有限公司")
            cell.subImageView.imageView.image = UIImage(named: "group6")
        } else {
            cell.subImageView.backgroundColor = .white
            cell.subImageView.nameLabel.attributedText = .setDetailCellNameAttriStr(string: names[indexPath.row])
            cell.subImageView.subNameLabel.attributedText = .setDetailCellSubNameAttriStr(string: subNames[indexPath.row])
            cell.subImageView.imageView.image = UIImage(named: headPhotos[indexPath.row])
        }
        
        cell.delegate = self
        return cell
    }
}

extension RecommendDetailLeftVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: 374 * screen.width / 414, height: 360 * screen.height / 736)
        } else {
            return CGSize(width: 374 * screen.width / 414, height: 94)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10 * screen.height / 736, left: 20 * screen.width / 414, bottom: 10 * screen.height / 736, right: 20 * screen.width / 414)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20 * screen.height / 736
    }
}
