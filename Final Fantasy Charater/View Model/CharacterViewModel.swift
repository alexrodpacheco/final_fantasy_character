//
//  CharacterViewModel.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 25/01/21.
//

import Foundation

class CharacterViewModel {
    
    func loadCharacter() {
        let characterService = CharacterService()
        characterService.fetchCharacter()
    }
}
