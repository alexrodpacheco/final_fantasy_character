//
//  Results.swift
//  Final Fantasy IX
//
//  Created by Alex Rodrigues Pacheco on 11/01/21.
//

import Foundation

struct Results: Decodable {
    let page: Int
    let results: [Character]
    
    enum CodingKeys: String, CodingKey {
        case pagination = "Pagination"
        case page = "Page"
        case results = "Results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let pagination = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .pagination)
        page = try pagination.decode(Int.self, forKey: .page)
        results = try container.decode([Character].self, forKey: .results)
    }
    
}
