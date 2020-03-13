//
//  ViewController.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/2/13.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit
import Hero

class HomeVC: UIViewController {
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
    
    let bodyText = "本公司最早於日據時代由 蕭順正先生擔任醬油廠技術員，1945年台灣光復後於嘉義縣布袋鎮成立新來源醬園，以傳統家庭式生產醬料。1965年本公司董事長蕭戊堅先生成立新來源醬園有限公司，廠址設於高雄市四維一路144號，初期主要經營醬油及醬瓜等產品，為因應市場需求量增加，於1980年遷廠至高雄縣大發工業區大有二街29號，佔地近2000坪，並改制為新來源醬園股份有限公司，目前員工人數約50人。\n\n近年來積極轉型並委託食品專業顧問公司輔導，著重於人員培訓，品質管制，生產技術提昇，硬體設備擴充改善，並取得ISO 22000、HACCP驗證。\n\n行銷通路透過參加台北世貿國際食品展覽而更寬廣，目前合作的對象為國防部、知名超商、量販店、連鎖超市及團膳批發業者，並於2009年開始外銷美 國、南非，將來目標為行銷全世界。"
    
    let tableViewSectionText = ["全台地區   ", "北部地區 ＋", "中部地區 ＋", "南部地區 ＋", "東部地區 ＋", "離島地區 ＋"]
    let tableViewSectionUnselectedText = ["全台地區   ", "北部地區 −", "中部地區 −", "南部地區 −", "東部地區 −", "離島地區 −"]
    
    let tableViewRowText = [[], ["基隆", "台北", "桃園", "新竹", "苗栗"],
                            ["南投", "台中", "彰化", "雲林"],
                            ["嘉義", "台南", "高雄", "屏東"],
                            ["宜蘭", "花蓮", "台東"],
                            ["澎湖", "金門", "馬祖"]]
    
    var isExpendDataList: [Bool] = [false, false, false, false, false, false]
    

    @IBOutlet var contView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var newNaviBar: UIView!
    @IBOutlet var gradientView: UIView!
    
    @IBOutlet var tableViewBottom: NSLayoutConstraint!
    var selectTableIsHidden = true
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let image = UIImage()
        //        image.withTintColor(.black)
        // 透過一個初始化的image，覆蓋setBackgroundImage即可讓導覽列背景色變透明
//        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        // 而下方的分隔線，即為image的陰影，也是覆蓋掉即可
        self.navigationController?.navigationBar.shadowImage = image
        self.tabBarController?.tabBar.backgroundImage = image
        self.tabBarController?.tabBar.shadowImage = image
        
        self.tabBarController?.tabBar.layer.applySketchShadow(color: .black, alpha: 0.07, x: 0, y: -2, blur: 2.7, spread: 0)
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        UIView.animate(withDuration: 0.5) {
            self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        
        self.tabBarController?.delegate = self
        
        let titleView = self.navigationItem.titleView as! NaviTitleView
        
        titleView.naviTitleBtn.addTarget(self, action: #selector(onTitleBtnClick), for: .touchUpInside)
        titleView.naviTitleImageBtn.addTarget(self, action: #selector(onTitleBtnClick), for: .touchUpInside)
        
        tableView.register(UINib(nibName: "HomeTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "HomeTableViewHeader")
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionView.register(UINib(nibName: "HomeCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeCollectionReusableView")
        
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
        
        newNaviBar.layer.applySketchShadow(color: .black, alpha: 0.07, x: 0, y: 2, blur: 2.7, spread: 0)
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
    @IBAction func onLeftBtnItemClick(_ sender: UIBarButtonItem) {
//        var rootVC = self.presentingViewController
//        while let parent = rootVC?.presentingViewController {
//            rootVC = parent
//        }
//        // 釋放所有下級視圖
//        rootVC?.dismiss(animated: false, completion: nil)
        let vc = RegisteredVC(nibName: "RegisteredVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
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

extension HomeVC: CollectionViewCellDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionViewCellDidTap(_ sender: HomeCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: sender) else { return }
        
        let detailVC = DetailVC(nibName: "DetailVC", bundle: nil)
                detailVC.modalPresentationStyle = .overFullScreen
                
                if indexPath.section == 0 {
                    detailVC.topName = "主打熱門商品"
                    detailVC.topSubName = "創意傢飾股份有限公司"
                    detailVC.bodyText = bodyText
                    detailVC.logoImageName = "group6"
                    detailVC.subImageName = "detailSubImage"
                    detailVC.heroID = "group6"
                } else {
                    detailVC.topName = names[indexPath.row]
                    detailVC.topSubName = subNames[indexPath.row]
                    detailVC.bodyText = bodyText
                    detailVC.logoImageName = headPhotos[indexPath.row]
                    detailVC.subImageName = "detailSubImage"
                    detailVC.heroID = cellHeroID[indexPath.row]
        //            detailVC.heroID2 = cellHeroID2[indexPath.row]
                }
                
                
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
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeCollectionReusableView", for: indexPath) as! HomeCollectionReusableView
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
            cell.subImageView.nameLabel.attributedText = .setDetailCellNameAttriStr(string: "主打熱門商品")
            cell.subImageView.subNameLabel.attributedText = .setDetailCellSubNameAttriStr(string: "創意傢飾股份有限公司")
            cell.subImageView.imageView.image = UIImage(named: "group6")
//            cell.subImageView.memoBtn.setAttributedTitle(.setCenterAttributedString(string: "詳情", wordSpace: 3.75, textColor: .setMyLightMustard()), for: .normal)
            cell.contentView.heroID = "group6"
            cell.contentView.hero.modifiers = [.fade, .scale(1)]
            
        } else {
            cell.subImageView.backgroundColor = .white
            cell.subImageView.nameLabel.attributedText = .setDetailCellNameAttriStr(string: names[indexPath.row])
            cell.subImageView.subNameLabel.attributedText = .setDetailCellSubNameAttriStr(string: subNames[indexPath.row])
            cell.subImageView.imageView.image = UIImage(named: headPhotos[indexPath.row])
//            cell.heroID = cellHeroID[indexPath.row]
            cell.contentView.heroID = cellHeroID[indexPath.row]
//            cell.subImageView.memoBtn.setAttributedTitle(.setCenterAttributedString(string: "詳情", wordSpace: 3.75, textColor: .setMyLightMustard()), for: .normal)
//            cell.subImageView.imageView.heroID = cellHeroID2[indexPath.row]
            cell.contentView.hero.modifiers = [.fade, .scale(1)]
        }
        
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = DetailVC(nibName: "DetailVC", bundle: nil)
        detailVC.modalPresentationStyle = .overFullScreen
        
        if indexPath.section == 0 {
            detailVC.topName = "主打熱門商品"
            detailVC.topSubName = "創意傢飾股份有限公司"
            detailVC.bodyText = bodyText
            detailVC.logoImageName = "group6"
            detailVC.subImageName = "detailSubImage"
            detailVC.heroID = "group6"
        } else {
            detailVC.topName = names[indexPath.row]
            detailVC.topSubName = subNames[indexPath.row]
            detailVC.bodyText = bodyText
            detailVC.logoImageName = headPhotos[indexPath.row]
            detailVC.subImageName = "detailSubImage"
            detailVC.heroID = cellHeroID[indexPath.row]
//            detailVC.heroID2 = cellHeroID2[indexPath.row]
        }
        
        
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

extension HomeVC: UICollectionViewDelegateFlowLayout {
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
        return UIEdgeInsets(top: 6 * screen.height / 736,
                            left: 20 * screen.width / 414,
                            bottom: 10 * screen.height / 736,
                            right: 20 * screen.width / 414)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20 * screen.height / 736
    }
}

extension HomeVC: UITabBarControllerDelegate {
    // tabBar控制, 為了前往 RecommendDetailVC 後, 能返回到原先前往的tabBarVC（不show出不希望的RecommendVC）
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is RecommendVC {
            let storyboard = UIStoryboard(name: "RecommendDetail", bundle: nil)
            let recommendDetailVC = storyboard.instantiateViewController(withIdentifier: "RecommendPageVC")
            recommendDetailVC.modalPresentationStyle = .overFullScreen
            present(recommendDetailVC, animated: true, completion: nil)
            return false
        }
        return true
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
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
        titleView.naviTitleBtn.setAttributedTitle(.setNaviTitleAttriStr(string: tableViewRowText[indexPath.section][indexPath.row] + "需求"), for: .normal)
        
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

extension HomeVC: SectionViewDelegate {
    func sectionView(_ sectionView: HomeTableViewHeader, _ didPressTag: Int, _ isExpand: Bool) {
        if didPressTag == 0 {
            selectTableIsHidden = !selectTableIsHidden
            tableViewisHidden(isHidden: selectTableIsHidden, animated: true)
            let titleView = self.tabBarController?.navigationItem.titleView as! NaviTitleView
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
