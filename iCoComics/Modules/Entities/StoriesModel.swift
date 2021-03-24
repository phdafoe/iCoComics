// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let storiesModel = try? newJSONDecoder().decode(StoriesModel.self, from: jsonData)

import Foundation

// MARK: - StoriesModel
struct StoriesModel: Decodable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let etag: String?
    let data: DataClassStories?

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
struct DataClassStories: Decodable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [ResultStories]?

    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case limit = "limit"
        case total = "total"
        case count = "count"
        case results = "results"
    }
}

// MARK: - Result
struct ResultStories: Decodable, Identifiable  {
    let id: Int?
    let title: String?
    let resultDescription: String?
    let resourceURI: String?
    let type: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let creators: Creators?
    let characters: Characters?
    let series: Comics?
    let comics: Comics?
    let events: Characters?
    let originalIssue: OriginalIssue?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case resultDescription = "description"
        case resourceURI = "resourceURI"
        case type = "type"
        case modified = "modified"
        case thumbnail = "thumbnail"
        case creators = "creators"
        case characters = "characters"
        case series = "series"
        case comics = "comics"
        case events = "events"
        case originalIssue = "originalIssue"
    }
}

// MARK: - OriginalIssue
struct OriginalIssue: Codable {
    let resourceURI: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case resourceURI = "resourceURI"
        case name = "name"
    }
}

