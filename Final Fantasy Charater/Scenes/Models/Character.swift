//
//  CharacterModel.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 11/01/21.
//

import Foundation

struct Character: Decodable {
    let avatar: String
    let id: Int
    let lang, name: String

    enum CodingKeys: String, CodingKey {
        case avatar = "Avatar"
        case id = "ID"
        case lang = "Lang"
        case name = "Name"
    }
}
