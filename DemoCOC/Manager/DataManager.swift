//
//  DataManager.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/3/3.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit

class DataManager {
    private static let instance = DataManager()
    static var shared: DataManager {
        return self.instance
    }
    
    // 取得驗證碼
    func getSMSCode(phoneNumber: String, smsBody: String, _ completion: @escaping () -> Void) {
        defer {
            DispatchQueue.main.async {
                completion()
            }
        }
        
        let urlStr = "https://smsapi.mitake.com.tw:443/api/mtk/SmSend?username=50940464&password=285582&dstaddr=\(phoneNumber)&smbody=\(smsBody)&CharsetURL=UTF-8"
        let header = ["Content-Type" : "charset=utf-8"]
        
        // 若url內容包含中文字，請以下列進行編碼
        guard let newUrl = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: newUrl) else { return }
        
        ClientManager.shared.getJsonData(method: .post, url: url, parameters: header) { data in
            guard let data = data else { return }
            guard let dataStr = String(data: data, encoding: .utf8) else { return }
            print(dataStr)
        }
    }
    
    
    
}
