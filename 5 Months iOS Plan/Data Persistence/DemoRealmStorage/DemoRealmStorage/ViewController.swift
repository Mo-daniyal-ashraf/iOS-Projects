import UIKit
import RealmSwift

class Person: Object {
    
    @Persisted var name: String
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // ✅ Configure Realm BEFORE any access
//        let config = Realm.Configuration(
//            schemaVersion: 2, // Bump version here
//            migrationBlock: { migration, oldSchemaVersion in
//                if oldSchemaVersion < 2 {
//                    // Set default value for the new property
//                    migration.enumerateObjects(ofType: User.className()) { oldObject, newObject in
//                        newObject?["age"] = 0
//                    }
//                }
//            }
//        )
//
//        Realm.Configuration.defaultConfiguration = config


    }

    @IBAction func addUser(_ sender: UIButton) {
        
        let p1 = Person(name: "sk")

        do {
            let realm = try Realm()
            try realm.write {
                realm.add(p1)
            }
            
            print(realm.configuration.fileURL!.path)
        } catch let error {
            print("Add user error: \(error.localizedDescription)")
        }
    }
}
