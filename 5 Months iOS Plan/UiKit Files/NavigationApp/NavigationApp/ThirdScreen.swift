//
//  ThirdScreen.swift
//  NavigationApp
//
//  Created by MdAshraf on 09/12/1946 Saka.
//

import UIKit

class ThirdScreen: UIViewController {
    
    var nextButton = UIButton()

    func setUpButton() {
        nextButton.configuration = .filled()

        nextButton.configuration?.title = "Next screen"
        nextButton.configuration?.baseBackgroundColor = .white
        nextButton.configuration?.baseForegroundColor = .black

        nextButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 150),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
       ])
        
        nextButton.addTarget(self, action: #selector(goToHomeScreen), for: .touchUpInside)
    }
    
    @objc func goToHomeScreen() {
        
        let homeScreen = ViewController()
        navigationController?.pushViewController(homeScreen, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        title = "Go to Home"
        setUpButton()
    }
}
