//
//  RealmHelper.swift
//  WhatsApp_Clone
//
//  Created by Mddaniyal on 5/26/25.
//

import Foundation
import RealmSwift


class RealmHelper {
    
    static var shared = {
        
        do {
            
            let realm = try Realm()
            return realm
        } catch let error {
            
            print("Error in realm creation: \(error.localizedDescription)")
            return try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "TemporaryRealm"))
        }
    }()
    
    static func getAllData<T: Object>(ofType type: T.Type) -> Results<T> {
        
        return shared.objects(type)
    }
    
    static func getCurrentUserId() -> String {
        
        if let userId = UserDefaults.standard.string(forKey: "currentUserId") {
            return userId
        }
        return "Current user id not found!"
    }
    
    
    static func getUserbyId(id: String) -> User? {
        
        if let user = shared.object(ofType: User.self, forPrimaryKey: id) {
            return user
        }
        return nil
    }
}
