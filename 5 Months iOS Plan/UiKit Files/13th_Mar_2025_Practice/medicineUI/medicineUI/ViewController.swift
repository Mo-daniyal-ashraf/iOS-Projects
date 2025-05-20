//
//  ViewController.swift
//  medicineUI
//
//  Created by Mddaniyal on 3/13/25.
//

import UIKit

struct Medicine {
    
    var img: String
    var name: String
    var numverOfPills: String
}

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var firstVuiew: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdVuiew: UIView!
    @IBOutlet weak var fourthVuiew: UIView!
    
    @IBOutlet weak var buttonVie: UIView!
    
    @IBOutlet weak var roomOuterView: UIView!
    
    @IBOutlet weak var roomInnerView: UIView!
    
    var dataSource: [Medicine] = [
        Medicine(img: "med1", name: "Ct-CDP", numverOfPills: "12 Pills"),
        Medicine(img: "med2", name: "Ct-CDP", numverOfPills: "12 Pills"),
        Medicine(img: "med1", name: "Ct-CDP", numverOfPills: "12 Pills"),
        Medicine(img: "med2", name: "Ct-CDP", numverOfPills: "12 Pills"),
        Medicine(img: "med2", name: "Ct-CDP", numverOfPills: "12 Pills"),
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
        firstVuiew.layer.cornerRadius = firstVuiew.frame.height / 2
        secondView.layer.cornerRadius = secondView.frame.height / 2
        thirdVuiew.layer.cornerRadius = thirdVuiew.frame.height / 2
        fourthVuiew.layer.cornerRadius = fourthVuiew.frame.height / 2
        buttonVie.layer.cornerRadius = 30
        
        roomOuterView.layer.cornerRadius = 25
        roomInnerView.layer.cornerRadius = 10
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let med = dataSource[indexPath.row]
        
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell
        
        cell?.img.image = UIImage(named: med.img)
        cell?.name.text = med.name
        cell?.count.text = med.numverOfPills
        cell?.layer.cornerRadius = 30
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 190)
    }
    
}

