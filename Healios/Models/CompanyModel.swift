//
//  CompanyModel.swift
//  Healios
//
//  Created by Zohrab Keshishyan on 25.08.21.
//

import Foundation
import UIKit
import Realm
import RealmSwift

class CompanyModel: Object {
     
    @objc dynamic var name: String = ""
    @objc dynamic var catchPhrase: String?
    @objc dynamic var bs: String?


    override static func primaryKey() -> String? {
        return "name"
    }
}
  
