//
//  ClassJobs.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 22/02/21.
//

struct ActiveClassJob: Decodable {
    let classID: Int
    let expLevel: Int
    let expLevelMax: Int
    let level: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case classID = "ClassID"
        case expLevel = "ExpLevel"
        case expLevelMax = "ExpLevelMax"
        case level = "Level"
        case name = "Name"
    }
}
