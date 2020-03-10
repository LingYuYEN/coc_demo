//
//  ActivityVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/17.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class ActivityVC: UIViewController {
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
    
    let cellHeroID = ["1", "2", "3", "4",
                      "5", "6", "7", "8",
                      "9", "10", "11", "12",
                      "13", "14", "15", "16",
                      "17", "18", "19", "20",
                      "21", "22", "23", "24",
                      "25", "26", "27", "28"]
    
    let cellHeroID2 = ["a", "b", "c", "d",
                       "e", "f", "g", "h",
                       "i", "j", "k", "l",
                       "m", "n", "o", "p",
                       "q", "r", "s", "t",
                       "u", "v", "w", "x",
                       "y", "z", "aa", "bb"]
    
    let bodyText = "高雄市蕭氏宗親會 第三屆會員大會\n\n活動時間\n2020-02-29(六) 12:00 ~ 14:00\n\n活動地點\n高雄市 前鎮區 林森三路 18 號\n福客來南北樓中餐廳【林森店】\n\n活動介紹\n\n高雄市蕭氏宗親會將於2月29日(週六)中午，舉辦本屆最後一次會員大會暨下屆理監事選舉，請大家踴躍出席會員大會，並投出您理想中的人選。\n\n當天大會議程\n12:30~12:45 會員報到\n12:45~13:00\n13:50~14:00\n14:00~14:10 理事長選舉\n14:10~14:20 選務/會議總結\n\n若您真的不克出席，依本會規章，您可委託其他會員代為行使權利(一會員以代理一人為限)，並請填寫委託書寄回，並請最遲於2月20日前寄達協會。如有任何問題，歡迎與協會聯繫。"
    let headerImageName = "detailImage3"
    
    let tableViewSectionText = ["全台地區   ", "北部地區 ＋", "中部地區 ＋", "南部地區 ＋", "東部地區 ＋", "離島地區 ＋"]
    let tableViewSectionUnselectedText = ["全台地區   ", "北部地區 −", "中部地區 −", "南部地區 −", "東部地區 −", "離島地區 −"]
    let tableViewRowText = [[],
                            ["基隆", "台北", "桃園", "新竹", "苗栗"],
                            ["南投", "台中", "彰化", "雲林"],
                            ["嘉義", "台南", "高雄", "屏東"],
                            ["宜蘭", "花蓮", "台東"],
                            ["澎湖", "金門", "馬祖"]]
    
    @IBOutlet var naviShadowView: UIView!
    @IBOutlet var gradientView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableViewBottom: NSLayoutConstraint!
    
    var selectTableIsHidden = true
    var isExpendDataList: [Bool] = [false, false, false, false, false, false]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let image = UIImage()
        self.navigationController?.navigationBar.shadowImage = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let titleView = self.navigationItem.titleView as! NaviTitleView
        titleView.naviTitleBtn.addTarget(self, action: #selector(onTitleBtnClick(_:)), for: .touchUpInside)
        titleView.naviTitleImageBtn.addTarget(self, action: #selector(onTitleBtnClick(_:)), for: .touchUpInside)
        
        tableView.register(UINib(nibName: "HomeTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "HomeTableViewHeader")
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        
        collectionView.register(UINib(nibName: "HomeCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeCollectionReusableView")
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        tableView.contentInset = UIEdgeInsets(top: 80 * screen.height / 736, left: 0, bottom: 0, right: 0)
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        selectTableIsHidden = true
        tableViewisHidden(isHidden: true, animated: false)
    }
    
    func setUI() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.set(red: 240, green: 240, blue: 240).cgColor]
        gradientView.layer.addSublayer(gradientLayer)
        naviShadowView.layer.applySketchShadow(color: .black, alpha: 0.07, x: 0, y: 2, blur: 2.7, spread: 0)
    }
    
    @objc func onTitleBtnClick(_ sender: UIButton) {
        selectTableIsHidden = !selectTableIsHidden
        tableViewisHidden(isHidden: selectTableIsHidden, animated: true)
    }
    
    func tableViewisHidden(isHidden: Bool, animated: Bool) {
        let titleView = self.navigationItem.titleView as! NaviTitleView
        tableViewBottom.constant = selectTableIsHidden ? 0 : tableView.frame.height
        
        switch animated {
        case true:
            UIView.animate(withDuration: 0.4) {
                titleView.naviTitleImageBtn.transform = self.selectTableIsHidden ? CGAffineTransform(rotationAngle: CGFloat.pi / 180) : CGAffineTransform(rotationAngle: CGFloat.pi)
                self.view.layoutIfNeeded()
            }
        case false:
            titleView.naviTitleImageBtn.transform = self.selectTableIsHidden ? CGAffineTransform(rotationAngle: CGFloat.pi / 180) : CGAffineTransform(rotationAngle: CGFloat.pi)
        }
    }
    
    @objc func onIconBtnClick() {
        //        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabbarVC") as! MyTabBarController
        //        vc.modalPresentationStyle = .fullScreen
        //        vc.modalTransitionStyle = .flipHorizontal
        //        vc.selectedIndex = 4
        let setVC = self.storyboard?.instantiateViewController(withIdentifier: "MemberSettingVC") as! MemberSettingVC
        setVC.modalPresentationStyle = .fullScreen
        setVC.modalTransitionStyle = .flipHorizontal
        setVC.returnBtnIsHidden = false
        present(setVC, animated: true, completion: nil)
    }
}

extension ActivityVC: CollectionViewCellDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionViewCellDidTap(_ sender: HomeCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: sender) else { return }
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
            detailVC.heroID = "group14"
        } else {
            detailVC.logoImageName = headPhotos[indexPath.row]
            detailVC.heroID = cellHeroID[indexPath.row]
            //            detailVC.heroID2 = cellHeroID2[indexPath.row]
        }
        
        if let cell = collectionView.cellForItem(at: indexPath) as? HomeCollectionViewCell {
            UIView.animate(withDuration: 0.2,
                           animations: {
                            if indexPath.section == 0 {
                                cell.blurEffect.transform = CGAffineTransform(translationX: 0, y: cell.blurEffect.frame.height)
                            }
                            cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                            
            }) { _ in
                self.present(detailVC, animated: true) {
                    cell.blurEffect.transform = CGAffineTransform(translationX: 0, y: 0)
                    cell.transform = CGAffineTransform(scaleX: 1, y: 1)
                    
                }
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeCollectionReusableView", for: indexPath) as! HomeCollectionReusableView
        header.headerView.titleLabel.attributedText = .setTitleAttriStr(string: "今日聚會情報")
        header.headerView.largeTitleLabel.attributedText = .setLargeTitleAttriStr(string: "聚會媒合")
        header.headerView.iconBtn.addTarget(self, action: #selector(onIconBtnClick), for: .touchUpInside)
        return header
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
            cell.contentView.heroID = "group14"
            cell.contentView.hero.modifiers = [.fade]
        } else {
            cell.subImageView.backgroundColor = .white
            cell.subImageView.nameLabel.attributedText = .setDetailCellNameAttriStr(string: names[indexPath.row])
            cell.subImageView.subNameLabel.attributedText = .setDetailCellSubNameAttriStr(string: subNames[indexPath.row])
            cell.subImageView.imageView.image = UIImage(named: headPhotos[indexPath.row])
            cell.subImageView.memoBtn.setAttributedTitle(.setCenterAttributedString(string: "參加", wordSpace: 3.75, textColor: .setMyLightMustard()), for: .normal)
            //            cell.heroID = cellHeroID[indexPath.row]
            //            cell.subImageView.imageView.heroID = cellHeroID2[indexPath.row]
            cell.contentView.heroID = cellHeroID[indexPath.row]
            cell.contentView.hero.modifiers = [.fade]
        }
        cell.delegate = self
        return cell
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
            detailVC.heroID = "group14"
        } else {
            detailVC.logoImageName = headPhotos[indexPath.row]
            detailVC.heroID = cellHeroID[indexPath.row]
            //            detailVC.heroID2 = cellHeroID2[indexPath.row]
        }
        
        if let cell = collectionView.cellForItem(at: indexPath) as? HomeCollectionViewCell {
            UIView.animate(withDuration: 0.2,
                           animations: {
                            if indexPath.section == 0 {
                                cell.blurEffect.transform = CGAffineTransform(translationX: 0, y: cell.blurEffect.frame.height)
                            }
                            cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                            
            }) { _ in
                self.present(detailVC, animated: true) {
                    cell.blurEffect.transform = CGAffineTransform(translationX: 0, y: 0)
                    cell.transform = CGAffineTransform(scaleX: 1, y: 1)
                    
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        if let cell = collectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.2) {
                cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
        }
        
        return true
    }
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.2) {
                cell.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }
}

extension ActivityVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: screen.width,
                          height: 85)
        } else {
            return CGSize(width: 0,
                          height: 0)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: 374 * screen.width / 414,
                          height: 360 * screen.height / 736)
        } else {
            return CGSize(width: 374 * screen.width / 414,
                          height: 94)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10 * screen.height / 736,
                            left: 20 * screen.width / 414,
                            bottom: 10 * screen.height / 736,
                            right: 20 * screen.width / 414)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20 * screen.height / 736
    }
}

extension ActivityVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewSectionText.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 查看該section, 若isExpend為false, row數量則為0
        if self.isExpendDataList[section] {
            return self.tableViewRowText[section].count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let attrbutedStr = NSMutableAttributedString(string: isExpendDataList[section] ? tableViewSectionUnselectedText[section] : tableViewSectionText[section])
        attrbutedStr.addAttribute(.kern,
                                  value: 3.67,
                                  range: NSRange(location: 0, length: attrbutedStr.length))
        attrbutedStr.addAttribute(.foregroundColor,
                                  value: UIColor.setMyLightMustard(),
                                  range: NSRange(location: 5, length: 1))
        
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeTableViewHeader") as! HomeTableViewHeader
        header.localClassBtn.setAttributedTitle(attrbutedStr, for: .normal)
        header.isExpand = self.isExpendDataList[section]
        header.buttonTag = section
        header.delegate = self
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.localLabel.attributedText = .setKernAttriStr(string: tableViewRowText[indexPath.section][indexPath.row], kern: 3.24)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 57 * screen.height / 736
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43 * screen.height / 736
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let titleView = self.navigationItem.titleView as! NaviTitleView
        titleView.naviTitleBtn.setAttributedTitle(.setKernAttriStr(string: tableViewRowText[indexPath.section][indexPath.row] + "需求", kern: 5), for: .normal)
        
        selectTableIsHidden = !selectTableIsHidden
        tableViewisHidden(isHidden: selectTableIsHidden, animated: true)
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let cell = tableView.cellForRow(at: indexPath) as! HomeTableViewCell
        cell.localLabel.textColor = .setMyLightMustard()
        return true
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! HomeTableViewCell
        cell.localLabel.textColor = .black
    }
    
    
}

extension ActivityVC: SectionViewDelegate {
    func sectionView(_ sectionView: HomeTableViewHeader, _ didPressTag: Int, _ isExpand: Bool) {
        let titleView = self.navigationItem.titleView as! NaviTitleView
        
        if didPressTag == 0 {
            selectTableIsHidden = !selectTableIsHidden
            tableViewisHidden(isHidden: selectTableIsHidden, animated: true)
            titleView.naviTitleBtn.setAttributedTitle(.setNaviTitleAttriStr(string: "全台需求"), for: .normal)
        }
        
        
        
        
        self.isExpendDataList[didPressTag] = !isExpand
        
        if self.isExpendDataList[didPressTag] {
            UIView.animate(withDuration: 0.3) {
                self.tableView.contentInset = UIEdgeInsets(top: 0 * screen.height / 736, left: 0, bottom: 0, right: 0)
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.tableView.contentInset = UIEdgeInsets(top: 80 * screen.height / 736, left: 0, bottom: 0, right: 0)
            }
        }
        self.tableView.reloadSections(IndexSet(integer: didPressTag), with: .automatic)
    }
    
    
}
