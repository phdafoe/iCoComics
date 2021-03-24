//  Utils.swift.swift
//  Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation
import CryptoSwift
import UIKit

// MARK: - ApiError
enum APIError: Error, CustomNSError {
    
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    case missingTimestamp
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fecth data"
        case .invalidEndpoint: return "Invalid enpoint"
        case .invalidResponse: return "Invalild response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        case .missingTimestamp: return "Missing Timestamp"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}

// MARK: - AcceptResponseType
public enum AcceptResponseType {
    case json
    case pdf
    case xml
    case text
}

// MARK: - HTTPMethod
public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

// MARK: - RequestData
struct RequestData {
    var params: [String: Any]?
    var arrayParams: [[String: Any]]?
    var method: HTTPMethod
    var urlContext: URLEndpoint.BaseURLContext
    var endpoint: String
    var acceptType = AcceptResponseType.json

    init(params: [String: Any]?,
         method: HTTPMethod,
         urlContext: URLEndpoint.BaseURLContext,
         endpoint: String,
         acceptType: AcceptResponseType = .json) {

        self.params = params
        self.method = method
        self.urlContext = urlContext
        self.endpoint = endpoint
        self.acceptType = acceptType
    }

    init(arrayParams: [[String: Any]]?,
         method: HTTPMethod,
         endpoint: String,
         urlContext: URLEndpoint.BaseURLContext,
         acceptType: AcceptResponseType = .json) {

        self.arrayParams = arrayParams
        self.method = method
        self.urlContext = urlContext
        self.endpoint = endpoint
        self.acceptType = acceptType
    }
}

//MARK: - URLEndpoint
struct URLEndpoint {
    
    public enum BaseURLContext {
        case backend
        case webService
    }

    //ENDPOINTS
    static var comics = "comics"
    static var series = "series"
    static var stories = "stories"
    
}

//MARK: - extension - URLEndpoint
extension URLEndpoint {
    static func getBaseUrl(urlContext: BaseURLContext) -> String {
        
        switch urlContext {
        case .backend:
            return "my backend service"
        case .webService:
            return "https://gateway.marvel.com/v1/public/"
        }
    }
}

class Utils{
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
    
    //MARK: - GET TIMESTAMP
    func getTimeStamp() -> String{
        let xData = Int(round(Date().timeIntervalSince1970))
        return "\(xData)"
    }
    
    //MARK: - GET HASH
    func getHash() -> String{
        let pTimeStamp = self.getTimeStamp()
        let hash = (pTimeStamp+Utils.BaseURL().privateApiKey+Utils.BaseURL().publicApiKey).md5()
        return hash
    }
    
    struct BaseURL {
        let publicApiKey = "96883215ffa72a3c8dfa23e3883f6866"
        let privateApiKey = "9d1a45359c89f37c4e2d5a0ee6d826572624e785"
        let baseAPIURL = "https://gateway.marvel.com/v1/public"
        let urlSession = URLSession.shared
        let jsonDecoder = Utils.jsonDecoder
    }
}

// MARK: - ImageLoader
private let _imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader : ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false
    
    var imageCache = _imageCache
    
    func loadImage(whit url: URL) {
        let urlString = url.absoluteString
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    return
                }
                self.imageCache.setObject(image, forKey: urlString as AnyObject)
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
