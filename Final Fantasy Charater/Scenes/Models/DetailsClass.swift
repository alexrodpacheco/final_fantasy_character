//
//  Details.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 22/02/21.
//

struct DetailsClass: Decodable {
    let avatar: String
    let bio: String
    let activeClassJob: ActiveClassJob
    
    enum CodingKeys: String, CodingKey {
            case character = "Character"
            case avatar = "Avatar"
            case bio = "Bio"
            case activeClassJob = "ActiveClassJob"
    }

}

extension DetailsClass {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let character = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .character)
        avatar = try character.decode(String.self, forKey: .avatar)
        bio = try character.decode(String.self, forKey: .bio)
        activeClassJob = try character.decode(ActiveClassJob.self, forKey: .activeClassJob)
    }
}

