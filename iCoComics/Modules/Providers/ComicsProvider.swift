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
    func fetchDataFromWeb(_ completion: @escaping (ComicsModel?) -> (), failure: @escaping(APIError) -> ())
}

class ComicsProvider: ComicsProviderProtocol {

    private let dataService = BaseProvider()
    
    internal func fetchDataFromWeb(_ completion: @escaping (ComicsModel?) -> (), failure: @escaping(APIError) -> ()) {

        ///Example call webservice
        let parameters = [
            "orderBy": "title",
            "limit": "20",
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
}


