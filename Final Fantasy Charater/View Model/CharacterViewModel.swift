//
//  CharacterViewModel.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 25/01/21.
//

import Foundation

protocol CharacterSucess {
    func characterSucess(sucess: [Character])
}

protocol CharacterError {
    func characterError (error: Error)
}

class CharacterViewModel {
    
    func loadCharacter() {
        let characterService = CharacterService()
        characterService.fetchCharacter { [weak self] result in
            switch result {
            case let .failure(error):
                self?.errorDelegate?.characterError(error: error)
            case let .success(character):
                self?.sucessDelegate?.characterSucess(sucess: character)
            }
        }

    }
    
    var sucessDelegate: CharacterSucess?
    var errorDelegate: CharacterError?
}
