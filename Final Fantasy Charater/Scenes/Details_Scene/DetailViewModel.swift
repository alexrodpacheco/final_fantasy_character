//
//  DetailViewModel.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 25/02/21.
//

import Foundation

protocol DetailSucess {
    func detailsSucess(sucess: DetailsClass)
}

protocol DetailError {
    func detailError (error: Error)
}

class DetailViewModel {
    
    func loadDetail() {
        let service = DetailService()
        service.getDetails { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let classJob):
                    self.sucessDelegate?.detailsSucess(sucess: classJob)
                case .failure(let error):
                    self.sucessError?.detailError(error: error)
                }
            }
            
        }
    }
    
    var sucessDelegate: DetailSucess?
    var sucessError: DetailError?
}
