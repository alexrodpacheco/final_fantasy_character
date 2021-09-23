import Foundation

class DetailService {
    
    func getDetails (id:Int, _ completion: @escaping (Result<DetailsClass, Error>) -> Void) {
        
        let urlString = "https://xivapi.com/character/\(id)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.URLError))
            return
        }
        
        let api = API<DetailsClass>(url: url)
        api.execute { (result) in
            completion(result)
        }
    }
}

