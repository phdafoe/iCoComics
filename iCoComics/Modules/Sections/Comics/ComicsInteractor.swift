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

protocol ComicsInteractorPresenterInterface: InteractorPresenterInterface {
    func fetchDataComicsInteractor()
    func fetchDataSeriesInteractor()
    func fetchDataStoriesInteractor()
    func fetchDataEventsInteractor()
}

class ComicsInteractor: InteractorInterface {

    // MARK: VIPER Dependencies
    weak var presenter: ComicsPresenterInteractorInterface!
    var provider: ComicsProviderProtocol = ComicsProvider()
    
    // MARK: Private Functions

}

extension ComicsInteractor: ComicsInteractorPresenterInterface {

    func fetchDataComicsInteractor() {
        //1
        self.provider.fetchDataComicsFromWeb { [weak self] (resultComicsModel) in
            guard let self = self else { return }
            if let resultComicsModelDes = resultComicsModel {
                self.presenter.getDataComicsModelFromInteractor(data: resultComicsModelDes.data?.results)

            }
        } failure: { (errorApi) in
            print(errorApi.localizedDescription)
        }

    }
    
    func fetchDataSeriesInteractor() {
        //2
        self.provider.fetchDataSeriesFromWeb { [weak self] (resultSeriesModel) in
            guard let self = self else { return }
            if let resultSeriesModelDes = resultSeriesModel {
                self.presenter.getDataSeriesModelFromInteractor(data: resultSeriesModelDes.data?.results)
                

            }
        } failure: { (errorApi) in
            print(errorApi.localizedDescription)
        }

    }
    
    func fetchDataStoriesInteractor() {
        //3
        self.provider.fetchDataStoriesFromWeb { [weak self] (resultStoriesModel) in
            guard let self = self else { return }
            if let resultStoriesModelDes = resultStoriesModel {
                self.presenter.getDataStoriesModelFromInteractor(data: resultStoriesModelDes.data?.results)
            }
        } failure: { (errorApi) in
            print(errorApi)
        }

    }
    
    func fetchDataEventsInteractor() {
        //4
        self.provider.fetchDataEventsFromWeb { [weak self] (resultEventsModel) in
            guard let self = self else { return }
            if let resultEventsModelDes = resultEventsModel {
                self.presenter.getDataEventsModelFromInteractor(data: resultEventsModelDes.data?.results)
            }
        } failure: { (errorApi) in
            print(errorApi)
        }
    }
    
    func fetchDataCharactersInteractor() {
        //4
        self.provider.fetchDataCharactersFromWeb { [weak self] (resultCharactersModel) in
            guard let self = self else { return }
            if let resultCharactersModelDes = resultCharactersModel {
                self.presenter.getDataCharactersModelFromInteractor(data: resultCharactersModelDes.data?.results)
            }
        } failure: { (errorApi) in
            print(errorApi)
        }
    }
    
    
}
