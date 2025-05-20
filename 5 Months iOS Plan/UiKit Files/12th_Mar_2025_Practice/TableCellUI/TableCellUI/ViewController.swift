//
//  ViewController.swift
//  TableCellUI
//
//  Created by Mddaniyal on 3/12/25.
//

import UIKit

struct DataStorage {
    
    var img: String
    var title: String
    var btnText: String
    var age: String
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CustomCellDelegate {

    @IBOutlet weak var profileIMg: UIImageView!
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var lbl: UILabel!
    
    var selectedIdx: IndexPath?
    
    var data: [DataStorage] = [
        DataStorage(img: "person.2.fill", title: "My Patients", btnText: "10 Actually", age: "12"),
        DataStorage(img: "person.2.fill", title: "Rooms", btnText: "10 Available", age: "22"),
        DataStorage(img: "person.2.fill", title: "Medicines", btnText: "10 Available", age: "23"),
        DataStorage(img: "person.2.fill", title: "My Patients", btnText: "10 Actually", age: "12"),
        DataStorage(img: "person.2.fill", title: "Rooms", btnText: "10 Available", age: "22"),
        DataStorage(img: "person.2.fill", title: "Medicines", btnText: "10 Available", age: "23"),
        DataStorage(img: "person.2.fill", title: "My Patients", btnText: "10 Actually", age: "12"),
        DataStorage(img: "person.2.fill", title: "Rooms", btnText: "10 Available", age: "22"),
        DataStorage(img: "person.2.fill", title: "Medicines", btnText: "10 Available", age: "23")
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        
        profileIMg.layer.cornerRadius = profileIMg.frame.height / 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row1 = data[indexPath.row]
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell
        
        cell?.myImg.image = UIImage(systemName: row1.img)
        cell?.title.text = row1.title
        cell?.button.setTitle(row1.btnText, for: .normal)
        cell?.ageLbl.text = row1.age
        cell?.delegate = self
        cell?.ageLbl.isHidden = true
        
        if selectedIdx == indexPath {
            cell?.rowView.layer.borderWidth = 3
            cell?.rowView.layer.borderColor = UIColor.red.cgColor
            cell?.rowView.layer.cornerRadius = 10
        } else {
            cell?.rowView.layer.borderWidth = 0
        }
        
        return cell ?? UITableViewCell(frame: .zero )
    }


    func didTapButton(cell: CustomCell) {
        
        print("here")
        if let idxPath = myTable.indexPath(for: cell) {
            lbl.text = data[idxPath.row].title
            selectedIdx = idxPath
            myTable.reloadData()
        }
    }
    
    @IBAction func addNewRowBtn(_ sender: Any) {
        
        let formAlert = UIAlertController(title: "Add new Details", message: "Fill the below details", preferredStyle: .alert)
        
        formAlert.addTextField {
            textField in
            textField.placeholder = "Enter title"
        }
        formAlert.addTextField {
            textField in
            textField.placeholder = "Enter btn text"
        }
        formAlert.addTextField {
            textField in
            textField.placeholder = "Enter agw"
        }
        
        let no = UIAlertAction(title: "No", style: .destructive)
        
        let add = UIAlertAction(title: "Add", style: .default) {
            _ in
            let titleText = formAlert.textFields?[0].text ?? ""
            let btnText = formAlert.textFields?[1].text ?? ""
            let ageText = formAlert.textFields?[2].text ?? ""
        
            if !titleText.isEmpty && !btnText.isEmpty {
                
                self.data.append(DataStorage(img: "person.2.fill", title: titleText, btnText: btnText, age: ageText))
                self.myTable.reloadData()
            }
        }
        
        formAlert.addAction(no)
        formAlert.addAction(add)
        
        
        present(formAlert, animated: true)
        
        
//        self.data.append(DataStorage(img: "daniyal", title: "Daniyal", btnText: "daniyal"))
//        let newIdx = IndexPath(row: data.count - 1, section: 0)
//        myTable.insertRows(at: [newIdx], with: .automatic)
//        myTable.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Dekeetee") { _, _, completionHandler in
            self.data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

