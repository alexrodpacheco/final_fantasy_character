//
//  CharacterCellService.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 04/03/21.
//

import Foundation
import UIKit

class CharacterCellService {
    
    func getImage (url: String, _ completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    // FIXME: Tirar prints e force unwrapps
                    completion(.failure(error!))
                    
                }
                guard let data = data, let image = UIImage(data: data) else {
                    return
                }
                completion(.success(image))
            }
            
            task.resume()
        }
    }
}
