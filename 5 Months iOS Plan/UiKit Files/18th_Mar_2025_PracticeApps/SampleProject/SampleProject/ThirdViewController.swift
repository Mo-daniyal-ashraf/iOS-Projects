//
//  ThirdViewController.swift
//  SampleProject
//
//  Created by Mddaniyal on 3/18/25.
//

import UIKit

struct settings {
    
    var settingIcon: String
    var settingName: String
}

class ThirdViewController: UIViewController {

    let dataSource = [
        settings(settingIcon: "person.fill", settingName: "Following"),
        settings(settingIcon: "person.fill", settingName: "Notification"),
        settings(settingIcon: "person.fill", settingName: "Share"),
        settings(settingIcon: "person.fill", settingName: "Account details"),
        settings(settingIcon: "person.fill", settingName: "Switch account"),
        settings(settingIcon: "person.fill", settingName: "Unsend information status"),
        settings(settingIcon: "person.fill", settingName: "Feedback and Support"),
    ]
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.register(UINib.init(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
        
        myTableView.register(UINib.init(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
    }
}



extension ThirdViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return  dataSource.count
        } else {
            
            return 3
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let row = dataSource[indexPath.row]
            
            let cell = myTableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as? SettingsTableViewCell
            
            cell?.settingTypeIcon.image = UIImage(systemName: row.settingIcon)
            cell?.settingName.text = row.settingName
            
            return cell!
            
        } else {
            
            let row = dataSource[indexPath.row]
            
            let cell = myTableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as? SettingsTableViewCell
            
            cell?.settingName.text = row.settingName
            cell?.setUpSecondSection()
            
            if indexPath.row == 2 {
                cell?.settingName.textColor = .red
            }
            return cell!
        }
    }
    
    func createHeaderView(for tableView: UITableView, section: Int) -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        footerView.backgroundColor = UIColor.lightGray

        let label = UILabel(frame:  CGRect(x: 15, y: 0, width: 100, height: 40))
        label.text = section == 0 ? "Settings" : "Application"
        label.textColor = UIColor.black

        footerView.addSubview(label)
    
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return createHeaderView(for: tableView, section: section)
    }
    
}
