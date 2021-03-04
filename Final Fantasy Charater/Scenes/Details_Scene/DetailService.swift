//
//  DetailService.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 04/03/21.
//

import Foundation

class DetailService {
    
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
