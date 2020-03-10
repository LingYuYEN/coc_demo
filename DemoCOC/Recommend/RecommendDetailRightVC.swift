//
//  RecommendDetailRightVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/20.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class RecommendDetailRightVC: UIViewController {

    let names = ["台中市蕭氏宗親會", "嘉義市蕭氏宗親會", "台中市蕭氏宗親會", "嘉義市蕭氏宗親會",
                 "台中市蕭氏宗親會", "嘉義市蕭氏宗親會", "台中市蕭氏宗親會", "嘉義市蕭氏宗親會",
                 "台中市蕭氏宗親會", "嘉義市蕭氏宗親會", "台中市蕭氏宗親會", "嘉義市蕭氏宗親會",
                 "台中市蕭氏宗親會", "嘉義市蕭氏宗親會", "台中市蕭氏宗親會", "嘉義市蕭氏宗親會",
                 "台中市蕭氏宗親會", "嘉義市蕭氏宗親會", "台中市蕭氏宗親會", "嘉義市蕭氏宗親會",
                 "台中市蕭氏宗親會", "嘉義市蕭氏宗親會", "台中市蕭氏宗親會", "嘉義市蕭氏宗親會",
                 "台中市蕭氏宗親會", "嘉義市蕭氏宗親會", "台中市蕭氏宗親會", "嘉義市蕭氏宗親會"]
    let subNames = ["第五屆理監事會議", "第五屆會員大會", "第五屆理監事會議", "第五屆會員大會",
                    "第五屆理監事會議", "第五屆會員大會", "第五屆理監事會議", "第五屆會員大會",
                    "第五屆理監事會議", "第五屆會員大會", "第五屆理監事會議", "第五屆會員大會",
                    "第五屆理監事會議", "第五屆會員大會", "第五屆理監事會議", "第五屆會員大會",
                    "第五屆理監事會議", "第五屆會員大會", "第五屆理監事會議", "第五屆會員大會",
                    "第五屆理監事會議", "第五屆會員大會", "第五屆理監事會議", "第五屆會員大會",
                    "第五屆理監事會議", "第五屆會員大會", "第五屆理監事會議", "第五屆會員大會"]
    let headPhotos = ["group15","group16", "group15","group16",
                      "group15","group16", "group15","group16",
                      "group15","group16", "group15","group16",
                      "group15","group16", "group15","group16",
                      "group15","group16", "group15","group16",
                      "group15","group16", "group15","group16",
                      "group15","group16", "group15","group16"]
    
    let bodyText = "高雄市蕭氏宗親會 第三屆會員大會\n\n活動時間\n2020-02-29(六) 12:00 ~ 14:00\n\n活動地點\n高雄市 前鎮區 林森三路 18 號\n福客來南北樓中餐廳【林森店】\n\n活動介紹\n\n高雄市蕭氏宗親會將於2月29日(週六)中午，舉辦本屆最後一次會員大會暨下屆理監事選舉，請大家踴躍出席會員大會，並投出您理想中的人選。\n\n當天大會議程\n12:30~12:45 會員報到\n12:45~13:00\n13:50~14:00\n14:00~14:10 理事長選舉\n14:10~14:20 選務/會議總結\n\n若您真的不克出席，依本會規章，您可委託其他會員代為行使權利(一會員以代理一人為限)，並請填寫委託書寄回，並請最遲於2月20日前寄達協會。如有任何問題，歡迎與協會聯繫。"
    let headerImageName = "detailImage3"
    
    @IBOutlet var gradientView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    //    @IBOutlet var recommendBtn: UIButton!
//    @IBOutlet var promotedBtn: UIButton!
//    @IBOutlet var activityBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        setUI()
    }
    
    func setUI() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [UIColor.set(red: 157, green: 25, blue: 25).cgColor,
                                UIColor.set(red: 207, green: 46, blue: 46).cgColor]
        gradientView.layer.addSublayer(gradientLayer)
    }
}

extension RecommendDetailRightVC: CollectionViewCellDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionViewCellDidTap(_ sender: HomeCollectionViewCell) {
        guard let tapIndexPath = collectionView.indexPath(for: sender) else { return }
        let detailVC = DetailVC(nibName: "DetailVC", bundle: nil)
        detailVC.modalPresentationStyle = .overFullScreen
        detailVC.detailImageName = headerImageName
        detailVC.topName = names[tapIndexPath.row]
        detailVC.topSubName = subNames[tapIndexPath.row]
        detailVC.bodyText = bodyText
        detailVC.bottomBtnBackgroundColor = UIColor.set(red: 207, green: 46, blue: 46)
        detailVC.bottomBtnTextColor = UIColor.white
        
        if tapIndexPath.section == 0 {
            detailVC.logoImageName = "group14"
        } else {
            detailVC.logoImageName = headPhotos[tapIndexPath.row]
        }
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailVC(nibName: "DetailVC", bundle: nil)
        detailVC.modalPresentationStyle = .overFullScreen
        detailVC.detailImageName = headerImageName
        detailVC.topName = names[indexPath.row]
        detailVC.topSubName = subNames[indexPath.row]
        detailVC.bodyText = bodyText
        detailVC.bottomBtnBackgroundColor = UIColor.set(red: 207, green: 46, blue: 46)
        detailVC.bottomBtnTextColor = UIColor.white
        
        if indexPath.section == 0 {
            detailVC.logoImageName = "group14"
        } else {
            detailVC.logoImageName = headPhotos[indexPath.row]
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
            cell.subImageView.nameLabel.attributedText = .setDetailCellNameAttriStr(string: "高雄市蕭氏宗親會")
            cell.subImageView.subNameLabel.attributedText = .setDetailCellSubNameAttriStr(string: "第三屆會員大會")
            cell.subImageView.imageView.image = UIImage(named: "group14")
            cell.imageView.image = UIImage(named: headerImageName)
            cell.subImageView.memoBtn.setAttributedTitle(.setCenterAttributedString(string: "參加", wordSpace: 3.75, textColor: .setMyLightMustard()), for: .normal)
        } else {
            cell.subImageView.backgroundColor = .white
            cell.subImageView.nameLabel.attributedText = .setDetailCellNameAttriStr(string: names[indexPath.row])
            cell.subImageView.subNameLabel.attributedText = .setDetailCellSubNameAttriStr(string: subNames[indexPath.row])
            cell.subImageView.imageView.image = UIImage(named: headPhotos[indexPath.row])
            cell.subImageView.memoBtn.setAttributedTitle(.setCenterAttributedString(string: "參加", wordSpace: 3.75, textColor: .setMyLightMustard()), for: .normal)
        }
        cell.delegate = self
        return cell
    }
}

extension RecommendDetailRightVC: UICollectionViewDelegateFlowLayout {
    
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
