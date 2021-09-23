import Foundation

class API<Model: Decodable> {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func execute(_ completion: @escaping (Result<Model, Error>) -> Void) {
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(APIError.dataTaskError(error: error)))
                return
            }
            
            guard let detailsJSON = data else {
                completion(.failure(APIError.dataNotFound))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Model.self, from: detailsJSON)
                completion(.success(model))
            }
            
            catch {
                completion(.failure(APIError.decoderError(error: error)))
            }
        }
        task.resume()
    }
}
