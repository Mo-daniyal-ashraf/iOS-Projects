//
//  ViewController.swift
//  NavigationApp
//
//  Created by MdAshraf on 09/12/1946 Saka.
//

import UIKit

class ViewController: UIViewController {

    var nextButton = UIButton()
    
    func setUpButton() {
        nextButton.configuration = .filled()

        nextButton.configuration?.title = "Next screen"
        nextButton.configuration?.baseBackgroundColor = .white
        nextButton.configuration?.baseForegroundColor = .black
        view.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 150),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
       ])
        
        nextButton.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "First screen"
        setUpButton()
    }
    
    @objc func handleButton() {
        
        print("Button clicked!")
        let nextscreen = Nextscreen()
        navigationController?.pushViewController(nextscreen, animated: true)
    }
    

}

