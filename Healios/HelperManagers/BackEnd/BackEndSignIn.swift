//
//  BackEndSignIn.swift
//  qwangyApp
//
//  Created by Zohrab Keshishyan on 23.07.21.
//

import Foundation
import UIKit
import Alamofire

extension BackendRequest {
    
    func fetchPosts(success: @escaping (Bool) -> (), error: @escaping (String?, Int?) -> ()){
        
        let path = base_url + "/posts"
        
        guard let url = URL.init(string: path) else {
            success(false)
            return
        }
        
        requestWith(url: url, method: .get, params: nil, headers: nil, complatation: { responze  in
            if let dic = responze as? [[String: AnyObject]] {
                RealmDataBase.shered.save(PostModel.self, dic) { authModel in
                    success(true)
                }
            }
        })
    }
    
    func fetchUsers(complatation: @escaping ([UserModel]) -> (), error: @escaping (String?, Int?) -> ()){
        
        let path = base_url + "/users"
        
        guard let url = URL.init(string: path) else {
            complatation([UserModel]())
            return
        }
        
        requestWith(url: url, method: .get, params: nil, headers: nil, complatation: { responze  in
            if let dicList = responze as? [[String: AnyObject]] {
                var userDic: [[String: AnyObject]] = []
                dicList.forEach { dic in
                    if var address = dic["address"] as? [String: AnyObject],
                       let geo = address["geo"] as? [String: AnyObject] {
                        address["lat"] = geo["lat"]
                        address["lng"] = geo["lng"]
                        var newDic = dic
                        newDic["address"] = address as AnyObject
                        userDic.append(newDic)
                    }
                }
                RealmDataBase.shered.save(UserModel.self, userDic) { user in
                    complatation(user ?? [])
                }
            }
        })
    }
    
    func fetchComments(complatation: @escaping ([CommentModel]) -> (), error: @escaping (String?, Int?) -> ()){
        
        let path = base_url + "/comments"
        
        guard let url = URL.init(string: path) else {
            complatation([CommentModel]())
            return
        }
        
        requestWith(url: url, method: .get, params: nil, headers: nil, complatation: { responze  in
            if let dicList = responze as? [[String: AnyObject]] {
                RealmDataBase.shered.save(CommentModel.self, dicList) { comments in
                    complatation(comments ?? [])
                }
            }
        })
    }
}
