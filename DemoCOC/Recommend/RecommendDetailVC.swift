//
//  RecommendDetailVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/15.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class RecommendDetailVC: UIViewController {
    
    let classNames = ["資訊類", "金融類", "生技類", "機械類",
                      "汽車類", "電機類", "電子類", "化工類",
                      "衛生類", "土木建築類", "工業設計類", "護理類",
                      "食品類", "幼保類"]
    let names = [["蕭能維", "蕭博文"],
                 ["蕭能維", "蕭博文"],
                 ["蕭能維", "蕭博文"],
                 ["蕭能維", "蕭博文"],
                 ["蕭能維", "蕭博文"],
                 ["蕭能維", "蕭博文"],
                 ["蕭能維", "蕭博文"],
                 ["蕭能維", "蕭博文"],
                 ["蕭能維", "蕭博文"],
                 ["蕭能維", "蕭博文"],
                 ["蕭能維", "蕭博文"],
                 ["蕭能維", "蕭博文"],
                 ["蕭能維", "蕭博文"],
                 ["蕭能維", "蕭博文"]]
    let subNames = [["律師", "每得科技"],
                    ["律師", "每得科技"],
                    ["律師", "每得科技"],
                    ["律師", "每得科技"],
                    ["律師", "每得科技"],
                    ["律師", "每得科技"],
                    ["律師", "每得科技"],
                    ["律師", "每得科技"],
                    ["律師", "每得科技"],
                    ["律師", "每得科技"],
                    ["律師", "每得科技"],
                    ["律師", "每得科技"],
                    ["律師", "每得科技"],
                    ["律師", "每得科技"]]
    let headPhotos = [["headPhoto2","headPhoto4"],
                      ["headPhoto2","headPhoto4"],
                      ["headPhoto2","headPhoto4"],
                      ["headPhoto2","headPhoto4"],
                      ["headPhoto2","headPhoto4"],
                      ["headPhoto2","headPhoto4"],
                      ["headPhoto2","headPhoto4"],
                      ["headPhoto2","headPhoto4"],
                      ["headPhoto2","headPhoto4"],
                      ["headPhoto2","headPhoto4"],
                      ["headPhoto2","headPhoto4"],
                      ["headPhoto2","headPhoto4"],
                      ["headPhoto2","headPhoto4"],
                      ["headPhoto2","headPhoto4"]]
    
    let btnNames = ["推薦交流", "提拔晚輩", "聚會活動"]
    
    let bodyText = "經歷\n\n2019 - 現職\n康闓科技股份有限公司 執行⻑\n\n2012 - 2018\n派趣行動整合科技股份有限公司 執行創意總監\n\n2015 - 2017\n兼任裕峯交通行控服務平台 首席設計⻑\n\n2009 - 2012\n秀設計工作室 視覺總監\n\n\n資歷\n\n高雄蕭氏宗親會 常務理事\n企業營運管理會 指定榮譽投資⻑\n南榮中正管委會 監事\n中國天文地理易經學會 常務理監事\n南臺科技大學 研發計劃主持\n嘉南科技大學 指定美學領域授課專家\n國家型研發計劃 指定推薦廠商代表\n地方型研發計劃 指定推薦廠商代表\n榮獲中央青年署新創計劃 創新服務冠軍\n多項國家認證產品與服務\n榮獲創新獎與創意獎"
    
    let btnColor = [UIColor.white.withAlphaComponent(0.5), .white, UIColor.white.withAlphaComponent(0.5)]
    
    @IBOutlet var gradientView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "RecommendDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecommendDetailCollectionViewCell")
        collectionView.register(UINib(nibName: "RecommendDetailCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "RecommendDetailCollectionReusableView")
        
        setUI()
    }

    func setUI() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [UIColor.set(red: 13, green: 8, blue: 57).cgColor,
                                UIColor.set(red: 8, green: 26, blue: 70).cgColor]
        gradientView.layer.addSublayer(gradientLayer)
    }
    
}

extension RecommendDetailVC: RecommendDetailCollectionViewCellDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionViewCellDidTap(_ sender: RecommendDetailCollectionViewCell) {
        print(sender.cellBtnTag)
        guard let tapIndexPath = collectionView.indexPath(for: sender) else { return }
        let detailVC = DetailVC(nibName: "DetailVC", bundle: nil)
        detailVC.modalPresentationStyle = .overFullScreen
        var headPhoto = String()
        var name = String()
        var subName = String()
        if sender.cellBtnTag == 101 || sender.cellBtnTag == 103 {
            headPhoto = headPhotos[tapIndexPath.section][0]
            name = names[tapIndexPath.section][0]
            subName = subNames[tapIndexPath.section][0]
        } else {
            headPhoto = headPhotos[tapIndexPath.section][1]
            name = names[tapIndexPath.section][1]
            subName = subNames[tapIndexPath.section][1]
        }
        
//        let name = sender.cellBtnTag == 101 ? names[tapIndexPath.section][0] : names[tapIndexPath.section][1]
//        let subName = sender.cellBtnTag == 101 ? subNames[tapIndexPath.section][0] : subNames[tapIndexPath.section][1]
        
        detailVC.detailImageName = headPhoto
        detailVC.topName = name
        detailVC.topSubName = subName
        detailVC.bodyText = bodyText
        detailVC.subImageName = "detailSubImage2"
        detailVC.logoImageName = headPhoto
        detailVC.bottomBtnBackgroundColor = UIColor.set(red: 14, green: 5, blue: 55)
        detailVC.bottomBtnTextColor = UIColor.white
        detailVC.logoIsCornerRadius = true
        self.present(detailVC, animated: true, completion: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return classNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "RecommendDetailCollectionReusableView", for: indexPath) as! RecommendDetailCollectionReusableView
        header.classNameLabel.text = classNames[indexPath.section]
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendDetailCollectionViewCell", for: indexPath) as! RecommendDetailCollectionViewCell
        cell.detailView1.nameLabel.attributedText = .setDetailCellNameAttriStr(string: names[indexPath.section][0])
        cell.detailView2.nameLabel.attributedText = .setDetailCellNameAttriStr(string: names[indexPath.section][1])
        
        cell.detailView1.subNameLabel.attributedText = .setDetailCellNameAttriStr(string: subNames[indexPath.section][0])
        cell.detailView2.subNameLabel.attributedText = .setDetailCellNameAttriStr(string: subNames[indexPath.section][1])

        cell.detailView1.imageView.image = UIImage(named: headPhotos[indexPath.section][0])
        cell.detailView2.imageView.image = UIImage(named: headPhotos[indexPath.section][1])
        
        cell.delegate = self
        
        return cell
    }
    
    
}

extension RecommendDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: screen.width, height: 59 * screen.height / 736)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 374 * screen.width / 414, height: 189)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10 * screen.height / 736, left: 20 * screen.width / 414, bottom: 0, right: 20 * screen.width / 414)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20 * screen.height / 736
    }
}
