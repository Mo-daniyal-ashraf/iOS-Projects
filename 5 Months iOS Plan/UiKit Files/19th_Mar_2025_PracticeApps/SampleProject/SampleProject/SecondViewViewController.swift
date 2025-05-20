//
//  SecondViewViewController.swift
//  SampleProject
//
//  Created by Mddaniyal on 3/18/25.
//

import UIKit

struct Notification {
    
    var title: String
    var time: String
}

class SecondViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let dataSource = ["All", "Image", "Photo", "Commeent", "Share", "Mention", "Fevorites", "Image", "Photo", "All", "Image", "Photo", "All", "Image", "Photo", "All", "Image", "Photo"]
    
    let notificationDataSource = [
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
        Notification(title: "This is first notification", time: "12:00 AM Sunday"),
    ]
    
    @IBOutlet weak var myColletionView: UICollectionView!
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        myColletionView.dataSource = self
        myColletionView.delegate = self
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        let nib1 = UINib.init(nibName: "NotificationTypeCollectionViewCell", bundle: nil)
        myColletionView.register(nib1, forCellWithReuseIdentifier: "NotificationTypeCollectionViewCell")
        
        let nib2 = UINib.init(nibName: "NotificationTableViewCell", bundle: nil)
        myTableView.register(nib2, forCellReuseIdentifier: "NotificationTableViewCell")
        
        print("Hi")
    }
}

extension SecondViewViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = myColletionView.dequeueReusableCell(withReuseIdentifier: "NotificationTypeCollectionViewCell", for: indexPath) as? NotificationTypeCollectionViewCell
        
        cell?.lbl.text = dataSource[indexPath.row]
        
        return cell!
    }
    
}

extension SecondViewViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notificationDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as? NotificationTableViewCell
        
        cell?.title.text = notificationDataSource[indexPath.row].title
        cell?.time.text = notificationDataSource[indexPath.row].time
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
}
