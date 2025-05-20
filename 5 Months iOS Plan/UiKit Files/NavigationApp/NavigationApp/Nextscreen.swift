//
//  Nextscreen.swift
//  NavigationApp
//
//  Created by MdAshraf on 09/12/1946 Saka.
//

import UIKit

class Nextscreen: UIViewController {
    
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
        
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Second screen"
        setUpButton()
    }
    
    @objc func goToNextScreen() {
        
        let thirdscreen = ThirdScreen()
        navigationController?.pushViewController(thirdscreen, animated: true)
    }
}
