import Foundation
import UIKit

class CharacterService {
    
    func fetchCharacter(_ completion: @escaping (Result<[Character], Error>) -> Void) {
        
        let urlString = "https://xivapi.com/character/search?name=zidane"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let api = API<Results>(url:url)
        api.execute { (result) in
            switch result {
            case .success(let results):
                completion(.success(results.characters))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


