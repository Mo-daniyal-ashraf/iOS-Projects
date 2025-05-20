//
//  ViewController.swift
//  EXP
//
//  Created by Mddaniyal on 3/6/25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak  var myColletionView: UICollectionView!
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        myColletionView.delegate = self
        myColletionView.dataSource = self
        print(view.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = myColletionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImageCollectionViewCell
    
        cell?.img.image = UIImage(named: "img1")
        
        return cell!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width / 3 - 10
          let height = width * 1.2

          return CGSize(width: 400, height: 900)
    }
    
}

