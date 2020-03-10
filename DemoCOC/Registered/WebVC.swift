//
//  WebVC.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/3/5.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {

    @IBOutlet var webView: WKWebView!
    @IBOutlet var shadowView: UIView!
    @IBOutlet var closeBtn: MyButton!
    
    let urlStr = "https://conquers.co"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shadowView.layer.applySketchShadow(color: .white, alpha: 0.8, x: 0, y: 0, blur: 8, spread: 0)
        shadowView.layer.cornerRadius = shadowView.frame.height / 2
        closeBtn.layer.cornerRadius = closeBtn.frame.height / 2
        
        
        
        
        if let url = URL(string: urlStr) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        // Do any additional setup after loading the view.
    }


    @IBAction func onCloseBtnClick(_ sender: MyButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
