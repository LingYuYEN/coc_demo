//
//  TalentMatchingVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/13.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class TalentMatchingVC: UIViewController {
    
    @IBOutlet var naviShadowView: UIView!
    @IBOutlet var gradientView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewBottom: NSLayoutConstraint!
    
    
    let names = ["蕭惠娟", "蕭能維", "蕭援文", "蕭博文", "蕭雅婷",
                 "蕭惠娟", "蕭能維", "蕭援文", "蕭博文", "蕭雅婷",
                 "蕭惠娟", "蕭能維", "蕭援文", "蕭博文", "蕭雅婷",
                 "蕭惠娟", "蕭能維", "蕭援文", "蕭博文", "蕭雅婷",
                 "蕭惠娟", "蕭能維", "蕭援文", "蕭博文", "蕭雅婷",
                 "蕭惠娟", "蕭能維", "蕭援文", "蕭博文", "蕭雅婷"]
    let subNames = ["寶銳綠植", "律師", "104 房仲", "每得科技", "財務會計",
                    "寶銳綠植", "律師", "104 房仲", "每得科技", "財務會計",
                    "寶銳綠植", "律師", "104 房仲", "每得科技", "財務會計",
                    "寶銳綠植", "律師", "104 房仲", "每得科技", "財務會計",
                    "寶銳綠植", "律師", "104 房仲", "每得科技", "財務會計",
                    "寶銳綠植", "律師", "104 房仲", "每得科技", "財務會計"]
    let headPhotos = ["headPhoto1","headPhoto2","headPhoto3","headPhoto4","headPhoto5",
                      "headPhoto1","headPhoto2","headPhoto3","headPhoto4","headPhoto5",
                      "headPhoto1","headPhoto2","headPhoto3","headPhoto4","headPhoto5",
                      "headPhoto1","headPhoto2","headPhoto3","headPhoto4","headPhoto5",
                      "headPhoto1","headPhoto2","headPhoto3","headPhoto4","headPhoto5",
                      "headPhoto1","headPhoto2","headPhoto3","headPhoto4","headPhoto5"]
    
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
    
    let bodyText = "經歷\n\n2019 - 現職\n康闓科技股份有限公司 執行⻑\n\n2012 - 2018\n派趣行動整合科技股份有限公司 執行創意總監\n\n2015 - 2017\n兼任裕峯交通行控服務平台 首席設計⻑\n\n2009 - 2012\n秀設計工作室 視覺總監\n\n\n資歷\n\n高雄蕭氏宗親會 常務理事\n企業營運管理會 指定榮譽投資⻑\n南榮中正管委會 監事\n中國天文地理易經學會 常務理監事\n南臺科技大學 研發計劃主持\n嘉南科技大學 指定美學領域授課專家\n國家型研發計劃 指定推薦廠商代表\n地方型研發計劃 指定推薦廠商代表\n榮獲中央青年署新創計劃 創新服務冠軍\n多項國家認證產品與服務\n榮獲創新獎與創意獎"
    
    let tableViewSectionText = ["全台地區   ", "北部地區 ＋", "中部地區 ＋", "南部地區 ＋", "東部地區 ＋", "離島地區 ＋"]
    let tableViewSectionUnselectedText = ["全台地區   ", "北部地區 −", "中部地區 −", "南部地區 −", "東部地區 −", "離島地區 −"]
    let tableViewRowText = [[],
                            ["基隆", "台北", "桃園", "新竹", "苗栗"],
                            ["南投", "台中", "彰化", "雲林"],
                            ["嘉義", "台南", "高雄", "屏東"],
                            ["宜蘭", "花蓮", "台東"],
                            ["澎湖", "金門", "馬祖"]]
    
    var selectTableIsHidden = true
    var isExpendDataList: [Bool] = [false, false, false, false, false, false]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let image = UIImage()
        self.navigationController?.navigationBar.shadowImage = image
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBarController?.delegate = self
        
        
        let titleView = self.navigationItem.titleView as! NaviTitleView
        titleView.naviTitleBtn.addTarget(self, action: #selector(onTitleBtnClick(_:)), for: .touchUpInside)
        titleView.naviTitleImageBtn.addTarget(self, action: #selector(onTitleBtnClick(_:)), for: .touchUpInside)
        
        tableView.register(UINib(nibName: "HomeTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "HomeTableViewHeader")
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")

        collectionView.register(UINib(nibName: "HomeCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeCollectionReusableView")
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        self.tableView.contentInset = UIEdgeInsets(top: 80 * screen.height / 736, left: 0, bottom: 0, right: 0)
        
        
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

extension TalentMatchingVC: CollectionViewCellDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionViewCellDidTap(_ sender: HomeCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: sender) else { return }
         let detailVC = DetailVC(nibName: "DetailVC", bundle: nil)
                detailVC.modalPresentationStyle = .fullScreen
                detailVC.detailImageName = headPhotos[indexPath.row]
                detailVC.topName = names[indexPath.row]
                detailVC.topSubName = subNames[indexPath.row]
                detailVC.bodyText = bodyText
                detailVC.subImageName = "detailSubImage2"
                detailVC.logoImageName = headPhotos[indexPath.row]
                detailVC.bottomBtnBackgroundColor = UIColor.set(red: 14, green: 5, blue: 55)
                detailVC.bottomBtnTextColor = UIColor.white
                detailVC.logoIsCornerRadius = true
                
                detailVC.heroID = cellHeroID[indexPath.row]
        //        detailVC.heroID2 = cellHeroID2[indexPath.row]
                
                if let cell = collectionView.cellForItem(at: indexPath) {
                    UIView.animate(withDuration: 0.2,
                                   animations: {
                                    cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                    }) { _ in
                        self.present(detailVC, animated: true) {
                            cell.transform = CGAffineTransform(scaleX: 1, y: 1)
                        }
                    }
                }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailVC(nibName: "DetailVC", bundle: nil)
        detailVC.modalPresentationStyle = .fullScreen
        detailVC.detailImageName = headPhotos[indexPath.row]
        detailVC.topName = names[indexPath.row]
        detailVC.topSubName = subNames[indexPath.row]
        detailVC.bodyText = bodyText
        detailVC.subImageName = "detailSubImage2"
        detailVC.logoImageName = headPhotos[indexPath.row]
        detailVC.bottomBtnBackgroundColor = UIColor.set(red: 14, green: 5, blue: 55)
        detailVC.bottomBtnTextColor = UIColor.white
        detailVC.logoIsCornerRadius = true
        
        detailVC.heroID = cellHeroID[indexPath.row]
//        detailVC.heroID2 = cellHeroID2[indexPath.row]
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.2,
                           animations: {
                            cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }) { _ in
                self.present(detailVC, animated: true) {
                    cell.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeCollectionReusableView", for: indexPath) as! HomeCollectionReusableView
        header.headerView.titleLabel.attributedText = .setTitleAttriStr(string: "今日人力情報")
        header.headerView.largeTitleLabel.attributedText = .setLargeTitleAttriStr(string: "人才媒合")
        header.headerView.iconBtn.addTarget(self, action: #selector(onIconBtnClick), for: .touchUpInside)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.subImageView.backgroundColor = .white
        cell.subImageView.nameLabel.attributedText = .setDetailCellNameAttriStr(string: names[indexPath.row])
        cell.subImageView.subNameLabel.attributedText = .setDetailCellSubNameAttriStr(string: subNames[indexPath.row])
        cell.subImageView.imageView.image = UIImage(named: headPhotos[indexPath.row])
//        cell.subImageView.imageView.heroID = cellHeroID2[indexPath.row]
//        cell.heroID = cellHeroID2[indexPath.row]
        cell.delegate = self
        
        cell.contentView.heroID = cellHeroID[indexPath.row]
        cell.contentView.hero.modifiers = [.fade]
        
        return cell
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

extension TalentMatchingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: screen.width, height: 85)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 374 * screen.width / 414, height: 94)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 6 * screen.height / 736,
                            left: 20 * screen.width / 414,
                            bottom: 10 * screen.height / 736,
                            right: 20 * screen.width / 414)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20 * screen.height / 736
    }
}

extension TalentMatchingVC: UITableViewDataSource, UITableViewDelegate {
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
        cell.localLabel.attributedText = .setAttributedString(string: tableViewRowText[indexPath.section][indexPath.row], wordSpace: 3.24, textColor: .black)
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

extension TalentMatchingVC: SectionViewDelegate {
    func sectionView(_ sectionView: HomeTableViewHeader, _ didPressTag: Int, _ isExpand: Bool) {
        if didPressTag == 0 {
            selectTableIsHidden = !selectTableIsHidden
            tableViewisHidden(isHidden: selectTableIsHidden, animated: true)
            let titleView = self.navigationItem.titleView as! NaviTitleView
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
