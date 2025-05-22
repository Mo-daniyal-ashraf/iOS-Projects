//
//  ViewController.swift
//  Realm
//
//  Created by Mddaniyal on 5/21/25.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        let realm = Realm()
        
//        let user1 = User()
//
//        let realm = try! Realm()
//
//        try! realm.write {
//
//            realm.add(user1)
//        }
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let newUser = User(context: context)
        newUser.name = "Sk"
        newUser.age = 25

        do {
            try context.save()
            print("User saved!")
        } catch {
            print("Failed saving")
        }

    }
}

