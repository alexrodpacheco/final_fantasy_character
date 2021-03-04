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
                    completion(.success(characters.characters))
                } catch  let error {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
    }
}


