//
//  CharacterService.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 25/01/21.
//

import Foundation
import UIKit

class CharacterService {
    
    func fetchCharacter(_ completion: @escaping (Result<[Character], Error>) -> Void) {
        
        let url = "https://xivapi.com/character/search?name=zidane"
        
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    //print(error)
                    // FIXME: Tirar prints e force unwrapps
                        completion(.failure(error))
                    
                }
                
                //let data = String(data: data!, encoding: .utf8)
                guard let jsonData = data else {
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let characters = try decoder.decode(Results.self, from: jsonData)
                    //print(characters)
                    completion(.success(characters.characters))
                    
                    
                } catch  let error {
                    print(error)
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
    }
    
    func getImage (url: String, _ completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    // FIXME: Tirar prints e force unwrapps
                        completion(.failure(error!))
                    
                }
                guard let data = data, let image = UIImage(data: data) else {
                    print("Nao tem data")
                    return
                }
                completion(.success(image))
            }
            
            task.resume()
        }
    }
    
    
    func getDetails (_ completion: @escaping (Result<DetailsClass, Error>) -> Void) {
        
        let urlString = "https://xivapi.com/character/5805404"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error)
                    
                }
                
                guard let detailsJSON = data else {
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let details = try decoder.decode(DetailsClass.self, from: detailsJSON)
                    print(details)
                    completion(.success(details))
                    
                }
                
                catch {
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
}


