//
//  UserModel.swift
//  DemoRealmStorage
//
//  Created by Mddaniyal on 5/21/25.
//

import Foundation
import RealmSwift

class User: Object {

    @Persisted var name: String
    @Persisted var id: Int
    @Persisted var age: Int
    
    convenience init(name: String, id: Int) {
        self.init()
        self.name = name
        self.id = id
    }
    
    func printDetails() {
        
        print("""
             name : \(self.name)
             id : \(self.id)
             """)
    }
}


