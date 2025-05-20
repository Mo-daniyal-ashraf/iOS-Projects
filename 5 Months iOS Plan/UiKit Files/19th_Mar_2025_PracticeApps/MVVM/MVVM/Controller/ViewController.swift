//
//  ViewController.swift
//  MVVM
//
//  Created by Mddaniyal on 3/19/25.
//

import UIKit

class ViewController: UIViewController {

    private var viewModel = QuestionsModel()
    
    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewModel.questions = []
        tableView.dataSource = self
        
    }
    
    @IBAction func btnTapped(_ sender: Any) {
        
        if let que = inputText.text, !que.isEmpty {
            
            viewModel.questions?.append(Questions(question: que))
            print(que)
            inputText.text = ""
            tableView.reloadData()
        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.questions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.questions?[indexPath.row].question
        cell.selectionStyle = .none
        return cell
    }
}
