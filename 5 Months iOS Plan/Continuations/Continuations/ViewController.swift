//
//  ViewController.swift
//  Continuations
//
//  Created by Mddaniyal on 5/20/25.
//

import UIKit

struct Posts: Decodable, Identifiable {
    
    let id: Int
    let post: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        Task {
            let fact = await displayData()
            print(fact)
        }
        
    }
    
    func displayData() async -> String {
        
        await withCheckedContinuation({ continuation in
            fetchData { fact in
                continuation.resume(returning: fact)
            }
        })
    }
    
    func fetchData(completion: @escaping (String) -> Void) {
        
        URLSession.shared.dataTask(with: URL(string: "https://catfact.ninja/fact")!) { Data, response, error in
            
            guard let data = Data else { return }

            do {
                
                let json = try JSONSerialization.jsonObject(with: data)
                
                if let dict = json as? [String:Any],
                   let fact = dict["fact"] as? String {
                    completion(fact)
                    return
                }
            } catch {
                completion("error")
            }

        }.resume()
    }
    

    
}

