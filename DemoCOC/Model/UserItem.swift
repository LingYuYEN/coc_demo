//
//  UserItem.swift
//  DemoCOC
//
//  Created by 顏淩育 on 2020/3/6.
//  Copyright © 2020 顏淩育. All rights reserved.
//

import UIKit
import Firebase

class UserItem {

    var phone: String
    var createDate: String
    var DEVICE_UUID: String?
    
    init(snapshot: DataSnapshot) {
//        print(snapshot)
        // 取出snapshot的值(JSON)
        
        let snapshotValue: [String: AnyObject] = snapshot.value as! [String: AnyObject]

        self.phone = snapshotValue["phone"] as! String
        self.createDate = snapshotValue["createDate"] as! String
        self.DEVICE_UUID = snapshotValue["DEVICE_UUID"] as? String
    }

}
