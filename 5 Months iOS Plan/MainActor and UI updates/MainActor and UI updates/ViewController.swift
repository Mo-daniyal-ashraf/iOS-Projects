//
//  ViewController.swift
//  MainActor and UI updates
//
//  Created by Mddaniyal on 5/20/25.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        Task.detached {
            print(Thread.isMainThread ? "Amin" : "back")

            await self.fetchAPi_1()
        }
        
//        fetchAPI_2()
    }
    
//    @MainActor
    func updateUi(with: String) {
        
        self.lbl.text = with
    }
    
    func fetchAPI_2() {
        
         URLSession.shared.dataTask(with: URL(string: "https://catfact.ninja/fact")!) { data, response, error in
         
            if error != nil && data == nil {
                return
            }
            guard let data = data else { return }
            
             do {
                 let json = try JSONSerialization.jsonObject(with: data)
                 print(Thread.isMainThread ? "Amin" : "back")

                 if let str = json as? [String:Any],
                    let catfact = str["fact"] as? String {
                     
//                     Task {
//                        self.updateUi(with: catfact)
//                     }
//
                 }
                 print("🐱 Cat Fact JSON: \(json)")
             } catch {
                 print("❌ JSON decoding error: \(error.localizedDescription)")
             }
            
         }.resume()
    }
    
    
    func fetchAPi_1() async {
        
        do {
            
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://catfact.ninja/fact")!)
            print(Thread.isMainThread)

            let jsonData = try JSONSerialization.jsonObject(with: data)
            
            if let str = jsonData as? [String:Any],
               let catfact = str["fact"] as? String {
                
                
                updateUi(with: catfact)
            }

            print(jsonData)
            
        } catch let error {
            
            print(error.localizedDescription)
        }
    }
}

