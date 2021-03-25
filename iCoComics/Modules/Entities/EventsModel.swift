// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let eventsModel = try? newJSONDecoder().decode(EventsModel.self, from: jsonData)

import Foundation

// MARK: - EventsModel
struct EventsModel: Decodable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let etag: String?
    let data: DataClassEvents?

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
struct DataClassEvents: Decodable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [ResultEvents]?

    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case limit = "limit"
        case total = "total"
        case count = "count"
        case results = "results"
    }
}

// MARK: - Result
struct ResultEvents: Decodable, Identifiable  {
    let id: Int?
    let title: String?
    let resultDescription: String?
    let resourceURI: String?
    let urls: [URLElement]?
    let modified: String?
    let start: String?
    let end: String?
    let thumbnail: Thumbnail?
    let creators: Creators?
    let characters: Characters?
    let stories: Stories?
    let comics: Characters?
    let series: Characters?
    let next: Next?
    let previous: Next?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case resultDescription = "description"
        case resourceURI = "resourceURI"
        case urls = "urls"
        case modified = "modified"
        case start = "start"
        case end = "end"
        case thumbnail = "thumbnail"
        case creators = "creators"
        case characters = "characters"
        case stories = "stories"
        case comics = "comics"
        case series = "series"
        case next = "next"
        case previous = "previous"
    }
}

