//
//  DataBase.swift
//  Motivity
//
//  Created by Zohrab on 7/31/19.
//  Copyright © 2019 Zohrab. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class RealmDataBase {
    
    static let shered = RealmDataBase()
    
    func saveObject<T: Object>(_ object: T) { 
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(object)
            }
            
        }catch{
            print("Error to save object")
        }
    }
    
    func save<T: Object>(_ type: T.Type,_ dictList:[[String:Any]],isRemove:Bool = false, completion: ((_ list:[T]? )->Void)!) {
        if dictList.isEmpty {
            if isRemove {
            self.removeAllObjectsAt(type)
            }
        }
        var result:[T] = []
        
        do {
            let realm = try Realm()
            try realm.write {
                
                dictList.forEach { (dict) in 
                    let object = realm.create(T.self, value: dict, update: .modified)
                    result.append(object)
                }
                DispatchQueue.main.async {
                    let allObjects = self.fetchAllObjectsAt(type)
                    let removedObjectsArray = allObjects.filter{ !result.contains($0) }
                    if isRemove {
                    self.removeObjectsAt(removedObjectsArray)
                    }
                completion(result)
                }
            }
        }catch{
            print(error.localizedDescription)
            completion(nil)
        }
    }
    
    func save<T: Object>(_ type: T.Type,_ dict:[String:Any], completion: ((_ list:T? )->Void)!) {
        do {
            let realm = try Realm()
            
            try realm.write {
                let object = realm.create(T.self, value: dict, update: .modified)
                DispatchQueue.main.async {
                    completion(object)
                }
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func fetchAllObjectsAt<T: Object>(_ type:T.Type) ->[T] {
        var result:[T] = []
        do {
            let realm = try Realm()
            let objects = realm.objects(T.self)
            objects.forEach { (obj) in
                result.append(obj)
            }
            return result
            
        }catch{
            print(error.localizedDescription)
            return result
        }
    }
    
    func removeAllObjectsAt<T: Object>(_ type:T.Type) {
            do {
                let realm = try Realm()
                let result = realm.objects(T.self)
                try realm.write {
                    realm.delete(result)
                }
            }catch{
                print(error.localizedDescription)
                
            }
    }
    
    func removeObjectsAt<T: Object>(_ objects:[T]) {
        do {
            let realm = try Realm()
            
            try realm.write {
                realm.delete(objects)
            }
        }catch{
            print(error.localizedDescription)
            
        }
    }
  
}
