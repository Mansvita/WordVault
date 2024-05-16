

import Foundation

// MARK: - DicData
struct DicData: Codable {
    let id: ID?
    let word, definition: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case word, definition
        case v = "__v"
    }
}

// MARK: - ID
struct ID: Codable {
    let oid: String?

    enum CodingKeys: String, CodingKey {
        case oid = "$oid"
    }
}
