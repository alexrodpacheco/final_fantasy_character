//
//  ViewController.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 11/01/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://xivapi.com/character/search?name=zidane"
        
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                }
                
                //let data = String(data: data!, encoding: .utf8)
                
                do {
                    let decoder = JSONDecoder()
                    let characters = try decoder.decode(Results.self, from: data!)
                    print(characters)
                    
                } catch  let error {
                    print(error)
                }
            }
            
            task.resume()
        }
        
        
    }
    
    
}

