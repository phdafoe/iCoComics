// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let listCharacteresModel = try? newJSONDecoder().decode(ListCharacteresModel.self, from: jsonData)

import Foundation

// MARK: - ListCharacteresModel
struct CharacteresModel: Decodable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let etag: String?
    let data: DataClassCharacters?

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case status = "status"
        case copyright = "copyright"
        case attributionText = "attributionText"
        case attributionHTML = "attributionHTML"
        case etag = "etag"
        case data = "data"
    }
}

// MARK: - DataClass
struct DataClassCharacters: Decodable  {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [ResultCharacter]?

    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case limit = "limit"
        case total = "total"
        case count = "count"
        case results = "results"
    }
}

// MARK: - Result
struct ResultCharacter: Decodable, Identifiable  {
    let id: Int?
    let name: String?
    let resultDescription: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics: Comics?
    let series: Comics?
    let stories: Stories?
    let events: Events?
    let urls: [URLElement]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case resultDescription = "description"
        case modified = "modified"
        case thumbnail = "thumbnail"
        case resourceURI = "resourceURI"
        case comics = "comics"
        case series = "series"
        case stories = "stories"
        case events = "events"
        case urls = "urls"
    }
}
