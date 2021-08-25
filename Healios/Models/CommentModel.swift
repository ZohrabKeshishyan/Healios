//
//  CommentModel.swift
//  Healios
//
//  Created by Zohrab Keshishyan on 25.08.21.
//

import Foundation
import UIKit
import Realm
import RealmSwift

class CommentModel: Object {
    
    @objc dynamic var id : Int = -1
    @objc dynamic var postId : Int = -1

    @objc dynamic var name: String?
    @objc dynamic var body: String?
    @objc dynamic var email: String?


    override static func primaryKey() -> String? {
        return "id"
    }
}
 
