//
//  UserModel.swift
//  Healios
//
//  Created by Zohrab Keshishyan on 25.08.21.
//

import Foundation
import UIKit
import Realm
import RealmSwift

class UserModel: Object {
    
    @objc dynamic var id : Int = -1

    @objc dynamic var name: String = ""
    @objc dynamic var username: String = ""
    @objc dynamic var email: String?

    @objc dynamic var phone: String?
    @objc dynamic var website: String?

    @objc dynamic var address: AddressModel?
    @objc dynamic var company: CompanyModel?

    override static func primaryKey() -> String? {
        return "id"
    }
}

class AddressModel: Object {
    
    @objc dynamic var zipcode : String = ""
    @objc dynamic var street: String = ""
    @objc dynamic var suite: String = ""
    @objc dynamic var city: String?
    @objc dynamic var lat: String?
    @objc dynamic var lng: String?

    override static func primaryKey() -> String? {
        return "zipcode"
    }
}
