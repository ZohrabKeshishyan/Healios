//
//  PostModel.swift
//  Healios
//
//  Created by Zohrab Keshishyan on 25.08.21.
//
 
import Foundation
import UIKit
import Realm
import RealmSwift  

class PostModel: Object {
    
    @objc dynamic var id : Int = -1
    @objc dynamic var userId : Int = -1

    @objc dynamic var title: String?
    @objc dynamic var body: String?


    override static func primaryKey() -> String? {
        return "id"
    }
}
