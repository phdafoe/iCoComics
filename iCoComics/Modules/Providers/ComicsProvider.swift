//
//  Created on 24/03/2021.
// subfolder/Filename.swift - Very brief description
//
// This source file is part of the everis open source project in iOS Desktop
//
// Copyright (c) 2020 EVERIS Sl. and the Swift project authors iOS Desktop
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://steps.everis.com/git/MOVILIDAD/architecture-swiftui-ios/-/blob/master/README.md for text information
//
// -----------------------------------------------------------------------------
///
/// This file contains stuff that I am describing here in the header and will
/// be sure to keep up to date.
///
// -----------------------------------------------------------------------------

import Foundation

protocol ComicsProviderProtocol {
    func fetchDataComicsFromWeb(_ completion: @escaping (ComicsModel?) -> (), failure: @escaping(APIError) -> ())
    func fetchDataSeriesFromWeb(_ completion: @escaping (SeriesModel?) -> (), failure: @escaping(APIError) -> ())
    func fetchDataStoriesFromWeb(_ completion: @escaping (StoriesModel?) -> (), failure: @escaping(APIError) -> ())
    func fetchDataEventsFromWeb(_ completion: @escaping (EventsModel?) -> (), failure: @escaping(APIError) -> ())
    func fetchDataCharactersFromWeb(_ completion: @escaping (CharacteresModel?) -> (), failure: @escaping(APIError) -> ())
}

class ComicsProvider: ComicsProviderProtocol {

    private let dataService = BaseProvider()
    
    internal func fetchDataComicsFromWeb(_ completion: @escaping (ComicsModel?) -> (), failure: @escaping(APIError) -> ()) {

        ///Example call webservice
        let parameters = [
            "orderBy": "title",
            "limit": "10",
            "hash": "\(Utils().getHash())",
            "ts": "\(Utils().getTimeStamp())"
        ]
        let providerRD = RequestData(params: parameters, method: .get, urlContext: .webService, endpoint: URLEndpoint.comics)
        
        self.dataService.request(request: providerRD,
                                 entityClass: ComicsModel.self) { [weak self] (result) in
            guard self != nil else { return }
            if let resultDes = result {
                completion(resultDes)
            }
        } failure: { (error) in
            failure(error)
        }
    }
    
    internal func fetchDataSeriesFromWeb(_ completion: @escaping (SeriesModel?) -> (), failure: @escaping(APIError) -> ()) {
        ///Example call webservice
        let parameters = [
            "limit": "10",
            "contains": "comic",
            "orderBy": "title",
            "hash": "\(Utils().getHash())",
            "ts": "\(Utils().getTimeStamp())"
        ]
        let providerRD = RequestData(params: parameters, method: .get, urlContext: .webService, endpoint: URLEndpoint.series)
        
        self.dataService.request(request: providerRD,
                                 entityClass: SeriesModel.self) { [weak self] (result) in
            guard self != nil else { return }
            if let resultDes = result {
                completion(resultDes)
            }
        } failure: { (error) in
            failure(error)
        }
    }
    
    internal func fetchDataStoriesFromWeb(_ completion: @escaping (StoriesModel?) -> (), failure: @escaping(APIError) -> ()) {
        ///Example call webservice
        let parameters = [
            "limit": "10",
            "orderBy": "id",
            "hash": "\(Utils().getHash())",
            "ts": "\(Utils().getTimeStamp())"
        ]
        let providerRD = RequestData(params: parameters, method: .get, urlContext: .webService, endpoint: URLEndpoint.stories)
        
        self.dataService.request(request: providerRD,
                                 entityClass: StoriesModel.self) { [weak self] (result) in
            guard self != nil else { return }
            if let resultDes = result {
                completion(resultDes)
            }
        } failure: { (error) in
            failure(error)
        }
    }
    
    internal func fetchDataEventsFromWeb(_ completion: @escaping (EventsModel?) -> (), failure: @escaping(APIError) -> ()) {
        ///Example call webservice
        let parameters = [
            "limit": "10",
            "orderBy": "name",
            "hash": "\(Utils().getHash())",
            "ts": "\(Utils().getTimeStamp())"
        ]
        let providerRD = RequestData(params: parameters, method: .get, urlContext: .webService, endpoint: URLEndpoint.events)
        
        self.dataService.request(request: providerRD,
                                 entityClass: EventsModel.self) { [weak self] (result) in
            guard self != nil else { return }
            if let resultDes = result {
                completion(resultDes)
            }
        } failure: { (error) in
            failure(error)
        }
    }
    
    internal func fetchDataCharactersFromWeb(_ completion: @escaping (CharacteresModel?) -> (), failure: @escaping(APIError) -> ()) {
        ///Example call webservice
        let parameters = [
            "limit": "5",
            "orderBy": "name",
            "hash": "\(Utils().getHash())",
            "ts": "\(Utils().getTimeStamp())"
        ]
        let providerRD = RequestData(params: parameters, method: .get, urlContext: .webService, endpoint: URLEndpoint.characters)
        
        self.dataService.request(request: providerRD,
                                 entityClass: CharacteresModel.self) { [weak self] (result) in
            guard self != nil else { return }
            if let resultDes = result {
                completion(resultDes)
            }
        } failure: { (error) in
            failure(error)
        }
    }
}


